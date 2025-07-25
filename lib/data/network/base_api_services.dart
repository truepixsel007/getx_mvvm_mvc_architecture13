

abstract class BaseApiServices {

  //funcition make jo dynamic return hoga
  //getApi
  Future<dynamic> getApi(String url);

  //postApi
  //dynamic data parameter te through bhajte hai  form data , urlencoded data
  Future<dynamic> postApi(dynamic data, String url);

}