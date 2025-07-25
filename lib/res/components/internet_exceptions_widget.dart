

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_mvc_architecture13/res/colors/app_color.dart';

import '../fonts/app_fonts.dart';

class InterNetExceptionWidget extends StatefulWidget {
  final VoidCallback onPress;
  const InterNetExceptionWidget({Key? key, required this.onPress})   : super(key: key);

  @override
  State<InterNetExceptionWidget> createState() => _InterNetExceptionWidgetState();
}

class _InterNetExceptionWidgetState extends State<InterNetExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 2),
      child:  Column(
        children: [
          // SizedBox(height:height * .7,),
          Icon(Icons.cloud_off,color: AppColor.redColor,size: 10,),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Center(child: Text('internet_exception'.tr,textAlign:TextAlign.center, style: TextStyle(fontFamily:AppFonts.roboto),)),
          ),
          // SizedBox(height:height * .7,),
          InkWell(
            onTap: widget.onPress,
            child: Container(
              height: 22,
              width: 80,
              decoration: BoxDecoration(
               color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(25)
              ),
              child: Center(child: Text('Retry',style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),)),
            ),
          )
        ],
      ),
    ) ;
  }
}
