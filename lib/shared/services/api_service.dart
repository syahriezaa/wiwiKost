import 'package:dio/dio.dart';
import 'package:wiwikost/constant/core/api_const.dart';

class ApiServices {
  ApiServices._internal();

  static Dio dioCall({Duration connectTimeout = const Duration(seconds: 20), String? token, String? authorization}) {
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (token != null) {
      headers['token'] = token;
    }

    var dio = Dio(
      BaseOptions(
        headers: headers,
        baseUrl: ApiConst.baseUrl,
        connectTimeout: connectTimeout,
      ),
    );

    return dio;
  }
}
