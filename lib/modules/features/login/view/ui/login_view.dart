import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wiwikost/config/themes/colours.dart';
import 'package:wiwikost/constant/core/asset_const.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
                hintText: 'Masukkan username',
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
              obscureText: true,
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  // Get.toNamed(AppRoutes.forgotPassword);
                },
                child: Text(
                  'Lupa Password?',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Colours.greenPrimary2,
                      ),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.w,
          ),
          SizedBox(
            width: 0.9.sw,
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed('/home');
              },
              child: Text('Login'),
            ),
          ),
          SizedBox(
            width: 0.9.sw,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colours.greenPrimary1,
              ),
              onPressed: () {
                Get.toNamed('/register');
              },
              child: Text(
                'register',
                style: TextStyle(color: Colours.white),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
