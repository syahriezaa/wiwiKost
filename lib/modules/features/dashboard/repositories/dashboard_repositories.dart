import 'dart:io';

import 'package:dio/dio.dart';
import 'package:wiwikost/constant/core/api_const.dart';
import 'package:wiwikost/modules/models/room_models.dart';
import 'package:wiwikost/modules/models/user_models.dart';
import 'package:wiwikost/shared/services/api_service.dart';
import 'package:wiwikost/shared/services/local_db_service/local_db_service.dart';

class DashboardRepositories {
  DashboardRepositories._();

  static final Dio _dio = ApiServices.dioCall();
  static Future<RoomResponse> listRoom(String roomType, String floor) async {
    try {
      _dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
      String? token = await LocalDBService.getToken();
      final options = Options(headers: {
        'Authorization': 'Bearer $token',
      });
      // Create FormData object
      User? user = await LocalDBService.getUser();
      FormData formData = FormData.fromMap(
        {
          'id_user': user!.idUser,
          'filter_type': roomType,
          'filter_floor': floor,
        },
      );

      // Make POST request with FormData
      final response =
          await _dio.post(ApiConst.listRoom, data: formData, options: options);

      return RoomResponse.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response != null) {
        return RoomResponse(
          message: '',
          statusCode: e.response!.statusCode.toString(),
          status: 'error',
          data: <Room>[],
        );
      } else {
        rethrow;
      }
    }
  }
}
