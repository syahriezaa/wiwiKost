import 'dart:io';

import 'package:dio/dio.dart';
import 'package:wiwikost/constant/core/api_const.dart';
import 'package:wiwikost/modules/models/user_models.dart';
import 'package:wiwikost/shared/services/api_service.dart';

class RegisterRepositories {
  RegisterRepositories._();

  static final Dio _dio = ApiServices.dioCall();
  static Future<SucessResponse> registerRepo(
    String username,
    String fullName,
    String password,
    String phoneNumber,
    String address,
    String nik,
    File? userImage,
    File? idCardImage,
    File? ktmImage,
    String userImagePath,
    String ktpImagePath,
    String ktmImagePath,
  ) async {
    try {
      // Create FormData object
      FormData formData = FormData.fromMap({
        'username': username,
        'full_name': fullName,
        'password': password,
        'phone_number': phoneNumber,
        'address': address,
        'nik': nik,
        'user_image':
            await MultipartFile.fromFile(userImage!.path, filename: 'sad.jpg'),
        'nik_image': await MultipartFile.fromFile(idCardImage!.path,
            filename: 'sad.jpg'),
        'ktm_image':
            await MultipartFile.fromFile(ktmImage!.path, filename: 'sad.jpg'),
      });

      // Make POST request with FormData
      final response = await _dio.post(ApiConst.register, data: formData);

      return SucessResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        return SucessResponse(
          message: '',
          statusCode: e.response!.statusCode.toString(),
        );
      } else {
        rethrow;
      }
    }
  }
}
