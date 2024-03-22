import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wiwikost/modules/features/profile/controllers/profile_controolers.dart';
import 'package:wiwikost/shared/services/local_db_service/local_db_service.dart';
import 'package:wiwikost/shared/widget/primary_button.dart';

// ignore: must_be_immutable
class ProfileView extends StatelessWidget {
  ProfileView({super.key});
  ProfileControllers controllers = Get.put(ProfileControllers());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                height: 200,
                child: Row(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png'),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controllers.name.value,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          controllers.phoneNumber.value,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 0.8.sw,
                child: PrimaryButton(
                  text: "Logout",
                  onPressed: () {
                    LocalDBService.clearToken();
                    LocalDBService.clearUser();
                    Get.toNamed('/login');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
