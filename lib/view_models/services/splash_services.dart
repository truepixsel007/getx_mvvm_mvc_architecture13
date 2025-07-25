
import 'dart:async';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:getx_mvvm_mvc_architecture13/res/routes/routes_name.dart';
import 'package:getx_mvvm_mvc_architecture13/view_models/controller/user_preference/user_preference_view_model.dart';

class SplashServices{

  UserPreference userPreference = UserPreference();
  void isLogin(){

    userPreference.getUser().then((value){
      print(value.token);
      print(value.isLogin);
      if(value.isLogin == false || value.isLogin.toString() == 'null'){
        Timer(const Duration(seconds: 3),
                () => Get.toNamed(RouteName.loginView)
        );
      }else{
        Timer(const Duration(seconds: 3),
                () => Get.toNamed(RouteName.homeView)
        );
      }
    });

  }
}