import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housing_flutter_app/modules/auth/views/splash_screen.dart';
import 'package:housing_flutter_app/app/services/network_status_service.dart';
import 'package:provider/provider.dart';
import 'package:housing_flutter_app/modules/auth/controllers/auth_controller.dart';

import 'app/theme/themes.dart' as AppTheme;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => NetworkStatusService().init());

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: SplashScreen(),
    ),
  );

  // runApp(
  //   ChangeNotifierProvider(
  //     create: (_) => AuthController(),
  //     child: GetMaterialApp(
  //       debugShowCheckedModeBanner: false,
  //       theme: AppTheme.lightTheme,
  //       home: SplashScreen(),
  //     ),
  //   ),
  // );
}
