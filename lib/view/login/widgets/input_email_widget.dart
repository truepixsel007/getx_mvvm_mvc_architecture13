

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/utils.dart';
import '../../../view_models/controller/login/login_view_model.dart';

class InputEmailWidget extends StatelessWidget {
  InputEmailWidget({super.key});

  final loginVM =  Get.put(LoginViewModel()) ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: loginVM.emailController.value,
      focusNode: loginVM.emailFocusNode.value,
      validator: (value){
        if(value!.isEmpty){
          Utils.snakBar('Email', 'Enter email');
        }
      },
      onFieldSubmitted: (value){
        Utils.fieldFocusChange(context, loginVM.emailFocusNode.value, loginVM.passwordFocusNode.value);
      },
      decoration: InputDecoration(
          hintText: 'email_hint'.tr,
          border: OutlineInputBorder()
      ),
    );
  }
}
