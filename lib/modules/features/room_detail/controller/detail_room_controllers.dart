import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wiwikost/modules/features/room_detail/repositories/room_detail_repositories.dart';
import 'package:wiwikost/modules/models/room_models.dart';
import 'package:wiwikost/shared/services/local_db_service/local_db_service.dart';

class DetailRoomControllers extends GetxController {
  var roomNumber = ''.obs;
  var floor = ''.obs;
  var type = ''.obs;
  var price = ''.obs;

  RxInt residentCount = 1.obs;
  RxInt duration = 1.obs;

  RxString forMyself = 'For Myself'.obs;
  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);

  void setRoomNumber(String value) => roomNumber.value = value;

  void setFloor(String value) => floor.value = value;

  void setType(String value) => type.value = value;

  void setPrice(String value) => price.value = value;

  void clear() {
    roomNumber.value = '';
    floor.value = '';
    type.value = '';
    price.value = '';
  }

  Rx<RoomData> roomData = RoomData(
      room: DetailRoom(
        idRoom: '',
        roomNumber: '',
        roomFloor: '',
        roomType: '',
        price: 0,
      ),
      roomPhotos: []).obs;

  @override
  void onInit() {
    fetchRoomDetail();
    super.onInit();
  }

  /// Add Ocupier variable

  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController nikController = TextEditingController();

  final userImageImagePicker = ImagePicker();
  RxString userImagePath = ''.obs;
  Rx<File?> selectedUserImage = Rx<File?>(null);
  RxString userImageNames = ''.obs;

  final ktpImageImagePicker = ImagePicker();
  RxString ktpImagePath = ''.obs;
  Rx<File?> ktpSelectedImage = Rx<File?>(null);
  RxString ktpImageName = ''.obs;

  final ktmImageImagePicker = ImagePicker();
  RxString ktmImagePath = ''.obs;
  Rx<File?> ktmSelectedImage = Rx<File?>(null);
  RxString ktmImageName = ''.obs;

  Future<void> selectUserImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      File selectedFile = File(pickedImage.path);
      File compressedImage = await compressImage(selectedFile);

      selectedUserImage.value = compressedImage;
      userImageNames.value = compressedImage.path.split('/').last;
    } else {
      selectedUserImage.value = null;
      userImageNames.value = '';
    }
  }

  Future<void> selectKTPImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      File selectedFile = File(pickedImage.path);
      File compressedImage = await compressImage(selectedFile);

      ktpSelectedImage.value = compressedImage;
      ktpImageName.value = compressedImage.path.split('/').last;
    } else {
      ktpSelectedImage.value = null;
      ktpImageName.value = '';
    }
  }

  Future<void> selectKTMImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      File selectedFile = File(pickedImage.path);
      File compressedImage = await compressImage(selectedFile);

      ktmSelectedImage.value = compressedImage;
      ktmImageName.value = compressedImage.path.split('/').last;
    } else {
      ktmSelectedImage.value = null;
      ktmImageName.value = '';
    }
  }

  Future<File> compressImage(File file) async {
    // Define the maximum allowed size in bytes (2 MB)
    int maxSizeBytes = 2 * 1024 * 1024;

    // Get the original image file size
    int originalSize = file.lengthSync();

    // Check if the image is already within the size limit
    if (originalSize <= maxSizeBytes) {
      return file;
    }

    // Compress the image
    Uint8List? compressedBytes = await FlutterImageCompress.compressWithFile(
      file.absolute.path,
      minWidth: 1024,
      minHeight: 1024,
      quality: 85,
    );

    // Create a new file with the compressed bytes
    File compressedFile = File(file.path.replaceAll(
        ".${file.path.split('.').last}",
        "_compressed.${file.path.split('.').last}"));

    await compressedFile.writeAsBytes(compressedBytes!);

    return compressedFile;
  }

  ///fetch room detail
  Future<void> fetchRoomDetail() async {
    final response = await RoomDetailRepositories.fetchDetailRoom();
    if (response.status == 'success') {
      // Set the room details
      roomData.value = response.data;
    } else {
      // Show an error message
      Get.snackbar(
        'Error',
        'Failed to fetch room details',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (pickedDate != null) {
      // Update selected date
      selectedDate.value = pickedDate;
    }
  }

  ///Register Occupy

  Future<void> registerOccupy() async {
    final response = await RoomDetailRepositories.registerOccupy(
        selectedDate as String, '$duration month', forMyself.value);

    if (response.statusCode == '201') {
      LocalDBService.setIdOccupy(response.idOccupy);
      if (forMyself.value == 'yes') {
        final secondResponse = await RoomDetailRepositories.fillResident(
          fullNameController.text,
          nikController.text,
          phoneNumberController.text,
          addressController.text,
          selectedUserImage.value,
          ktpSelectedImage.value,
          ktmSelectedImage.value,
        );
        if (secondResponse.statusCode == '201') {
          Get.snackbar(
            'Success',
            'Successfully registered',
            snackPosition: SnackPosition.BOTTOM,
          );
        } else {
          Get.snackbar(
            'Error',
            'Failed to register',
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      }
    }
  }
}
