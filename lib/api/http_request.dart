import 'http_config.dart';
import 'package:dio/dio.dart';

class HttpRequest {
  void request(String url, { String method = 'get', required Map<String, dynamic> params }) {
    // 1.创建 dio 实例
    BaseOptions baseOptions = BaseOptions(
      baseUrl: BASE_URL
    );
    final dio = Dio(baseOptions);

    // 2.发送网络请求
  }
}
