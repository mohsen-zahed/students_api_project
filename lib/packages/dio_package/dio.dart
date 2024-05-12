import 'package:dio/dio.dart';

class MyDio {
  static Dio httpClient = Dio(BaseOptions(
    baseUrl: 'http://expertdevelopers.ir/api/v1',
  ));
}
