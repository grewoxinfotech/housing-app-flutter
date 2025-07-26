
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housing_flutter_app/app/theme/app_theme.dart';
import 'package:housing_flutter_app/modules/auth/views/splash_screen.dart';
import 'package:housing_flutter_app/app/services/network_status_service.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => NetworkStatusService().init());


  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: AppTheme.lightTheme,
    home: SplashScreen(),
  ));
}
