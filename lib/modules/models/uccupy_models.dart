import 'package:wiwikost/modules/models/user_models.dart';

class OccupyModels {
  final String status;
  final String message;
  final OccupyResponse data;
  final String statusCode;

  OccupyModels({
    required this.status,
    required this.message,
    required this.data,
    required this.statusCode,
  });

  factory OccupyModels.fromJson(Map<String, dynamic> json) {
    return OccupyModels(
      status: json['status'],
      message: json['message'],
      data: OccupyResponse.fromJson(json['data']),
      statusCode: json['status_code'],
    );
  }
}

class OccupyResponse {
  final String idOccupy;
  final String message;
  final String statusCode;

  OccupyResponse({
    required this.idOccupy,
    required this.message,
    required this.statusCode,
  });

  factory OccupyResponse.fromJson(Map<String, dynamic> json) {
    return OccupyResponse(
      idOccupy: json['data']['id_occupy'],
      message: json['data']['message'],
      statusCode: json['status_code'],
    );
  }
}

///succes response
class SuccessResponse {
  final String status;
  final String message;
  final String statusCode;

  SuccessResponse({
    required this.status,
    required this.message,
    required this.statusCode,
  });

  factory SuccessResponse.fromJson(Map<String, dynamic> json) {
    return SuccessResponse(
      status: json['status'],
      message: json['message'],
      statusCode: json['status_code'],
    );
  }
}
