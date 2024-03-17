import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wiwikost/modules/features/register/repositories/register_repositories.dart';
import 'package:wiwikost/modules/models/user_models.dart';

class RegisterControllers extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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

  Future<void> register() async {
    SucessResponse response = await RegisterRepositories.registerRepo(
      usernameController.text,
      fullNameController.text,
      passwordController.text,
      phoneNumberController.text,
      addressController.text,
      nikController.text,
      selectedUserImage.value,
      ktpSelectedImage.value,
      ktmSelectedImage.value,
      userImagePath.value,
      ktpImagePath.value,
      ktmImagePath.value,
    );

    if (response.statusCode == '201') {
      Get.toNamed('/login');
    } else {
      Get.snackbar('Register Failed', response.message!);
    }
  }
}
