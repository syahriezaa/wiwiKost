import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wiwikost/config/themes/colours.dart';
import 'package:wiwikost/constant/core/asset_const.dart';
import 'package:wiwikost/shared/widget/primary_button.dart';
import 'package:dotted_border/dotted_border.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

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
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: Theme.of(context).textTheme.labelLarge,
                  hintText: 'Masukkan Username',
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
            //fullname
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nama Lengkap',
                  labelStyle: Theme.of(context).textTheme.labelLarge,
                  hintText: 'Masukkan Nama Lengkap',
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
            SizedBox(height: 20.w),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: Theme.of(context).textTheme.labelLarge,
                  hintText: 'Masukkan password',
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
            SizedBox(height: 20.w),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Konfirmasi Password',
                  labelStyle: Theme.of(context).textTheme.labelLarge,
                  hintText: 'Masukkan password',
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
            //nomor hp
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Nomor HP',
                  labelStyle: Theme.of(context).textTheme.labelLarge,
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
            //alamat
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Alamat',
                  labelStyle: Theme.of(context).textTheme.labelLarge,
                  hintText: 'Masukkan Alamat',
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
            //nik
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'NIK',
                  labelStyle: Theme.of(context).textTheme.labelLarge,
                  hintText: 'Masukkan NIK',
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
            SizedBox(height: 20.w),
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: () {},
                            child: SvgPicture.asset(AssetConst.icBooking)),
                        Text(
                          'Browse your files',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.w),
            Container(
              width: 0.9.sw,
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.w),
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
                    'dsassd',
                    // controller.imageNames.value,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  InkWell(
                      onTap: () {
                        // controller.selectedImage.value = null;
                        // controller.isSecondNextButtonEnabled.value =
                        //     controller.areSecondPageFilled();
                      },
                      child: const Icon(Icons.delete))
                ],
              ),
            ),
            SizedBox(height: 20.w),

            SizedBox(
              width: 0.9.sw,
              child: PrimaryButton(
                text: "Register",
                onPressed: () {
                  Get.toNamed('/home');
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
