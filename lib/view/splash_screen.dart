

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_mvc_architecture13/res/assets/image_assets.dart';
import 'package:getx_mvvm_mvc_architecture13/res/components/round_button.dart';
import 'package:getx_mvvm_mvc_architecture13/view_models/services/splash_services.dart';

import '../data/app_exceptions.dart';
import '../res/components/general_exception.dart';
import '../res/components/internet_exceptions_widget.dart';
import '../utils/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashServices splashScreen = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreen.isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text('email_hint'.tr),
     ),
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            InterNetExceptionWidget(onPress: (){},),
            GeneralExceptionWidget(onPress: (){},),
             RoundButtton(
                 title:'Login',
                 width: double.infinity,
                 loading: false,
                 onPress:(){}
             ),
            Image(
              width: 50,
              height: 50,
              image: AssetImage(ImageAssets.splashScreen),
            ),
            Text('welcome_back'.tr)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Utils.toastMessage('arsh deep');
          Utils.toastMessageCenter('prience');
        },
      ),
    );
  }
}
