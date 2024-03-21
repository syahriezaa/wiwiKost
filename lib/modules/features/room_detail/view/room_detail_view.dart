import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wiwikost/config/themes/colours.dart';
import 'package:wiwikost/constant/core/asset_const.dart';
import 'package:wiwikost/modules/features/room_detail/controller/detail_room_controllers.dart';
import 'package:wiwikost/shared/widget/primary_button.dart';

// ignore: must_be_immutable
class RoomDetailView extends StatelessWidget {
  RoomDetailView({super.key});
  DetailRoomControllers controller = Get.put(DetailRoomControllers());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ///image list view
              Container(
                height: 0.3.sh,
                width: 1.sw,
                child: Obx(
                  () => controller.roomData.value.roomPhotos.isEmpty
                      ? SizedBox(
                          height: 10.w,
                          child: SvgPicture.asset(
                            AssetConst.icEmpty,
                          ),
                        )
                      : ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            if (index <
                                controller.roomData.value.roomPhotos.length) {
                              return Container(
                                height: 0.3.sh,
                                width: 0.9.sw,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.w),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://kos.brotani.com/' +
                                          controller.roomData.value
                                              .roomPhotos[index].roomPhoto,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            } else {
                              return Container();
                            }
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: 10.w,
                            );
                          },
                          itemCount:
                              controller.roomData.value.roomPhotos.length,
                        ),
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20.w),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Kamar ${controller.roomData.value.room.roomNumber}",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colours.greenPrimary1,
                          ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: EdgeInsets.only(right: 20.w),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Tipe:  ${controller.roomData.value.room.roomType}",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20.w),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Lantai ${controller.roomData.value.room.roomFloor}",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: EdgeInsets.only(right: 20.w),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Rp. ${controller.roomData.value.room.price}",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: Colours.greenPrimary1,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.w,
              ),
              Divider(
                color: Colours.greenPrimary1,
                thickness: 1,
                endIndent: 20.w,
                indent: 20.w,
              ),
              Obx(() => Text(
                    // Display selected date
                    controller.selectedDate.value != null
                        ? 'Selected Date: ${controller.selectedDate.value!.toString().split(' ')[0]}'
                        : 'No Date Selected',
                    style: TextStyle(fontSize: 20),
                  )),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Call function to open date picker
                  controller.pickDate(context);
                },
                child: Text('Select Date'),
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20.w),
                      width: 150.w,
                      decoration: BoxDecoration(
                        color: controller.residentCount.value == 1
                            ? Colours.greenPrimary1
                            : Colours.white,
                        border: Border.all(
                          color: Colours.greenPrimary1,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.w),
                          bottomLeft: Radius.circular(20.w),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.w),
                          bottomLeft: Radius.circular(20.w),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              controller.residentCount.value = 1;
                              controller.forMyself.value = 'no';
                            },
                            child: Container(
                              padding: EdgeInsets.all(10.w),
                              alignment: Alignment.center,
                              child: Text(
                                '1 Orang',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: controller.residentCount.value == 1
                                          ? Colours.white
                                          : Colours.greenPrimary1,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20.w),
                      width: 150.w,
                      decoration: BoxDecoration(
                        color: controller.residentCount.value == 2
                            ? Colours.greenPrimary1
                            : Colours.white,
                        border: Border.all(
                          color: Colours.greenPrimary1,
                        ),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.w),
                          bottomRight: Radius.circular(20.w),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.w),
                          bottomRight: Radius.circular(20.w),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              controller.residentCount.value = 2;
                              controller.forMyself.value = 'yes';
                            },
                            child: Container(
                              padding: EdgeInsets.all(10.w),
                              alignment: Alignment.center,
                              child: Text(
                                '2 Orang',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        color:
                                            controller.residentCount.value == 2
                                                ? Colours.white
                                                : Colours.greenPrimary1),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20.w),
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: controller.duration.value == 1
                            ? Colours.greenPrimary1
                            : Colours.white,
                        border: Border.all(
                          color: Colours.greenPrimary1,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.w),
                          bottomLeft: Radius.circular(20.w),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.w),
                          bottomLeft: Radius.circular(20.w),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              controller.duration.value = 1;
                            },
                            child: Container(
                              padding: EdgeInsets.all(10.w),
                              alignment: Alignment.center,
                              child: Text(
                                '1 bulan',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: controller.duration.value == 1
                                          ? Colours.white
                                          : Colours.greenPrimary1,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20.w),
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: controller.duration.value == 3
                            ? Colours.greenPrimary1
                            : Colours.white,
                        border: const Border.symmetric(
                          horizontal: BorderSide(
                            color: Colours.greenPrimary1,
                          ),
                        ),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(0.w),
                          bottomRight: Radius.circular(0.w),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(0.w),
                          bottomRight: Radius.circular(0.w),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              controller.duration.value = 3;
                            },
                            child: Container(
                              padding: EdgeInsets.all(10.w),
                              alignment: Alignment.center,
                              child: Text(
                                '3 bulan',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        color: controller.duration.value == 3
                                            ? Colours.white
                                            : Colours.greenPrimary1),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20.w),
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: controller.duration.value == 6
                            ? Colours.greenPrimary1
                            : Colours.white,
                        border: Border.all(
                          color: Colours.greenPrimary1,
                        ),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.w),
                          bottomRight: Radius.circular(20.w),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.w),
                          bottomRight: Radius.circular(20.w),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              controller.duration.value = 6;
                            },
                            child: Container(
                              padding: EdgeInsets.all(10.w),
                              alignment: Alignment.center,
                              child: Text(
                                '6 bulan',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        color: controller.duration.value == 6
                                            ? Colours.white
                                            : Colours.greenPrimary1),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.w,
              ),
              Obx(() => controller.residentCount.value == 2
                  ? Column(
                      children: [
                        Text("Tambahkan Penghuni",
                            style: Theme.of(context).textTheme.bodyMedium),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: controller.fullNameController,
                            keyboardType: TextInputType.name,
                            style: Theme.of(context).textTheme.labelLarge,
                            decoration: InputDecoration(
                              labelText: 'Nama Lengkap',
                              labelStyle:
                                  Theme.of(context).textTheme.labelLarge,
                              hintText: 'Masukkan Nama Lengkap',
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colours.greenPrimary,
                                ),
                              ),
                              border: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colours.greenPrimary,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.w),
                        //nomor hp
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: controller.phoneNumberController,
                            keyboardType: TextInputType.phone,
                            style: Theme.of(context).textTheme.labelLarge,
                            decoration: InputDecoration(
                              labelText: 'Nomor HP',
                              labelStyle:
                                  Theme.of(context).textTheme.labelLarge,
                              hintText: 'Masukkan Nomor HP',
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colours.greenPrimary,
                                ),
                              ),
                              border: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colours.greenPrimary,
                                ),
                              ),
                            ),
                          ),
                        ),
                        //alamat
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: controller.addressController,
                            keyboardType: TextInputType.streetAddress,
                            style: Theme.of(context).textTheme.labelLarge,
                            decoration: InputDecoration(
                              labelText: 'Alamat',
                              labelStyle:
                                  Theme.of(context).textTheme.labelLarge,
                              hintText: 'Masukkan Alamat',
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colours.greenPrimary,
                                ),
                              ),
                              border: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colours.greenPrimary,
                                ),
                              ),
                            ),
                          ),
                        ),
                        //nik
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: controller.nikController,
                            keyboardType: TextInputType.number,
                            style: Theme.of(context).textTheme.labelLarge,
                            decoration: InputDecoration(
                              labelText: 'NIK',
                              labelStyle:
                                  Theme.of(context).textTheme.labelLarge,
                              hintText: 'Masukkan NIK',
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colours.greenPrimary,
                                ),
                              ),
                              border: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colours.greenPrimary,
                                ),
                              ),
                            ),
                          ),
                        ),

                        ///Upload foto
                        SizedBox(height: 20.w),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Text(
                              'Upload Foto',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.w),
                        Align(
                          alignment: Alignment.center,
                          child: DottedBorder(
                            dashPattern: const [5, 6],
                            radius: const Radius.circular(15),
                            strokeCap: StrokeCap.round,
                            borderType: BorderType.RRect,
                            child: ClipRRect(
                              child: Container(
                                height: 0.2.sh,
                                width: 0.9.sw,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                                child: Obx(
                                  () => controller.selectedUserImage.value ==
                                          null
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                                onTap: () {
                                                  controller.selectUserImage();
                                                },
                                                child: SvgPicture.asset(
                                                    AssetConst.icUpload)),
                                            Text(
                                              'Browse your files',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall,
                                            ),
                                          ],
                                        )
                                      : Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 0.2.sh,
                                              width: 0.9.sw,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15.r),
                                                image: DecorationImage(
                                                  image: FileImage(controller
                                                      .selectedUserImage
                                                      .value!),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.w),
                        Obx(
                          () => controller.selectedUserImage.value != null
                              ? Container(
                                  width: 0.9.sw,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15.w, vertical: 10.w),
                                  decoration: BoxDecoration(
                                    color: Colors.blue[100],
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.image,
                                        color: Colors.blue[900],
                                      ),
                                      const Spacer(),
                                      Text(
                                        controller.userImageNames.value,
                                        // controller.imageNames.value,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            controller.selectedUserImage.value =
                                                null;
                                            // controller.isSecondNextButtonEnabled.value =
                                            //     controller.areSecondPageFilled();
                                          },
                                          child: const Icon(Icons.delete))
                                    ],
                                  ),
                                )
                              : SizedBox(
                                  height: 2.w,
                                ),
                        ),

                        ///Upload ktp

                        SizedBox(height: 20.w),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Text(
                              'Upload KTP',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.w),
                        Align(
                          alignment: Alignment.center,
                          child: DottedBorder(
                            dashPattern: const [5, 6],
                            radius: const Radius.circular(15),
                            strokeCap: StrokeCap.round,
                            borderType: BorderType.RRect,
                            child: ClipRRect(
                              child: Container(
                                height: 0.2.sh,
                                width: 0.9.sw,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                                child: Obx(
                                  () => controller.ktpSelectedImage.value ==
                                          null
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                                onTap: () {
                                                  controller.selectKTPImage();
                                                },
                                                child: SvgPicture.asset(
                                                    AssetConst.icUpload)),
                                            Text(
                                              'Browse your files',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall,
                                            ),
                                          ],
                                        )
                                      : Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 0.2.sh,
                                              width: 0.9.sw,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15.r),
                                                image: DecorationImage(
                                                  image: FileImage(controller
                                                      .ktpSelectedImage.value!),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.w),
                        Obx(
                          () => controller.ktpSelectedImage.value != null
                              ? Container(
                                  width: 0.9.sw,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15.w, vertical: 10.w),
                                  decoration: BoxDecoration(
                                    color: Colors.blue[100],
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.image,
                                        color: Colors.blue[900],
                                      ),
                                      const Spacer(),
                                      Text(
                                        controller.ktpImageName.value,

                                        // controller.imageNames.value,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            controller.ktpSelectedImage.value =
                                                null;
                                            // controller.isSecondNextButtonEnabled.value =
                                            //     controller.areSecondPageFilled();
                                          },
                                          child: const Icon(Icons.delete))
                                    ],
                                  ),
                                )
                              : SizedBox(
                                  height: 2.w,
                                ),
                        ),

                        ///upload KTP
                        SizedBox(height: 20.w),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Text(
                              'Upload KTM',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.w),
                        Align(
                          alignment: Alignment.center,
                          child: DottedBorder(
                            dashPattern: const [5, 6],
                            radius: const Radius.circular(15),
                            strokeCap: StrokeCap.round,
                            borderType: BorderType.RRect,
                            child: ClipRRect(
                              child: Container(
                                height: 0.2.sh,
                                width: 0.9.sw,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                                child: Obx(
                                  () => controller.ktmSelectedImage.value ==
                                          null
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                                onTap: () {
                                                  controller.selectKTMImage();
                                                },
                                                child: SvgPicture.asset(
                                                    AssetConst.icUpload)),
                                            Text(
                                              'Browse your files',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall,
                                            ),
                                          ],
                                        )
                                      : Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 0.2.sh,
                                              width: 0.9.sw,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15.r),
                                                image: DecorationImage(
                                                  image: FileImage(controller
                                                      .ktmSelectedImage.value!),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.w),
                        Obx(
                          () => controller.ktmSelectedImage.value != null
                              ? Container(
                                  width: 0.9.sw,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15.w, vertical: 10.w),
                                  decoration: BoxDecoration(
                                    color: Colors.blue[100],
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.image,
                                        color: Colors.blue[900],
                                      ),
                                      const Spacer(),
                                      Text(
                                        controller.ktmImageName.value,
                                        // controller.imageNames.value,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            controller.ktmSelectedImage.value =
                                                null;
                                            // controller.isSecondNextButtonEnabled.value =
                                            //     controller.areSecondPageFilled();
                                          },
                                          child: const Icon(Icons.delete))
                                    ],
                                  ),
                                )
                              : SizedBox(
                                  height: 2.w,
                                ),
                        ),
                        SizedBox(height: 20.w),
                      ],
                    )
                  : const SizedBox()),
              PrimaryButton(
                  text: "Pesan Kamar",
                  onPressed: () {
                    controller.registerOccupy();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
