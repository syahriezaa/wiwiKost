import 'package:get/get.dart';
import 'package:wiwikost/modules/models/user_models.dart';
import 'package:wiwikost/shared/services/local_db_service/local_db_service.dart';

class ProfileControllers extends GetxController {
  RxString name = 'Name'.obs;
  RxString phoneNumber = 'Phone Number'.obs;
  var imageUrl =
      'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png'
          .obs;

  @override
  void onInit() {
    super.onInit();

    updateProfile();
    imageUrl.value =
        'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png';
  }

  void logout() {
    name.value = 'Name';
    phoneNumber.value = 'Phone Number';
    imageUrl.value =
        'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png';
  }

  Future<void> updateProfile() async {
    User? user = await LocalDBService.getUser();
    name.value = user!.username;
    phoneNumber.value = user.phoneNumber;
  }
}
