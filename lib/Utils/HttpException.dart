class HttpException implements Exception{
  final dynamic msg;
  HttpException(this.msg);

  @override
  String toString() {
    return msg;
    //return super.toString();
  }
}