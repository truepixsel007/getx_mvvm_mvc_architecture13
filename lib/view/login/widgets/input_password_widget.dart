




import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/utils.dart';
import '../../../view_models/controller/login/login_view_model.dart';

class InputPasswordWidget extends StatelessWidget {
  InputPasswordWidget({super.key});

  final loginVM =  Get.put(LoginViewModel()) ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: loginVM.passwordController.value,
      focusNode: loginVM.passwordFocusNode.value,
      obscureText: loginVM.passwordObscured.value,
      obscuringCharacter: '*',
      validator: (value){
        if(value!.isEmpty){
          Utils.snakBar('Password', 'Enter password');
        }
      },
      onFieldSubmitted: (value){
      },
      decoration: InputDecoration(
          hintText: 'password_hint'.tr,
          border: OutlineInputBorder(),
          suffixIcon: IconButton(
            onPressed: (){
              // print(value);
              loginVM.passwordObscured.value =
              !loginVM.passwordObscured.value;
              // setState(() {
              //   passwordObscured = !passwordObscured;
              // });
            }, icon: Icon( loginVM.passwordObscured.value?
          Icons.visibility :  Icons.visibility_off,
          ),
          )
      ),
    );
  }
}

