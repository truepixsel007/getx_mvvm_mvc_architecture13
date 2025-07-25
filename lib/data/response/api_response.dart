

import 'package:getx_mvvm_mvc_architecture13/data/response/status.dart';

//Gernaric Class make , dynamic data pass
class ApiResponse<T> {

  //status defined
  Status? status ;
  //dynamic data pass
  T? data;
  //message defined
  String? message;

  ApiResponse(this.status, this.data,  this.message) ;

  //use when use api

  //status pass , api response in loading then loading show
  ApiResponse.loading() : status = Status.LOADING ;
  //status pass , api response in completed then data pass krna hai
  ApiResponse.completed(this.data) : status = Status.COMPLETED ;
  //status pass , api response in error then massage pass
  ApiResponse.error(this.message) : status = Status.ERROR ;

  @override toString(){
    return "Status : $status \n Massage : $message \n Data: $data";
  }

}