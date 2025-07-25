

import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:getx_mvvm_mvc_architecture13/data/app_exceptions.dart';

import 'base_api_services.dart';
import 'package:http/http.dart' as http ;

class NetworkApiServices extends BaseApiServices {

  @override
  Future<dynamic> getApi(String url) async{

    //vhA se jo data aa raha hai , ye dedug mode me print krega
    if(kDebugMode){
      print(url);
    }


    dynamic  responseJson ;
    try{
      //timout ki exception lagani hai , posho backend developer from how much time
      final response = await http.get(Uri.parse(url),
      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    }
    // ki aapke pass internet nahi hai
    on SocketException {
      throw  InternetException('');
    }

    on RequestTimeOut {
      throw RequestTimeOut('');
    }

    return responseJson ;
  }

  @override
  Future<dynamic> postApi(var data , String url) async{

    if(kDebugMode){
      print(url);
      print(data);
    }

    dynamic  responseJson ;
    try{
      //timout ki exception lagani hai , posho backend developer from how much time
      final response = await http.post(Uri.parse(url),
          // row form data hoga iss tra code, backend bajta hai
          // body: jsonEncode(data)
        //     hum isko Encode nahi kr sakte , reason is  ye form data use kr rahe hai

        // agar post api me  data  raw form  me ho to encode kre ge , raw form data nahi hai encode nahi krege

        //form data me backend bajta hai
            body: data

      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    }
    // ki aapke pass internet nahi hai
    on SocketException {
      throw  InternetException('');
    }

    on RequestTimeOut {
      throw RequestTimeOut('');
    }


      print(responseJson);

    return responseJson ;
  }



  dynamic returnResponse(http.Response response){
    print(response.body.toString());
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson ;

      case 400:
        // data ko return krvana chahiye , na ki exception ko return krvana chahiye
        // throw InvalidUrlException();

      // agar 403 hota  to ham kahte invalid token

        dynamic responseJson = jsonDecode(response.body);
        return responseJson ;
      default :
        throw FetchDataException('Error accooured while commucating with server' + response.statusCode.toString());
    }
  }

}

