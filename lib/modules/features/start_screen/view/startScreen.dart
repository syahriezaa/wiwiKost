import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wiwikost/constant/core/asset_const.dart';
import 'package:wiwikost/shared/widget/primary_button.dart';

class StartScreenView extends StatelessWidget {
  const StartScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 300,
            child: SvgPicture.asset(AssetConst.icWomanInDesk),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20.w),
          child: Text(
            'Selamat datang di WiWi Kos, tempat yang nyaman dan aman untuk para mahasiswi! Di sini, kami hadir untuk mendukung perjalananmu dalam mengejar mimpi. Temukan kedamaian dan kebersamaan di lingkungan kami yang hangat dan ramah.',
            style: Theme.of(context).textTheme.labelLarge,
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer(),
        SizedBox(
          width: 0.9.sw,
          child: PrimaryButton(
            text: "Get Started",
            onPressed: () {
              Get.toNamed('/login');
            },
          ),
        ),
        SizedBox(height: 20.h),
      ]),
    );
  }
}
