import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housing_flutter_app/widgets/bar/app_bar/common_crm_bar.dart';

import '../../../app/constants/font_res.dart';
import '../../../widgets/New folder/inputs/crm_text_field.dart';
import '../../../widgets/button/crm_button.dart';
import '../controllers/auth_controller.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonCrmAppBar(
        title: 'Reset Password',
        showBackArrow: true,
        leadingIcon: Icons.arrow_back,
      ),
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
                  CrmTextField(
                    title: "New Password",
                    controller: authController.newPasswordController,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter new password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    prefixIcon: Icons.lock_outline,
                    hintText: "Enter new password",
                  ),
                  const SizedBox(height: 16),
                  CrmTextField(
                    title: "Confirm Password",
                    controller: authController.confirmPasswordController,
                    obscureText: true,
                    validator: (value) {
                      if (value != authController.newPasswordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    prefixIcon: Icons.lock_outline,
                    hintText: "Confirm new password",
                  ),
                  const SizedBox(height: 24),
                  CrmButton(
                    title: "Reset Password",
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        authController.resetPassword();
                      }
                    },
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