import 'dart:convert';
import 'package:housing_flutter_app/data/network/auth/model/user_model.dart';
import 'package:housing_flutter_app/modules/auth/views/login_screen.dart';
import 'package:http/http.dart' as http;
import '../../../../app/constants/api_constants.dart';
import 'package:housing_flutter_app/data/database/secure_storage_service.dart';
import 'package:get/get.dart';

class AuthService {
  final String url = ApiConstants.auth;
  final String i = ApiConstants.contentType;
  final String j = ApiConstants.applicationJson;

  static Future<Map<String, String>> headers() async {
    return await ApiConstants.getHeaders();
  }

  // Login
  Future<UserModel> login(String email, String password) async {

    final response = await http.post(
      Uri.parse(ApiConstants.loginEndpoint),
      headers: {i: j},
      body: jsonEncode({'id': email, 'password': password}),
    );
    final data = jsonDecode(response.body);

    if (response.statusCode == 200 && data["success"] == true) {
      return UserModel.fromJson(data['data']);
    } else {
      throw Exception(data["message"] ?? "Login failed");
    }
  }

  Future<Map<String, dynamic>> register({
    required String username,
    required String password,
    required String email,
    required String userType,
    required String firstName,
    required String lastName,
    required String phone,
    required String address,
    required String city,
    required String state,
    required String zipCode,
  }) async {
    final response = await http.post(
      Uri.parse(ApiConstants.registerEndpoint),
      headers: {i: j},
      body: jsonEncode({
        'username': username,
        'password': password,
        'email': email,
        'userType': userType,
        'firstName': firstName,
        'lastName': lastName,
        'phone': phone,
        'address': address,
        'city': city,
        'state': state,
        'zipCode': zipCode,
      }),
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return data;
    } else {
      throw Exception(data['message'] ?? 'Registration failed');
    }
  }

  Future<void> resendOtp(String token) async {
    final response = await http.post(
      Uri.parse('${ApiConstants.auth}/resend-otp'),
      headers: await headers(),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode != 200 || data['success'] != true) {
      throw Exception(data['message'] ?? 'Failed to resend OTP');
    }
  }

  Future<UserModel> verifyOtp(String otp, String token) async {
    final response = await http.post(
      Uri.parse('${ApiConstants.auth}/verify-otp'),
      headers: await headers(),
      body: jsonEncode({'otp': otp}),
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 200 && data['success'] == true) {
      return UserModel.fromJson(data['data']['user'])
        ..token = data['data']['token'] ?? token;
    }
    throw Exception(data['message'] ?? 'OTP verification failed');
  }

  // Future<String> forgotPassword(String email) async {
  //   final response = await http.post(
  //     Uri.parse('${ApiConstants.auth}/forgot-password'),
  //     headers: {i: j},
  //     body: jsonEncode({'email': email}),
  //   );
  //
  //   final data = jsonDecode(response.body);
  //   if (response.statusCode == 200 && data['success'] == true) {
  //     print("Forget Password Data: $data");
  //     return data['data']['token'];
  //   } else {
  //     throw Exception(data['message'] ?? 'Incorrect Email');
  //   }
  // }

  // In AuthService class

  Future<String> forgotPassword(String id) async {
    final response = await http.post(
      Uri.parse('${ApiConstants.auth}/forgot-password'),
      headers: {i: j},
      body: jsonEncode({'id': id}),
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 200 && data['success'] == true) {
      return data['data']['token'];
    } else {
      throw Exception(data["message"] ?? "Failed to send OTP");
    }
  }

  Future<String> verifyPasswordResetOtp(String otp, String token) async {
    final response = await http.post(
      Uri.parse('${ApiConstants.auth}/verify-otp'),
      headers: {i: j, 'Authorization': 'Bearer $token'},
      body: jsonEncode({'otp': otp}),
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 200 && data['success'] == true) {
      return data['data']['resetToken'];
    } else {
      throw Exception(data["message"] ?? "OTP verification failed");
    }
  }

  Future<void> resetPassword(String newPassword, String resetToken) async {
    final response = await http.post(
      Uri.parse('${ApiConstants.auth}/reset-password'),
      headers: {i: j, 'Authorization': 'Bearer $resetToken'},
      body: jsonEncode({'newPassword': newPassword}),
    );

    print("dfjdhfjdhfik$newPassword");

    final data = jsonDecode(response.body);
    if (response.statusCode != 200 || data['success'] != true) {
      throw Exception(data["message"] ?? "Password reset failed");
    }
  }

  Future<void> logout() async {
    await SecureStorage.clearAll();
    Get.offAll(LoginScreen());
  }
}

// Get current user
// Future<UserModel?> getCurrentUser() async {
//   try {
//     final token = await SecureStorage.getToken();
//
//     if (token == null) {
//       return null;
//     }
//
//     final response = await http.get(
//       Uri.parse('$url/me'),
//       headers: {'Authorization': 'Bearer $token', i: j},
//     );
//
//     final data = jsonDecode(response.body);
//     if (response.statusCode == 200 && data["success"] == true) {
//       return UserModel.fromJson(data['data']['user']);
//     } else if (response.statusCode == 401) {
//       // Token expired or invalid
//       await SecureStorage.deleteToken();
//       return null;
//     } else {
//       print('Failed to get user profile: ${response.body}');
//       return null;
//     }
//   } catch (e) {
//     print('Get current user failed: $e');
//     return null;
//   }
// }

// Logout
//

// Update profile
//   Future<UserModel?> updateProfile(
//     BuildContext context, {
//     required String userId,
//     String? name,
//     String? phone,
//     String? address,
//   }) async {
//     try {
//       final token = await SecureStorage.getToken();
//
//       if (token == null) {
//         throw Exception('Not authenticated');
//       }
//
//       final Map<String, dynamic> body = {};
//       if (name != null) body['name'] = name;
//       if (phone != null) body['phone'] = phone;
//       if (address != null) body['address'] = address;
//
//       final response = await http.patch(
//         Uri.parse('$url/users/$userId'),
//         headers: {'Authorization': 'Bearer $token', i: j},
//         body: jsonEncode(body),
//       );
//
//       final data = jsonDecode(response.body);
//       if (response.statusCode == 200 && data["success"] == true) {
//         final user = UserModel.fromJson(data['data']['user']);
//         await SecureStorage.saveUserData(user);
//         return user;
//       } else {
//         CrmSnackBar.showAwesomeSnackbar(
//           title: "Update Failed",
//           message: data["message"] ?? "Failed to update profile",
//           contentType: ContentType.warning,
//         );
//         return null;
//       }
//     } catch (e) {
//       CrmSnackBar.showAwesomeSnackbar(
//         title: "Error",
//         message: "Something went wrong: $e",
//         contentType: ContentType.failure,
//       );
//       return null;
//     }
//   }
//
//   // Reset password
//   Future<bool> resetPassword(BuildContext context, String email) async {
//     try {
//       final response = await http.post(
//         Uri.parse('$url/reset-password'),
//         headers: {i: j},
//         body: jsonEncode({'email': email}),
//       );
//
//       final data = jsonDecode(response.body);
//       if (response.statusCode == 200 && data["success"] == true) {
//         CrmSnackBar.showAwesomeSnackbar(
//           title: "Success",
//           message: "Password reset instructions sent to your email",
//           contentType: ContentType.success,
//         );
//         return true;
//       } else {
//         CrmSnackBar.showAwesomeSnackbar(
//
//           title: "Reset Failed",
//           message: data["message"] ?? "Failed to reset password",
//           contentType: ContentType.warning,
//         );
//         return false;
//       }
//     } catch (e) {
//       CrmSnackBar.showAwesomeSnackbar(
//         title: "Error",
//         message: "Something went wrong: $e",
//         contentType: ContentType.failure,
//       );
//       return false;
//     }
//   }
// }
// }
