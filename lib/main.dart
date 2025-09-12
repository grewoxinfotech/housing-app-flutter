import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:housing_flutter_app/app/constants/color_res.dart';
import 'package:housing_flutter_app/data/database/secure_storage_service.dart';
import 'package:housing_flutter_app/modules/auth/views/login_screen.dart';
import 'package:housing_flutter_app/modules/auth/views/splash_screen.dart';
import 'package:housing_flutter_app/app/services/network_status_service.dart';

import 'package:housing_flutter_app/modules/auth/controllers/auth_controller.dart';
import 'package:housing_flutter_app/modules/dashboard/views/dashboard_screen.dart';
import 'package:housing_flutter_app/modules/propert_detail/view/property_details.dart';
import 'package:housing_flutter_app/modules/property/views/property_list_screen.dart';
import 'package:housing_flutter_app/modules/property/views/widgets/property_card.dart';

import 'app/theme/themes.dart' as AppTheme;
import 'modules/saved_property/views/saved_property_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: ColorRes.primary, // Status bar background color
      statusBarIconBrightness: Brightness.dark, // Android: dark icons
      statusBarBrightness: Brightness.light, // iOS: dark icons
    ),
  );

  await Get.putAsync(() => NetworkStatusService().init());
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: SplashScreen(),
      builder: (context, child) {
        final mediaQuery = MediaQuery.of(context);
        return MediaQuery(
          data: mediaQuery.copyWith(
            textScaler: const TextScaler.linear(1.0), // Lock font scaling
          ),
          child: child!,
        );
      },
    ),
  );
}
