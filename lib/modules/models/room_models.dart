class RoomResponse {
  final String status;
  final String message;
  final List<Room> data;
  final String statusCode;

  RoomResponse({
    required this.status,
    required this.message,
    required this.data,
    required this.statusCode,
  });

  factory RoomResponse.fromJson(Map<String, dynamic> json) {
    List<dynamic> jsonData = json['data'];
    List<Room> rooms =
        jsonData.map((roomJson) => Room.fromJson(roomJson)).toList();

    return RoomResponse(
      status: json['status'],
      message: json['message'],
      data: rooms,
      statusCode: json['status_code'],
    );
  }
}

class Room {
  final String idRoom;
  final String roomNumber;
  final String roomFloor;
  final String roomType;
  final int price;

  Room({
    required this.idRoom,
    required this.roomNumber,
    required this.roomFloor,
    required this.roomType,
    required this.price,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      idRoom: json['id_room'],
      roomNumber: json['room_number'],
      roomFloor: json['room_floor'],
      roomType: json['room_type'],
      price: json['price'],
    );
  }
}
