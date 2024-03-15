import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wiwikost/config/themes/colours.dart';
import 'package:wiwikost/modules/features/dashboard/view/components/room_card.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colours.antiFlashWhite,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 60.w),
                    width: 1.sw,
                    height: 1.sh - (30.w + 60.w + 10.w * 3),
                    child: ListView.separated(
                        itemBuilder: (context, index) => const RoomCard(),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 10.w,
                            ),
                        itemCount: 3),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.w),
              width: 1.sw,
              height: 60.w,
              color: Colours.white,
              child: Text(
                'Pilih kamarmu',
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: Colours.greenPrimary1,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
