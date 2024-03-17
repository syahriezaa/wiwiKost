import 'package:dio/dio.dart';
import 'package:wiwikost/constant/core/api_const.dart';
import 'package:wiwikost/modules/models/user_models.dart';
import 'package:wiwikost/shared/services/api_service.dart';

class LoginRepositories {
  LoginRepositories._();

  static final Dio _dio = ApiServices.dioCall();

  static Future<User> loginRepo(String username, String password) async {
    try {
      final response = await _dio.post(ApiConst.login,
          data: {'username': username, 'password': password});

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

  ///request otp
  static Future<SucessResponse> requestOtpRepo(String username) async {
    try {
      // _dio.interceptors
      //     .add(LogInterceptor(requestBody: true, responseBody: true));
      final response =
          await _dio.post(ApiConst.requestOtp, data: {'username': username});

      return SucessResponse.fromJson(response.data);

      // ignore: deprecated_member_use
    } on DioError catch (e) {
      if (e.response != null) {
        return SucessResponse(
          statusCode: e.response!.statusCode.toString(),
          message: e.response!.statusMessage.toString(),
        );
      } else {
        rethrow;
      }
    }
  }

  ///send otp
  static Future<SucessResponse> sendOtpRepo(
      String phonenumber, String otp) async {
    try {
      // _dio.interceptors
      //     .add(LogInterceptor(requestBody: true, responseBody: true));
      final response = await _dio.post(ApiConst.sendOtp,
          data: {'phone_number': phonenumber, 'otp': otp});

      return SucessResponse.fromJson(response.data);

      // ignore: deprecated_member_use
    } on DioError catch (e) {
      if (e.response != null) {
        return SucessResponse(
          statusCode: e.response!.statusCode.toString(),
          message: e.response!.statusMessage.toString(),
        );
      } else {
        rethrow;
      }
    }
  }
}
