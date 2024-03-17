class User {
  final String idUser;
  final String username;
  final String fullName;
  final String phoneNumber;
  final String address;
  final String nik;
  final String accessToken;
  final String statusCode;

  User({
    required this.idUser,
    required this.username,
    required this.fullName,
    required this.phoneNumber,
    required this.address,
    required this.nik,
    required this.accessToken,
    required this.statusCode,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      idUser: json['user']['id_user'],
      username: json['user']['username'],
      fullName: json['user']['full_name'],
      phoneNumber: json['user']['phone_number'],
      address: json['user']['address'],
      nik: json['user']['nik'],
      accessToken: json['access_token'],
      statusCode: json['status_code'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'user': {
        'id_user': idUser,
        'username': username,
        'full_name': fullName,
        'phone_number': phoneNumber,
        'address': address,
        'nik': nik,
      },
      'access_token': accessToken,
      'status_code': statusCode,
    };
  }
}

class SucessResponse {
  final String? message;
  final String? statusCode;

  SucessResponse({
    this.message,
    this.statusCode,
  });

  factory SucessResponse.fromJson(Map<String, dynamic> json) {
    return SucessResponse(
      message: json['message'],
      statusCode: json['status_code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'status_code': statusCode,
    };
  }
}
