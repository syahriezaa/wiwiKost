import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wiwikost/config/themes/colours.dart';
import 'package:wiwikost/constant/core/asset_const.dart';
import 'package:wiwikost/modules/dashboard/controllers/dashboard_controllers.dart';
import 'package:wiwikost/modules/dashboard/view/ui/dashboard_view.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  DashboardController controller = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
              alignment: Alignment.center,
              child: Obx(() => controller.currentIndex == 0
                  ? DashboardView()
                  : controller.currentIndex == 1
                      ? Text('Pemesanan')
                      : Text('Profile'))),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: Colours.white,
              ),
              child: SizedBox(
                width: 1.sw,
                height: 50.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Obx(
                      () => SizedBox(
                        width: 0.3.sw,
                        height: 30.w,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: controller.currentIndex == 0
                                ? Colours.greenPrimary1
                                : Colours.antiFlashWhite,
                          ),
                          onPressed: () {
                            controller.changeIndex(0);
                          },
                          child: Align(
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                              AssetConst.icHome,
                              colorFilter: ColorFilter.mode(
                                  controller.currentIndex == 0
                                      ? Colours.antiFlashWhite
                                      : Colours.greenPrimary1,
                                  BlendMode.srcIn),
                              width: 20.w,
                              height: 20.w,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => SizedBox(
                        width: 0.3.sw,
                        height: 30.w,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: controller.currentIndex == 1
                                ? Colours.greenPrimary1
                                : Colours.antiFlashWhite,
                          ),
                          onPressed: () {
                            controller.changeIndex(1);
                          },
                          child: Align(
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                              AssetConst.icBooking,
                              colorFilter: ColorFilter.mode(
                                  controller.currentIndex == 1
                                      ? Colours.antiFlashWhite
                                      : Colours.greenPrimary1,
                                  BlendMode.srcIn),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => SizedBox(
                        width: 0.3.sw,
                        height: 30.w,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: controller.currentIndex == 2
                                ? Colours.greenPrimary1
                                : Colours.antiFlashWhite,
                          ),
                          onPressed: () {
                            controller.changeIndex(2);
                          },
                          child: Align(
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                              AssetConst.icProfile,
                              colorFilter: ColorFilter.mode(
                                  controller.currentIndex == 2
                                      ? Colours.antiFlashWhite
                                      : Colours.greenPrimary1,
                                  BlendMode.srcIn),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
