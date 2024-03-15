import 'package:dio/dio.dart';
import 'package:wiwikost/constant/core/api_const.dart';
import 'package:wiwikost/modules/models/user_models.dart';
import 'package:wiwikost/shared/services/api_service.dart';

class LoginRepositories {
  LoginRepositories._();

  static final Dio _dio = ApiServices.dioCall();

  static Future<User> loginRepo(String telephone, String password) async {
    try {
      final response = await _dio.post(ApiConst.login,
          data: {'telephone': telephone, 'password': password});

      return User.fromJson(response.data);

      // ignore: deprecated_member_use
    } on DioError catch (e) {
      if (e.response != null) {
        return User(
          idUser: '',
          username: '',
          fullName: '',
          phoneNumber: '',
          address: '',
          nik: '',
          accessToken: '',
          statusCode: e.response!.statusCode.toString(),
        );
      } else {
        rethrow;
      }
    }
  }
}
