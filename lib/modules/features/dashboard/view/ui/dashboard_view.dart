import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wiwikost/config/themes/colours.dart';
import 'package:wiwikost/constant/core/asset_const.dart';
import 'package:wiwikost/modules/features/dashboard/controllers/dashboard_controllers.dart';
import 'package:wiwikost/modules/features/dashboard/view/components/room_card.dart';
import 'package:wiwikost/modules/models/room_models.dart';
import 'package:wiwikost/shared/services/local_db_service/local_db_service.dart';

// ignore: must_be_immutable
class DashboardView extends StatelessWidget {
  DashboardView({super.key});
  DashboardController controller = Get.find();
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
                    margin: EdgeInsets.only(top: 100.w),
                    width: 1.sw,
                    height: 1.sh - (30.w + 100.w + 10.w * 3),
                    child: Obx(
                      () => controller.rooms.isEmpty
                          ? SizedBox(
                              height: 10.w,
                              child: SvgPicture.asset(
                                AssetConst.icEmpty,
                              ),
                            )
                          : ListView.separated(
                              itemBuilder: (context, index) {
                                // Check if the index is within the bounds of the rooms list
                                if (index < controller.rooms.length) {
                                  // Get the room at the current index
                                  Room room = controller.rooms[index];

                                  // Construct and return a RoomCard widget with the room details
                                  return InkWell(
                                    onTap: () {
                                      LocalDBService.setRoomIndex(room.idRoom);
                                      Get.toNamed('/room');
                                    },
                                    child: RoomCard(
                                      roomNumber: room.roomNumber,
                                      floor: room.roomFloor,
                                      type: room.roomType,
                                      price: room.price.toString(),
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
                              itemCount: controller.rooms.length,
                            ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
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
                Obx(
                  () => SizedBox(
                    height: 30.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        DropdownButton(
                            items: const [
                              DropdownMenuItem(
                                value: 'all',
                                child: Text('Semua Kamar'),
                              ),
                              DropdownMenuItem(
                                value: 'kmLuar',
                                child: Text('Kama mandi luar'),
                              ),
                              DropdownMenuItem(
                                value: 'kmDalam',
                                child: Text('kamar mandi dalam'),
                              ),
                            ],
                            style: Theme.of(context).textTheme.labelLarge,
                            hint: Text(controller.typeRoomName.value),
                            onChanged: (value) {
                              controller.changeTypeRoom(value.toString());
                              controller.fetchListRoom();
                            }),
                        DropdownButton(
                            items: const [
                              DropdownMenuItem(
                                value: 'all',
                                child: Text('Semua Kamar'),
                              ),
                              DropdownMenuItem(
                                value: '1',
                                child: Text('1'),
                              ),
                              DropdownMenuItem(
                                value: '2',
                                child: Text('2'),
                              ),
                              DropdownMenuItem(
                                value: '3',
                                child: Text('3'),
                              ),
                            ],
                            hint: Text(controller.floor.value),
                            style: Theme.of(context).textTheme.labelLarge,
                            onChanged: (value) {
                              controller.floor.value = value.toString();
                              controller.fetchListRoom();
                            }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
