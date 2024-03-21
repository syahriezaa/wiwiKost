import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wiwikost/config/pages/app_pages.dart';
import 'package:wiwikost/config/routes/app_routes.dart';
import 'package:wiwikost/config/themes/app_theme.dart';
import 'package:wiwikost/constant/commons/app_const.dart';
import 'package:wiwikost/shared/services/disable.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  Get.testMode = true;
  WidgetsFlutterBinding.ensureInitialized();

  ///Run APP
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
      designSize: AppConst.designSize,
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppConst.appName,
        initialRoute: AppRoutes.startscreen,
        getPages: AppPages.getPages(),
        theme: AppTheme.mainTheme,
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1.0)),
          child: child!,
        ),
      ),
    );
  }
}
