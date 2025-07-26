import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:housing_flutter_app/data/network/auth/service/auth_service.dart';
import 'package:housing_flutter_app/data/database/secure_storage_service.dart';
import 'package:housing_flutter_app/modules/auth/models/user_model.dart';
import 'package:housing_flutter_app/widgets/messages/crm_snack_bar.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

enum AuthState { initial, authenticated, unauthenticated }

enum UserRole { seller, reseller }

class AuthController extends GetxController {
  final AuthService _authService = AuthService();

  AuthState _authState = AuthState.initial;
  String? _errorMessage;
  String? _verificationId;
  UserRole _selectedRole = UserRole.seller;
  UserModel? _currentUser;

  // Getters
  AuthState get authState => _authState;

  String? get errorMessage => _errorMessage;

  String? get verificationId => _verificationId;

  UserRole get selectedRole => _selectedRole;

  UserModel? get currentUser => _currentUser;

  final isLoading = false.obs;
  final rememberMe = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final authService = AuthService();

  void fillTestCredentials() {
    emailController.text = "g@yopmail.com";
    passwordController.text = "SuperAdmin@123";
  }

  // // Set role
  // void setRole(UserRole role) {
  //   _selectedRole = role;
  //   notifyListeners();
  // }
  //
  // // Check if user is logged in
  // Future<void> checkAuthStatus() async {
  //   final token = await SecureStorage.getToken();
  //   if (token != null && token.isNotEmpty) {
  //     _authState = AuthState.authenticated;
  //
  //     // Try to get user data if available
  //     try {
  //       final userData = await SecureStorage.getUserData();
  //       if (userData != null) {
  //         _currentUser = userData;
  //       }
  //     } catch (e) {
  //       print('Error loading user data: $e');
  //     }
  //   } else {
  //     _authState = AuthState.unauthenticated;
  //   }
  //   notifyListeners();
  // }

  // Login
  // Future<bool> login(String email, String password) async {
  //   try {
  //     final success = await _authService.login(email, password);
  //     print("email: $email");
  //     print("password: $password");

  //     if (success) {
  //       _authState = AuthState.authenticated;
  //       _errorMessage = null;
  //       notifyListeners();
  //       return true;
  //     } else {
  //       _errorMessage = "Login failed";
  //       notifyListeners();
  //       return false;
  //     }
  //   } catch (e) {
  //     print('error11------------ ${e.toString()}');

  //     _errorMessage = "An error occurred during login: ${e.toString()}";
  //     notifyListeners();
  //     return false;
  //   }
  // }

  Future<void> login(String userName, String password) async {
    //if (!(formKey.currentState?.validate() ?? false)) return;


    if (!rememberMe.value) {
      CrmSnackBar.showAwesomeSnackbar(
        title: "Remember Me",
        message: "Please enable 'Remember Me' to continue.",
        contentType: ContentType.help,
      );
      return;
    }
    // print("$userName+$password");
    isLoading.value = true;
    try {
      await authService.login(userName, password);
      // print('print from controller/ $userName,$password');
    } finally {
      isLoading.value = false;
    }
  }

  void logout() => authService.logout();

  // Register
  Future<bool> register(
    BuildContext context,
    String name,
    String email,
    String phone,
    String password,
  ) async {
    try {
      final success = await _authService.register(
        context,
        name: name,
        email: email,
        phone: phone,
        password: password,
        role: _selectedRole == UserRole.seller ? 'seller' : 'reseller',
      );

      if (success) {
        _errorMessage = null;
      //  notifyListeners();
        return true;
      } else {
        _errorMessage = "Registration failed";
      //  notifyListeners();
        return false;
      }
    } catch (e) {
      _errorMessage = "An error occurred during registration: ${e.toString()}";
     // notifyListeners();
      return false;
    }
  }


  //
  // // Request OTP
  // Future<bool> requestOtp(BuildContext context, String phone) async {
  //   try {
  //     final result = await _authService.requestOtp(context, phone);
  //     if (result != null) {
  //       _verificationId = result;
  //       _errorMessage = null;
  //       notifyListeners();
  //       return true;
  //     } else {
  //       _errorMessage = "Failed to send OTP";
  //       notifyListeners();
  //       return false;
  //     }
  //   } catch (e) {
  //     _errorMessage = "An error occurred: ${e.toString()}";
  //     notifyListeners();
  //     return false;
  //   }
  // }
  //
  // // Verify OTP
  // Future<bool> verifyOtp(BuildContext context, String otp) async {
  //   try {
  //     if (_verificationId == null) {
  //       _errorMessage = "Verification ID is missing";
  //       notifyListeners();
  //       return false;
  //     }
  //
  //     final success = await _authService.verifyOtp(
  //       context,
  //       _verificationId!,
  //       otp,
  //     );
  //     if (success) {
  //       _authState = AuthState.authenticated;
  //       _errorMessage = null;
  //       notifyListeners();
  //       return true;
  //     } else {
  //       _errorMessage = "OTP verification failed";
  //       notifyListeners();
  //       return false;
  //     }
  //   } catch (e) {
  //     _errorMessage =
  //         "An error occurred during OTP verification: ${e.toString()}";
  //     notifyListeners();
  //     return false;
  //   }
  // }
  //
  // // Logout
  // Future<bool> logout() async {
  //   try {
  //     final success = await _authService.logout();
  //     if (success) {
  //       _authState = AuthState.unauthenticated;
  //       _currentUser = null;
  //       notifyListeners();
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } catch (e) {
  //     print("Logout error: ${e.toString()}");
  //     return false;
  //   }
  // }
  //
  // // Reset error message
  // void resetError() {
  //   _errorMessage = null;
  //   notifyListeners();
  // }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
