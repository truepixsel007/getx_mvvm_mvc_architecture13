
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_mvc_architecture13/res/colors/app_color.dart';

class Utils{

  static void fieldFocusChange(BuildContext context , FocusNode current , FocusNode nextFocus){
    current .unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message){
    Fluttertoast.showToast(
        msg: message,
        backgroundColor:  AppColor.blackColor,
        gravity: ToastGravity.BOTTOM,
        textColor: AppColor.whiteColor,
        toastLength: Toast.LENGTH_LONG
    );
  }

  static toastMessageCenter(String message){
    Fluttertoast.showToast(
      msg: message,
      backgroundColor:  AppColor.blackColor,
      gravity: ToastGravity.CENTER,
      textColor: AppColor.whiteColor,
      toastLength: Toast.LENGTH_LONG
    );
  }


  static snakBar(String title,String message){
    Get.snackbar(title , message);
  }

}