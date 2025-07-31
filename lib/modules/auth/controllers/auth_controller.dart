import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:housing_flutter_app/data/network/auth/service/auth_service.dart';
import 'package:housing_flutter_app/data/database/secure_storage_service.dart';
import 'package:housing_flutter_app/modules/auth/models/user_model.dart';
import 'package:housing_flutter_app/widgets/messages/crm_snack_bar.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

import '../../../app/constants/api_constants.dart';
import '../../home/views/dashboard_screen.dart';
import '../views/login_screen.dart';
import '../views/otp_verification_screen.dart';

enum AuthState { initial, authenticated, unauthenticated }

enum UserRole { buyer, seller, reseller }

class AuthController extends GetxController {
  // Initialize services properly
  final AuthService authService = AuthService();
  final SecureStorage secureStorage = SecureStorage();

  // Reactive state
  final authState = AuthState.initial.obs;
  final errorMessage = ''.obs;
  final verificationId = ''.obs;
  final selectedRole = UserRole.seller.obs;
  final currentUser = Rxn<UserModel>();
  final isLoading = false.obs;
  final rememberMe = false.obs;

  // Form controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  // Getters
  String get selectedRoleString =>
      selectedRole.value.toString().split('.').last;

  @override
  void onInit() {
    super.onInit();
    checkAuthStatus();
  }

  //test-commit
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void fillTestCredentials() {
    emailController.text = "pAlk";
    passwordController.text = "password123";
  }

  void setRole(UserRole role) => selectedRole.value = role;

  Future<void> login(String email, String password) async {
    try {
      isLoading.value = true;

      final user = await authService.login(email, password);

      await SecureStorage.saveToken(user.token!);
      await SecureStorage.saveUserData(user);
      await SecureStorage.saveRememberMe(rememberMe.value);
      await SecureStorage.saveLoggedIn(true);
      currentUser.value = user;
      print("[Debug]-> User data: ${currentUser.value!.user!.firstName}");
      authState.value = AuthState.authenticated;

      Get.offAll(() => DashboardScreen());
    } catch (e) {
      errorMessage.value = e.toString();
      CrmSnackBar.showAwesomeSnackbar(
        title: "Login Failed",
        message: e.toString(),
        contentType: ContentType.failure,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> register({
    required BuildContext context,
    required String username,
    required String password,
    required String email,
    required String firstName,
    required String lastName,
    required String phone,
    required String address,
    required String city,
    required String state,
    required String zipCode,
    required String userType,
  }) async {
    try {
      isLoading.value = true;
      final response = await authService.register(
        username: username,
        password: password,
        email: email,
        userType: userType,
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        address: address,
        city: city,
        state: state,
        zipCode: zipCode,
      );

      if (response['success'] == true && response['data']['token'] != null) {
        final token = response['data']['token'];
        await SecureStorage.saveToken(token);

        // Get.offAll(() => DashboardScreen());

        Get.to(
          () => OtpVerificationScreen(
            phone: phone,
            token: token, // Pass the token to OTP screen
          ),
        );

        return true;
      } else {
        throw Exception(
          response['message'] ?? 'Registration failed - no token received',
        );
      }
    } catch (e) {
      errorMessage.value = e.toString();
      CrmSnackBar.showAwesomeSnackbar(
        title: "Registration Failed",
        message: e.toString(),
        contentType: ContentType.failure,
      );
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> verifyOtp(String otp, String token) async {
    try {
      isLoading.value = true;
      final user = await authService.verifyOtp(otp, token);

      await SecureStorage.saveToken(user.token!);
      await SecureStorage.saveUserData(user);
      await SecureStorage.saveRememberMe(true);
      await SecureStorage.saveLoggedIn(true);
      currentUser.value = user;
      authState.value = AuthState.authenticated;
    } catch (e) {
      errorMessage.value = e.toString();
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> resendOtp(String token) async {
    try {
      isLoading.value = true;
      await authService.resendOtp(token);
    } catch (e) {
      errorMessage.value = e.toString();
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> forgotPassword({required String email}) async {
    try {
      isLoading.value = true;

      final token = await authService.forgotPassword(email);
      print("Forgot Password Token: $token");
      isLoading.value = false;
      Get.to(
        () => OtpVerificationScreen(phone: email, token: token),
      ); // example

      CrmSnackBar.showAwesomeSnackbar(
        title: 'Success',
        message: 'OTP sent to your email.',
        contentType: ContentType.success,
      );
    } catch (e) {
      CrmSnackBar.showAwesomeSnackbar(
        title: 'Error',
        message: e.toString().replaceAll('Exception:', '').trim(),
        contentType: ContentType.failure,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> checkAuthStatus() async {
    try {
      final token = await SecureStorage.getToken();
      if (token != null) {
        final user = await SecureStorage.getUserData();
        currentUser.value = user;
        authState.value = AuthState.authenticated;
      } else {
        authState.value = AuthState.unauthenticated;
      }
    } catch (e) {
      authState.value = AuthState.unauthenticated;
    }
  }

  Future<void> logout() async {
    await SecureStorage.clearAll();
    currentUser.value = null;
    authState.value = AuthState.unauthenticated;
    Get.offAll(() => LoginScreen());
  }
}
