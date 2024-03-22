import 'dart:io';

import 'package:dio/dio.dart';
import 'package:wiwikost/constant/core/api_const.dart';
import 'package:wiwikost/modules/models/room_models.dart';
import 'package:wiwikost/modules/models/uccupy_models.dart';
import 'package:wiwikost/modules/models/user_models.dart';
import 'package:wiwikost/shared/services/api_service.dart';
import 'package:wiwikost/shared/services/local_db_service/local_db_service.dart';

class RoomDetailRepositories {
  RoomDetailRepositories._(); // Private constructor to prevent instantiation

  static final Dio _dio = ApiServices.dioCall();

  static Future<OccupyResponse> registerOccupy(
    String checkIn,
    String subscriptionModel,
    String isDoubleBed,
  ) async {
    try {
      _dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
      User? user = await LocalDBService.getUser();
      String? token = await LocalDBService.getToken();
      String? idRoom = await LocalDBService.getRoomIndex();
      FormData formData = FormData.fromMap(
        {
          'id_user': user!.idUser,
          'id_room': idRoom,
          'check_in': checkIn,
          'subscription_model': subscriptionModel,
          'is_double_bed': isDoubleBed,
        },
      );

      final options = Options(headers: {'Authorization': 'Bearer $token'});

      final response = await _dio.post(
        ApiConst.occupancyDetails,
        data: formData,
        options: options,
      );

      return OccupyResponse.fromJson(response.data);
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      if (e.response != null) {
        return OccupyResponse(
          statusCode: e.response!.data['status_code'],
          message: e.response!.data['message'],
          idOccupy: '',
        );
      } else {
        throw Exception('Error: $e');
      }
    }
  }

  static Future<SucessResponse> fillResident(
    String fullName,
    String nik,
    String phoneNumber,
    String address,
    File? userImage,
    File? idCardImage,
    File? ktmImage,
  ) async {
    try {
      _dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
      User? user = await LocalDBService.getUser();
      String? token = await LocalDBService.getToken();
      String? idOccupy = await LocalDBService.getIdOccupy();
      FormData formData = FormData.fromMap(
        {
          'id_user': user!.idUser,
          'id_occupy': idOccupy,
          'full_name': fullName,
          'nik': nik,
          'phone_number': phoneNumber,
          'address': address,
          'user_image': await MultipartFile.fromFile(userImage!.path,
              filename: 'sad.jpg'),
          'nik_image': await MultipartFile.fromFile(idCardImage!.path,
              filename: 'sad.jpg'),
          'ktm_image':
              await MultipartFile.fromFile(ktmImage!.path, filename: 'sad.jpg'),
        },
      );

      final options = Options(headers: {'Authorization': 'Bearer $token'});

      final response = await _dio.post(
        ApiConst.fillResident,
        data: formData,
        options: options,
      );

      return SucessResponse.fromJson(response.data);
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      if (e.response != null) {
        return SucessResponse(
          message: e.response!.data['message'],
          statusCode: e.response!.data['status_code'],
        );
      } else {
        throw Exception('Error: $e');
      }
    }
  }

  static Future<DetailRoomResponse> fetchDetailRoom() async {
    try {
      String? roomID = await LocalDBService.getRoomIndex();
      _dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
      User? user = await LocalDBService.getUser();
      String? token = await LocalDBService.getToken();

      final options = Options(headers: {'Authorization': 'Bearer $token'});
      FormData formData = FormData.fromMap(
        {
          'id_user': user!.idUser,
          'id_room': roomID,
        },
      );
      final response = await _dio.post(
        ApiConst.detailRoom,
        data: formData,
        options: options,
      );

      return DetailRoomResponse.fromJson(response.data);
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      if (e.response != null) {
        return DetailRoomResponse(
          status: 'error',
          message: 'Failed to fetch room details',
          statusCode: e.response!.statusCode.toString(),
          data: RoomData(
            room: DetailRoom(
              idRoom: '',
              roomNumber: '',
              roomFloor: '',
              roomType: '',
              price: 0,
            ),
            roomPhotos: [],
          ),
        );
      } else {
        throw Exception('Error: $e');
      }
    }
  }
}
