import 'package:flutter/material.dart';
import 'package:housing_flutter_app/modules/auth/controllers/auth_controller.dart';
import 'package:housing_flutter_app/modules/auth/views/forgot_password_screen.dart';
import 'package:housing_flutter_app/modules/auth/views/select_account_type_screen.dart';
import 'package:housing_flutter_app/widgets/input/custom_text_field.dart';
import 'package:housing_flutter_app/modules/auth/views/register_screen.dart';
import 'package:housing_flutter_app/modules/auth/views/otp_login_screen.dart';
import 'package:get/get.dart';

import '../../../app/constants/font_res.dart';
import '../../../app/constants/ic_res.dart';
import '../../../app/utils/validation.dart';
import '../../../widgets/New folder/inputs/text_field.dart';
import '../../../widgets/button/button.dart';
import '../../../widgets/display/ic.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _navigateToOtpLogin() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => OtpLoginScreen()));
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
        title: const Text('Login Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Logo and App Name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.home_work,
                          size: 24,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'NesticoPe',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: FontRes.nuNunitoSans,
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),

                  // Login Title
                  Text(
                    'Login',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontFamily: FontRes.nuNunitoSans,
                      fontWeight: FontWeight.w800,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Email Field
                  NesticoPeTextField(
                    title: "Email / phone",
                    controller: authController.emailController,
                    validator: (value) => emailValidation(value ?? ''),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    prefixIcon: Icons.person_outline,
                    hintText: "Enter Email",
                  ),

                  const SizedBox(height: 16),

                  NesticoPeTextField(
                    title: "Password",
                    controller: authController.passwordController,
                    validator: (value) => passwordValidation(value ?? ''),
                    obscureText: _isPasswordVisible,
                    prefixIcon: Icons.lock_outline,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    hintText: "Enter Password",
                    suffixIcon: Container(
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      child: NesticoPeIc(
                        iconPath: ICRes.viewPassword,
                        onTap: _togglePasswordVisibility,
                        height: 24,
                        width: 24,
                        color:
                        _isPasswordVisible
                            ? Get.theme.colorScheme.outline
                            : Get.theme.colorScheme.primary,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Forgot Password aligned to right
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(() => ForgetPasswordScreen());
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                            fontFamily: FontRes.nuNunitoSans,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Login Button
                  NesticoPeButton(
                    title: "Login",
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        authController.login(
                          authController.emailController.text.trim(),
                          authController.passwordController.text.trim(),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 16),

                  // OTP Login Button (optional)
                  // CustomButton(
                  //   text: 'Login with OTP',
                  //   onPressed: _navigateToOtpLogin,
                  //   isOutlined: true,
                  //   backgroundColor: theme.colorScheme.primary,
                  // ),
                  const SizedBox(height: 24),

                  // Register Link
                  Center(
                    child: Container(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontFamily: FontRes.nuNunitoSans,
                            ),
                          ),
                          TextButton(
                            onPressed: () => Get.to(() => SelectAccountTypeScreen()),
                            child: Text(
                              'Sign Up here',
                              style: TextStyle(
                                color: Get.theme.colorScheme.primary,
                                fontWeight: FontWeight.bold,
                                fontFamily: FontRes.nuNunitoSans,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
