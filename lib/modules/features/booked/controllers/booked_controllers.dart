import 'package:get/get.dart';
import 'package:wiwikost/modules/features/booked/repositories/booked_repositories.dart';
import 'package:wiwikost/modules/models/ocupier_models.dart';

class BookedControllers extends GetxController {
  RxList<Resident> resident = <Resident>[].obs;
  Rx<RoomInformation> roomInformation = RoomInformation(
    idRoom: '',
    idOccupy: '',
    roomNumber: '',
    roomFloor: '',
    roomType: '',
    subscriptionModel: '',
    roomTypePrice: 0,
    doubleBedOptions: '',
    checkIn: '',
  ).obs;
  RxString nextPaymentDate = ''.obs;
  RxString subscriptionStatus = ''.obs;

  @override
  void onInit() {
    fetchOccupancyDetails();
    super.onInit();
  }

  ///fect data from api
  Future<void> fetchOccupancyDetails() async {
    OccupancyDetails response =
        await OcupancyDetailsRepository.fetchOccupancyDetails();
    if (response.residents.isNotEmpty) {
      resident.assignAll(response.residents);
      roomInformation.value = response.roomInformation;
      nextPaymentDate.value = response.nextPaymentDate;
      subscriptionStatus.value = response.subscriptionStatus;
    } else {
      resident.assignAll([]);
      roomInformation.value = RoomInformation(
        idRoom: '',
        idOccupy: '',
        roomNumber: '',
        roomFloor: '',
        roomType: '',
        subscriptionModel: '',
        roomTypePrice: 0,
        doubleBedOptions: '',
        checkIn: '',
      );
      nextPaymentDate.value = '';
      subscriptionStatus.value = '';
    }
  }
}
