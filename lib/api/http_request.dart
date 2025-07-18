import 'http_config.dart';
import 'package:dio/dio.dart';

class HttpRequest {
  // 1.创建 dio 实例
  static BaseOptions baseOptions = BaseOptions(baseUrl: BASE_URL);

  static final dio = Dio(baseOptions);

  static Future request(String url,
      {String method = 'get', Map<String, dynamic> params = const {}}) async {
    // 2.发送网络请求
    Options options = Options(method: method);
    try {
      final res =
          await dio.request(url, queryParameters: params, options: options);
      return res;
    } catch (err) {
      throw err;
    }
  }
}
