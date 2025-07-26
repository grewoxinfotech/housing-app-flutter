import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:housing_flutter_app/modules/auth/controllers/auth_controller.dart';
import 'package:housing_flutter_app/widgets/input/custom_text_field.dart';
import 'package:housing_flutter_app/widgets/button//custom_button.dart';
import 'package:housing_flutter_app/modules/home/views/home_screen.dart';
import 'package:housing_flutter_app/modules/auth/views/register_screen.dart';
import 'package:housing_flutter_app/modules/auth/views/otp_login_screen.dart';
import 'package:housing_flutter_app/app/constants/size_manager.dart';
import 'package:housing_flutter_app/widgets/button/custom_button.dart';
import 'package:housing_flutter_app/widgets/display/crm_card.dart';
import 'package:get/get.dart';

import '../../../widgets/button/crm_button.dart';

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
  bool _isLoading = false;
  bool _rememberMe = false;

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

  // Future<void> _login() async {
  //   if (_formKey.currentState!.validate()) {
  //     setState(() {
  //       _isLoading = true;
  //     });
  //
  //     try {
  //       final authController = Provider.of<AuthController>(context, listen: false);
  //       final success = await authController.login(
  //         context,
  //         _emailController.text.trim(),
  //         _passwordController.text.trim(),
  //       );
  //
  //       if (success) {
  //         Navigator.of(context).pushReplacement(
  //           MaterialPageRoute(builder: (context) => HomeScreen())
  //         );
  //       } else {
  //         print('Login failed with message: ${authController.errorMessage}');
  //         _showErrorDialog(authController.errorMessage ?? 'Login failed');
  //       }
  //     } catch (e) {
  //       print('error$e');
  //       _showErrorDialog('An unexpected error occurred: ${e.toString()}');
  //     } finally {
  //       if (mounted) {
  //         setState(() {
  //           _isLoading = false;
  //         });
  //       }
  //     }
  //   }
  // }

  void _navigateToOtpLogin() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => OtpLoginScreen())
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
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
                        'BookHome',
                        style: TextStyle(
                          fontSize: 20,
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
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Email Field
                  CustomTextField(
                    controller: authController.emailController,
                    hintText: 'Email or User Name',
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icons.person_outline,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email or username';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Password Field
                  CustomTextField(
                    controller: authController.passwordController,
                    hintText: 'Password',
                    obscureText: !_isPasswordVisible,
                    prefixIcon: Icons.lock_outline,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey,
                        size: 20,
                      ),
                      onPressed: _togglePasswordVisibility,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),

                  // Remember Me and Forgot Password
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Row(
                  //       children: [
                  //         SizedBox(
                  //           height: 24,
                  //           width: 24,
                  //           child: Checkbox(
                  //             value: authController.rememberMe.value,
                  //             onChanged:
                  //                 (value) =>
                  //             authController.rememberMe.value =
                  //                 value ?? false,
                  //             activeColor: theme.colorScheme.primary,
                  //           ),
                  //         ),
                  //         SizedBox(width: 8),
                  //         Text(
                  //           'Remember me',
                  //           style: TextStyle(
                  //             fontSize: 14,
                  //             color: Colors.grey[700],
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //     TextButton(
                  //       onPressed: () {
                  //         // Navigate to forgot password screen
                  //       },
                  //       child: Text(
                  //         'Forgot Password?',
                  //         style: TextStyle(
                  //           fontSize: 14,
                  //           color: theme.colorScheme.primary,
                  //           fontWeight: FontWeight.w500,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                            () => Row(
                          children: [
                            Checkbox(
                              value: authController.rememberMe.value,
                              onChanged:
                                  (value) =>
                              authController.rememberMe.value =
                                  value ?? false,
                              side: const BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                              checkColor: Get.theme.colorScheme.primary,
                              activeColor: Colors.transparent,
                            ),
                            Text(
                              'Remember me',
                              style: TextStyle(
                                fontSize: 14,
                                color: Get.theme.colorScheme.onPrimary,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: authController.fillTestCredentials,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Get.theme.colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Login Button
                  CrmButton(
                    title: "Login",
                    onTap:
                        () => authController.login(
                      authController.emailController.text.trim(),
                      authController.passwordController.text.trim(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // OTP Login Button
                  // CustomButton(
                  //   text: 'Login with OTP',
                  //   onPressed: _navigateToOtpLogin,
                  //   isOutlined: true,
                  //   backgroundColor: theme.colorScheme.primary,
                  // ),
                  const SizedBox(height: 24),

                  // Register Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => RegisterScreen())
                          );
                        },
                        child: Text(
                          'Signup here',
                          style: TextStyle(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
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