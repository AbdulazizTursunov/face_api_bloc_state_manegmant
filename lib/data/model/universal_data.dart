

class UniversalResponse{
  UniversalResponse({this.data,this.statusCode=0,this.error=''});

  String error;
  dynamic data;
  int statusCode;
}