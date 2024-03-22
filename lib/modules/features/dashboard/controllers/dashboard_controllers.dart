import 'package:get/get.dart';
import 'package:wiwikost/modules/features/dashboard/repositories/dashboard_repositories.dart';
import 'package:wiwikost/modules/models/room_models.dart';
import 'package:wiwikost/shared/services/local_db_service/local_db_service.dart';

class DashboardController extends GetxController {
  final _currentIndex = 0.obs;

  int get currentIndex => _currentIndex.value;
  RxString typeRoomCode = 'all'.obs;
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
    if (type == 'all') {
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
      if (response.statusCode == '200') {
        // Assign the list of rooms to the RxList
        rooms.assignAll(response.data);
      }
      if (response.statusCode == '401') {
        await LocalDBService.clearToken();
        await LocalDBService.clearUser();
        await LocalDBService.clearIdOccupy();
        Get.offAllNamed('/login');
      }
    } catch (e) {
      // Handle any exceptions
    }
  }
}
