import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:wiwikost/config/themes/colours.dart';
import 'package:wiwikost/modules/features/login/repositories/login_repositories.dart';
import 'package:wiwikost/modules/models/user_models.dart';
import 'package:wiwikost/shared/services/local_db_service/local_db_service.dart';

class LoginControllers extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController otpControllres = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  Future<void> login() async {
    User response = await LoginRepositories.loginRepo(
        usernameController.text, passwordController.text);

    if (response.statusCode == '201') {
      LocalDBService.setUser(response);
      LocalDBService.setToken(response.accessToken);
      Get.toNamed('/home');
    }
    if (response.statusCode == '405') {
      requestOtp();
      Get.defaultDialog(
        title: 'Verifikasi Akun',
        titleStyle: Get.textTheme.titleLarge,
        content: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Nomor HP',
                  hintText: 'Masukkan Nomor HP',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colours.greenPrimary,
                    ),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colours.greenPrimary,
                    ),
                  ),
                ),
              ),
            ),
            Pinput(
              length: 6,
              controller: otpControllres,
            ),
            SizedBox(
              height: 15.w,
            ),
            SizedBox(
              width: 0.5.sw,
              child: TextButton(
                onPressed: () {
                  sendOtp();
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colours.greenPrimary.withOpacity(0.9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(
                        color: Color.fromARGB(
                            108, 255, 255, 255)), // Set the border color
                  ),
                  elevation: 5, // Add elevation for shadow
                  shadowColor: Colors.black, // Set the shadow color
                ),
                child: Text(
                  "Kirim Otp",
                  style: Get.textTheme.bodyLarge!
                      .copyWith(color: Colours.antiFlashWhite),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  ///Request OTP
  Future<void> requestOtp() async {
    SucessResponse response =
        await LoginRepositories.requestOtpRepo(usernameController.text);
    if (response.statusCode == '200') {
      Get.snackbar('Success', 'OTP has been sent to your phone number');
    } else {
      Get.snackbar('Failed', 'Please check your username');
    }
  }

  ///send otp
  Future<void> sendOtp() async {
    SucessResponse response = await LoginRepositories.sendOtpRepo(
        phoneNumberController.text, otpControllres.text);
    if (response.statusCode == '200') {
      Get.back();
      Get.snackbar('Success', 'OTP has been sent to your phone number');
    } else {
      Get.snackbar('Failed', 'Please check your username');
    }
  }
}
