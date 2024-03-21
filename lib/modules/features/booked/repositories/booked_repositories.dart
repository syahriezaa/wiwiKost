import 'package:dio/dio.dart';
import 'package:wiwikost/constant/core/api_const.dart';
import 'package:wiwikost/modules/models/ocupier_models.dart';
import 'package:wiwikost/modules/models/user_models.dart';
import 'package:wiwikost/shared/services/api_service.dart';
import 'package:wiwikost/shared/services/local_db_service/local_db_service.dart';

class OcupancyDetailsRepository {
  OcupancyDetailsRepository._(); // Private constructor to prevent instantiation

  static final Dio _dio = ApiServices.dioCall();

  static Future<OccupancyDetails> fetchOccupancyDetails() async {
    try {
      _dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
      User? user = await LocalDBService.getUser();
      FormData formData = FormData.fromMap(
        {
          'id_user': user!.idUser,
        },
      );
      String? token = await LocalDBService.getToken();
      final options = Options(headers: {'Authorization': 'Bearer $token'});

      final response = await _dio.post(
        ApiConst.registerOccupy,
        data: formData,
        options: options,
      );

      return OccupancyDetails.fromJson(response.data);
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      if (e.response != null) {
        return OccupancyDetails(
          roomInformation: RoomInformation(
            idRoom: '',
            idOccupy: '',
            roomNumber: '',
            roomFloor: '',
            roomType: '',
            subscriptionModel: '',
            roomTypePrice: 0,
            doubleBedOptions: '',
            checkIn: '',
          ),
          nextPaymentDate: '',
          residents: [],
          subscriptionStatus: '',
        );
      } else {
        throw Exception('Error: $e');
      }
    }
  }
}
