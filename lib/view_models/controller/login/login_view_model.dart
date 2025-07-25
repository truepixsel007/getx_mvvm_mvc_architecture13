

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_mvc_architecture13/models/login/user_model.dart';
import 'package:getx_mvvm_mvc_architecture13/repository/login_repository/login_repository.dart';
import 'package:getx_mvvm_mvc_architecture13/utils/utils.dart';

import '../../../res/routes/routes_name.dart';
import '../user_preference/user_preference_view_model.dart';



class LoginViewModel extends GetxController{

  UserPreference userPreference = UserPreference();

  final _api  = LoginRepository();

  final emailController = TextEditingController().obs ;
  final passwordController = TextEditingController().obs ;

  final emailFocusNode = FocusNode().obs;

  final passwordFocusNode = FocusNode().obs;


  RxBool passwordObscured  = true.obs;

  RxBool loading = false.obs;

  void loginApi(){
    loading.value = true;
    // jo data ham bheje ge
    // two parameters requried
    Map data = {
      'email' : emailController.value.text,
       'password': passwordController.value.text

    };
    _api.loginApi(data).then((value){
      loading.value = false;
      // ye positive response hai 400 pr
      if(value['error'] == 'user not found'){
        Utils.snakBar('Login', value['error']);
      }else{
        UserModel userModel = UserModel(
          token: value['token'],
          isLogin: true
        );
        userPreference.saveUser(userModel).then((value){
          Get.delete<LoginViewModel>();
          Get.toNamed(RouteName.homeView)!.then((value) {

          });
          Utils.snakBar('Login', 'login successfully');
        }).onError((error, stackTrace){

        });


      }
    }).onError((error, stackTrace) {
       loading.value = false;
       Utils.snakBar('Error', error.toString());
       print(error.toString());
    });
  }

}