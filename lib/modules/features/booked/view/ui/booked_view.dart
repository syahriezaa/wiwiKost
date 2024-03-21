import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wiwikost/config/themes/colours.dart';
import 'package:wiwikost/modules/features/booked/controllers/booked_controllers.dart';
import 'package:wiwikost/shared/widget/primary_button.dart';

// ignore: must_be_immutable
class BookedView extends StatelessWidget {
  BookedView({super.key});
  BookedControllers controllers = Get.put(BookedControllers());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await controllers.fetchOccupancyDetails();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Obx(
            () => Padding(
              padding: EdgeInsets.only(
                bottom: 50.w,
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.w),
                      bottomRight: Radius.circular(20.w),
                    ),
                    child: Image.network(
                        'https://asset.olympicfurniture.co.id/NEWS/10-Desain-Kamar-Aesthetic-Minimalis-yang-Bikin-Betah.webp'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 8.0),
                    child: Row(
                      children: [
                        Text(
                          "Kamar  ${controllers.roomInformation.value.roomNumber}",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                  color: Colours.greenPrimary4,
                                  fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Text(
                          "lantai ${controllers.roomInformation.value.roomFloor}",
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Colours.greenPrimary4,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: BoxDecoration(
                      color: Colours.greenPrimary1,
                      borderRadius: BorderRadius.circular(20.w),
                    ),
                    child: Column(
                      children: [
                        Text("Periode Sewa",
                            style: Theme.of(context).textTheme.bodySmall),
                        SizedBox(
                          height: 10.w,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              alignment: Alignment.centerRight,
                              decoration: BoxDecoration(
                                color: Colours.white,
                                borderRadius: BorderRadius.circular(20.w),
                              ),
                              child: Text(
                                controllers.roomInformation.value.checkIn,
                                style: Theme.of(context).textTheme.labelLarge,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Icon(
                              size: 30.w,
                              Icons.arrow_forward,
                              color: Colours.white,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              decoration: BoxDecoration(
                                color: Colours.white,
                                borderRadius: BorderRadius.circular(20.w),
                              ),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                controllers.nextPaymentDate.value,
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.w,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.w),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "penghuni",
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: 10.w,
                  ),
                  SizedBox(
                    height: 0.3.sh,
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        // Check if the index is within the bounds of the residents list
                        if (index < controllers.resident.length) {
                          // Get the resident at the current index
                          var resident = controllers.resident[index];

                          // Return a Container with the resident details
                          return Container(
                            padding: EdgeInsets.all(4.w),
                            margin: EdgeInsets.symmetric(horizontal: 10.w),
                            decoration: BoxDecoration(
                              color: Colours.white,
                              borderRadius: BorderRadius.circular(8.w),
                              border: Border.all(
                                color: Colours.greenPrimary1,
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20.w,
                                  ),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    resident.residentName,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                          color: Colours.greenPrimary5,
                                          fontWeight: FontWeight.bold,
                                        ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20.w,
                                  ),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'NIK-${resident.residentNIK}',
                                    style:
                                        Theme.of(context).textTheme.labelLarge,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          // If the index is out of bounds, return an empty Container
                          return Container();
                        }
                      },
                      separatorBuilder: (context, index) => SizedBox(
                        height: 10.w,
                      ),
                      itemCount: controllers.resident.length,
                    ),
                  ),
                  SizedBox(
                    height: 20.w,
                  ),
                  const Text("Biaya Sewa"),
                  Text(
                    "Rp.${controllers.roomInformation.value.roomTypePrice.toString()}",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colours.red),
                  ),
                  SizedBox(
                    height: 20.w,
                  ),
                  SizedBox(
                      width: 0.9.sw,
                      child:
                          const PrimaryButton.noVerticalPadding(text: "Bayar")),
                  Container(
                    alignment: Alignment.center,
                    width: 0.9.sw,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.w),
                    decoration: BoxDecoration(
                      color: Colours.greenPrimary1,
                      borderRadius: BorderRadius.circular(20.w),
                    ),
                    child: Text(
                      controllers.subscriptionStatus.value,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colours.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
