

class AppExceptions implements Exception{

  final _message ;
  final _prefix;

  AppExceptions ([this._message, this._prefix]) ;

  String toString(){
    return '$_prefix$_message';
  }
}

//internet Exception Handle them
class InternetException extends AppExceptions {
  InternetException([String? message]) : super(message, 'not internet');
}

//RequestTimeOut Exception Handle them
class RequestTimeOut extends AppExceptions {
  RequestTimeOut([String? message]) : super(message, 'Request Time Out');
}

// ServicesException Handle them
class ServicesException extends AppExceptions {
  ServicesException([String? message]) : super(message, 'Internal Server error');
}

//invalid url exception
class InvalidUrlException extends AppExceptions {
  InvalidUrlException([String? message]) : super(message, 'Invalid Url');
}

//FetchDataException
class  FetchDataException extends AppExceptions {
  FetchDataException([String? message]) : super(message, '');
}
