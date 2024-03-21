class RoomInformation {
  final String idRoom;
  final String idOccupy;
  final String roomNumber;
  final String roomFloor;
  final String roomType;
  final String subscriptionModel;
  final int roomTypePrice;
  final String doubleBedOptions;
  final String checkIn;

  RoomInformation({
    required this.idRoom,
    required this.idOccupy,
    required this.roomNumber,
    required this.roomFloor,
    required this.roomType,
    required this.subscriptionModel,
    required this.roomTypePrice,
    required this.doubleBedOptions,
    required this.checkIn,
  });

  factory RoomInformation.fromJson(Map<String, dynamic> json) {
    return RoomInformation(
      idRoom: json['id_room'],
      idOccupy: json['id_occupy'],
      roomNumber: json['room_number'],
      roomFloor: json['room_floor'],
      roomType: json['room_type'],
      subscriptionModel: json['subscription_model'],
      roomTypePrice: json['room_type_price'],
      doubleBedOptions: json['double_bed_options'],
      checkIn: json['check_in'],
    );
  }
}

class Resident {
  final String idResident;
  final String residentName;
  final String residentPhoneNumber;
  final String residentNIK;

  Resident({
    required this.idResident,
    required this.residentName,
    required this.residentPhoneNumber,
    required this.residentNIK,
  });

  factory Resident.fromJson(Map<String, dynamic> json) {
    return Resident(
      idResident: json['id_resident'],
      residentName: json['resident_name'],
      residentPhoneNumber: json['resident_phone_number'],
      residentNIK: json['resident_nik'],
    );
  }
}

class OccupancyDetails {
  final RoomInformation roomInformation;
  final String nextPaymentDate;
  final List<Resident> residents;
  final String subscriptionStatus;

  OccupancyDetails({
    required this.roomInformation,
    required this.nextPaymentDate,
    required this.residents,
    required this.subscriptionStatus,
  });

  factory OccupancyDetails.fromJson(Map<String, dynamic> json) {
    return OccupancyDetails(
      roomInformation:
          RoomInformation.fromJson(json['data']['room_information']),
      nextPaymentDate: json['data']['next_payment_date'],
      residents: List<Resident>.from(json['data']['residents']
          .map((resident) => Resident.fromJson(resident))),
      subscriptionStatus: json['data']['subscription_status'],
    );
  }
}
