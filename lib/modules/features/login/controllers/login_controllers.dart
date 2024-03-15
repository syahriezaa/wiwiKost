import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wiwikost/modules/features/login/repositories/login_repositories.dart';
import 'package:wiwikost/modules/models/user_models.dart';
import 'package:wiwikost/shared/services/local_db_service/local_db_service.dart';

class LoginControllers extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    User response = await LoginRepositories.loginRepo(
        usernameController.text, passwordController.text);

    if (response.statusCode == '200') {
      LocalDBService.setUser(response);
      LocalDBService.setToken(response.accessToken);
      Get.toNamed('/dashboard');
    } else {
      Get.snackbar('Login Failed', 'Please check your username and password');
    }
  }
}
