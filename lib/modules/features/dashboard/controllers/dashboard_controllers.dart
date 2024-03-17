import 'package:get/get.dart';
import 'package:wiwikost/modules/features/dashboard/repositories/dashboard_repositories.dart';
import 'package:wiwikost/modules/models/room_models.dart';

class DashboardController extends GetxController {
  final _currentIndex = 0.obs;

  int get currentIndex => _currentIndex.value;
  RxString typeRoomCode = 'All'.obs;
  RxString typeRoomName = 'Semua Kamar'.obs;
  RxString floor = 'all'.obs;

  RxList<Room> rooms = <Room>[].obs;

  void changeIndex(int index) {
    _currentIndex.value = index;
  }

  @override
  void onInit() {
    fetchListRoom();
    // TODO: implement onInit
    super.onInit();
  }

  void changeTypeRoom(String type) {
    if (type == 'All') {
      typeRoomCode.value = 'all';
      typeRoomName.value = 'Semua Kamar';
    }
    if (type == 'kmLuar') {
      typeRoomCode.value = 'kmLuar';
      typeRoomName.value = 'Kamar mandi luar';
    }
    if (type == 'kmDalam') {
      typeRoomCode.value = 'kmDalam';
      typeRoomName.value = 'Kamar mandi dalam';
    }
  }

  ///fetch list room from api
  Future<void> fetchListRoom() async {
    try {
      RoomResponse response =
          await DashboardRepositories.listRoom(typeRoomCode.value, floor.value);

      // Check if the API call was successful
      if (response.statusCode == '200' && response.status == 'success') {
        // Assign the list of rooms to the RxList
        rooms.assignAll(response.data);
        print(rooms.length);
      } else {
        // Handle error response
        print('Failed to fetch rooms: ${response.message}');
      }
    } catch (e) {
      // Handle any exceptions
      print('Error fetching rooms: $e');
    }
  }
}
