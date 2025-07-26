import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:housing_flutter_app/modules/auth/models/user_model.dart';
import 'package:provider/provider.dart';
import '../../../../app/constants/api_constants.dart';
import 'package:housing_flutter_app/data/database/secure_storage_service.dart';
import 'package:get/get.dart';
import 'package:housing_flutter_app/app/widgets/snackbar/crm_snackbar.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

import '../../../../modules/home/controllers/home_controller.dart';
import '../../../../modules/home/views/home_screen.dart';

class AuthService {
  final String url = ApiConstants.loginEndpoint;
  final String i = ApiConstants.contentType;
  final String j = ApiConstants.applicationJson;

  // Login
  Future<void> login(String email, String password) async {
    final loginData = {"login": email, "password": password};
    print('$email--------------$password');

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {i: j},
        body: jsonEncode(loginData),
      );

      final data = jsonDecode(response.body);
      if (response.statusCode == 200 && data["success"] == true) {
        final token = data['data']['token'];
        final user = UserModel.fromJson(data['data']['user']);
        await SecureStorage.saveToken(token);
        await SecureStorage.saveUserData(user);
        await SecureStorage.saveRememberMe(true);
        await SecureStorage.saveLoggedIn(true);

        Get.offAll(() => HomeScreen());


        CrmSnackBar.showAwesomeSnackbar(
          title: "Welcome!",
          message: "Login successful!",
          contentType: ContentType.success,
        );
      } else {
        print('faild*-*-*-*-* $data');
        CrmSnackBar.showAwesomeSnackbar(
          title: "Login Failed",
          message: data["message"] ?? "Unknown error",
          contentType: ContentType.warning,
        );
      }
    } catch (e) {
      CrmSnackBar.showAwesomeSnackbar(
        title: "Error",
        message: "Something went wrong: $e",
        contentType: ContentType.failure,
      );
    }
  }

  // Register
  Future<bool> register(
    BuildContext context, {
    required String name,
    required String email,
    required String phone,
    required String password,
    required String role,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$url/register'),
        headers: {i: j},
        body: jsonEncode({
          'name': name,
          'email': email,
          'phone': phone,
          'password': password,
          'role': role,
        }),
      );

      final data = jsonDecode(response.body);
      if (response.statusCode == 201 && data["success"] == true) {
        CrmSnackBar.showAwesomeSnackbar(

          title: "Success",
          message: "Registration successful!",
          contentType: ContentType.success,
        );

        return true;
      } else {
        CrmSnackBar.showAwesomeSnackbar(

          title: "Registration Failed",
          message: data["message"] ?? "Unknown error",
          contentType: ContentType.warning,
        );

        return false;
      }
    } catch (e) {
      CrmSnackBar.showAwesomeSnackbar(
        title: "Error",
        message: "Something went wrong: $e",
        contentType: ContentType.failure,
      );

      return false;
    }
  }

  // Request OTP
  Future<String?> requestOtp(BuildContext context, String phone) async {
    try {
      final response = await http.post(
        Uri.parse('$url/otp/request'),
        headers: {i: j},
        body: jsonEncode({'phone': phone}),
      );

      final data = jsonDecode(response.body);
      if (response.statusCode == 200 && data["success"] == true) {
        CrmSnackBar.showAwesomeSnackbar(
          title: "OTP Sent",
          message: "Verification code sent to your phone",
          contentType: ContentType.success,
        );

        // Return verification ID needed for verification
        return data['data']['verificationId'];
      } else {
        CrmSnackBar.showAwesomeSnackbar(
          title: "Failed",
          message: data["message"] ?? "Failed to send OTP",
          contentType: ContentType.warning,
        );

        return null;
      }
    } catch (e) {
      CrmSnackBar.showAwesomeSnackbar(
        title: "Error",
        message: "Something went wrong: $e",
        contentType: ContentType.failure,
      );

      return null;
    }
  }

  // Verify OTP
  Future<bool> verifyOtp(
    BuildContext context,
    String verificationId,
    String otp,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$url/otp/verify'),
        headers: {i: j},
        body: jsonEncode({'verificationId': verificationId, 'otp': otp}),
      );

      final data = jsonDecode(response.body);
      if (response.statusCode == 200 && data["success"] == true) {
        // Save token and user data if available
        if (data['data'] != null) {
          if (data['data']['token'] != null) {
            await SecureStorage.saveToken(data['data']['token']);
          }

          if (data['data']['user'] != null) {
            final user = UserModel.fromJson(data['data']['user']);
            await SecureStorage.saveUserData(user);
            await SecureStorage.saveLoggedIn(true);
          }
        }

        CrmSnackBar.showAwesomeSnackbar(
          title: "Success",
          message: "OTP verified successfully",
          contentType: ContentType.success,
        );

        return true;
      } else {
        CrmSnackBar.showAwesomeSnackbar(
          title: "Verification Failed",
          message: data["message"] ?? "Invalid OTP",
          contentType: ContentType.warning,
        );

        return false;
      }
    } catch (e) {
      CrmSnackBar.showAwesomeSnackbar(
        title: "Error",
        message: "Something went wrong: $e",
        contentType: ContentType.failure,
      );

      return false;
    }
  }

  // Get current user
  Future<UserModel?> getCurrentUser() async {
    try {
      final token = await SecureStorage.getToken();

      if (token == null) {
        return null;
      }

      final response = await http.get(
        Uri.parse('$url/me'),
        headers: {'Authorization': 'Bearer $token', i: j},
      );

      final data = jsonDecode(response.body);
      if (response.statusCode == 200 && data["success"] == true) {
        return UserModel.fromJson(data['data']['user']);
      } else if (response.statusCode == 401) {
        // Token expired or invalid
        await SecureStorage.deleteToken();
        return null;
      } else {
        print('Failed to get user profile: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Get current user failed: $e');
      return null;
    }
  }

  // Logout
  Future<bool> logout() async {
    try {
      await SecureStorage.clearAll();
      return true;
    } catch (e) {
      print('Logout error: $e');
      return false;
    }
  }

  // Update profile
  Future<UserModel?> updateProfile(
    BuildContext context, {
    required String userId,
    String? name,
    String? phone,
    String? address,
  }) async {
    try {
      final token = await SecureStorage.getToken();

      if (token == null) {
        throw Exception('Not authenticated');
      }

      final Map<String, dynamic> body = {};
      if (name != null) body['name'] = name;
      if (phone != null) body['phone'] = phone;
      if (address != null) body['address'] = address;

      final response = await http.patch(
        Uri.parse('$url/users/$userId'),
        headers: {'Authorization': 'Bearer $token', i: j},
        body: jsonEncode(body),
      );

      final data = jsonDecode(response.body);
      if (response.statusCode == 200 && data["success"] == true) {
        final user = UserModel.fromJson(data['data']['user']);
        await SecureStorage.saveUserData(user);
        return user;
      } else {
        CrmSnackBar.showAwesomeSnackbar(
          title: "Update Failed",
          message: data["message"] ?? "Failed to update profile",
          contentType: ContentType.warning,
        );
        return null;
      }
    } catch (e) {
      CrmSnackBar.showAwesomeSnackbar(
        title: "Error",
        message: "Something went wrong: $e",
        contentType: ContentType.failure,
      );
      return null;
    }
  }

  // Reset password
  Future<bool> resetPassword(BuildContext context, String email) async {
    try {
      final response = await http.post(
        Uri.parse('$url/reset-password'),
        headers: {i: j},
        body: jsonEncode({'email': email}),
      );

      final data = jsonDecode(response.body);
      if (response.statusCode == 200 && data["success"] == true) {
        CrmSnackBar.showAwesomeSnackbar(
          title: "Success",
          message: "Password reset instructions sent to your email",
          contentType: ContentType.success,
        );
        return true;
      } else {
        CrmSnackBar.showAwesomeSnackbar(

          title: "Reset Failed",
          message: data["message"] ?? "Failed to reset password",
          contentType: ContentType.warning,
        );
        return false;
      }
    } catch (e) {
      CrmSnackBar.showAwesomeSnackbar(
        title: "Error",
        message: "Something went wrong: $e",
        contentType: ContentType.failure,
      );
      return false;
    }
  }
}
