import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wiwikost/config/themes/colours.dart';
import 'package:wiwikost/constant/core/asset_const.dart';
import 'package:wiwikost/modules/features/register/controllers/register_controllers.dart';
import 'package:wiwikost/shared/widget/primary_button.dart';
import 'package:dotted_border/dotted_border.dart';

// ignore: must_be_immutable
class RegisterView extends StatelessWidget {
  RegisterView({super.key});
  RegisterControllers controller = Get.put(RegisterControllers());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 60.w,
            ),
            SizedBox(
              height: 200.w,
              child: SvgPicture.asset(AssetConst.icLogin),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: controller.usernameController,
                keyboardType: TextInputType.name,
                style: Theme.of(context).textTheme.labelLarge,
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: Theme.of(context).textTheme.labelLarge,
                  hintText: 'Masukkan Username',
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
            //fullname
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: controller.fullNameController,
                keyboardType: TextInputType.name,
                style: Theme.of(context).textTheme.labelLarge,
                decoration: InputDecoration(
                  labelText: 'Nama Lengkap',
                  labelStyle: Theme.of(context).textTheme.labelLarge,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: controller.passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                style: Theme.of(context).textTheme.labelLarge,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: Theme.of(context).textTheme.labelLarge,
                  hintText: 'Masukkan password',
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
            //nomor hp
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: controller.phoneNumberController,
                keyboardType: TextInputType.phone,
                style: Theme.of(context).textTheme.labelLarge,
                decoration: InputDecoration(
                  labelText: 'Nomor HP',
                  labelStyle: Theme.of(context).textTheme.labelLarge,
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
                  labelStyle: Theme.of(context).textTheme.labelLarge,
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
                  labelStyle: Theme.of(context).textTheme.labelLarge,
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
                      () => controller.selectedUserImage.value == null
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                    onTap: () {
                                      controller.selectUserImage();
                                    },
                                    child:
                                        SvgPicture.asset(AssetConst.icUpload)),
                                Text(
                                  'Browse your files',
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 0.2.sh,
                                  width: 0.9.sw,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.r),
                                    image: DecorationImage(
                                      image: FileImage(
                                          controller.selectedUserImage.value!),
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
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          InkWell(
                              onTap: () {
                                controller.selectedUserImage.value = null;
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
                      () => controller.ktpSelectedImage.value == null
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                    onTap: () {
                                      controller.selectKTPImage();
                                    },
                                    child:
                                        SvgPicture.asset(AssetConst.icUpload)),
                                Text(
                                  'Browse your files',
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 0.2.sh,
                                  width: 0.9.sw,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.r),
                                    image: DecorationImage(
                                      image: FileImage(
                                          controller.ktpSelectedImage.value!),
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
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          InkWell(
                              onTap: () {
                                controller.ktpSelectedImage.value = null;
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
                      () => controller.ktmSelectedImage.value == null
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                    onTap: () {
                                      controller.selectKTMImage();
                                    },
                                    child:
                                        SvgPicture.asset(AssetConst.icUpload)),
                                Text(
                                  'Browse your files',
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 0.2.sh,
                                  width: 0.9.sw,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.r),
                                    image: DecorationImage(
                                      image: FileImage(
                                          controller.ktmSelectedImage.value!),
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
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          InkWell(
                              onTap: () {
                                controller.ktmSelectedImage.value = null;
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
            SizedBox(
              width: 0.9.sw,
              child: PrimaryButton(
                text: "Register",
                onPressed: () {
                  controller.register();
                },
              ),
            ),
            SizedBox(height: 20.w),
          ],
        ),
      ),
    );
  }
}
