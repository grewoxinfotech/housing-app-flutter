import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housing_flutter_app/modules/auth/controllers/auth_controller.dart';
import 'package:housing_flutter_app/modules/auth/views/login_screen.dart';
import 'package:housing_flutter_app/modules/home/views/dashboard_screen.dart';

import '../../../data/database/secure_storage_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
 // final authController = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );

    _animationController.forward();

    splash();
    // Timer(const Duration(seconds: 3), () {
    //   _checkAuth();
    // });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // void _checkAuth() async {
  //   try {
  //     if (authController.authState == AuthState.authenticated) {
  //       Get.offAll(() => const DashboardScreen());
  //     } else {
  //       Get.offAll(() => const LoginScreen());
  //     }
  //   } catch (e) {
  //     print('Auth check error: $e');
  //     Get.offAll(() => const LoginScreen());
  //   }
  // }

  void splash() async {
    await Future.delayed(const Duration(seconds:  1));
    bool isLogin = await SecureStorage.getLoggedIn();
    bool rememberMe = await SecureStorage.getRememberMe();
    String? token = await SecureStorage.getToken();

    if (isLogin == true && rememberMe && token != null && token.isNotEmpty) {
      Get.offAll(() => DashboardScreen());
    } else {
      Get.offAll(() => LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo Animation
            ScaleTransition(
              scale: _animation,
              child: FadeTransition(
                opacity: _animation,
                child: Column(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: theme.colorScheme.primary.withOpacity(0.3),
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.home_work,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'BookHome',
                      style: TextStyle(
                        color: theme.colorScheme.primary,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            
            // Tagline with fade animation
            FadeTransition(
              opacity: _animation,
              child: Text(
                'House Cleaning Service',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            
            // Loading indicator
            const SizedBox(height: 60),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(theme.colorScheme.secondary),
              strokeWidth: 3,
            ),
          ],
        ),
      ),
    );
  }
}