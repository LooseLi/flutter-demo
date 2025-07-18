import 'package:dio/dio.dart';

class HttpRequest {
  void request(
    String url, {
    String method = 'get',
  }) async {
    // 1.创建 dio 实例
    
    var dio = Dio();
    var response = await dio.get();
  }
}
