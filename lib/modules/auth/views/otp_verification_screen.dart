import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housing_flutter_app/modules/auth/controllers/auth_controller.dart';
import '../../../data/database/secure_storage_service.dart';
import '../../../widgets/New folder/inputs/crm_text_field.dart';
import '../../../widgets/button/crm_button.dart';
import '../../home/views/dashboard_screen.dart';
import 'package:housing_flutter_app/widgets/messages/crm_snack_bar.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String phone;
  final String? token;
  final bool isPasswordReset;
  final bool isLoading;


  const OtpVerificationScreen({
    Key? key,
    required this.phone,
    this.token,
    this.isPasswordReset = false,
    this.isLoading = false, // <-- default value
  }) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final _otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _isResending = false;
  int _resendTimeout = 60;
  Timer? _resendTimer;
  String? _token;

  @override
  void initState() {
    super.initState();
    _startResendTimer();
    _loadStoredToken();
  }

  Future<void> _loadStoredToken() async {
    // If token wasn't passed, try to get it from storage
    _token = widget.token ?? await SecureStorage.getToken();
  }

  void _startResendTimer() {
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_resendTimeout > 0) {
        setState(() => _resendTimeout--);
      } else {
        _resendTimer?.cancel();
      }
    });
  }

  Future<void> _verifyOtp() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);


    try {
      final authController = Get.find<AuthController>();

      print("fnjdfnjfgnjdfn$widget.token");

      if (widget.isPasswordReset) {
        // Handle password reset flow
        await authController.verifyPasswordResetOtp(
          _otpController.text,
          _token ?? widget.token ?? '',
        );

        CrmSnackBar.showAwesomeSnackbar(
          title: "Success",
          message: "OTP verified. Please set your new password.",
          contentType: ContentType.success,
        );
      } else {
        // Handle regular verification flow
        await authController.verifyOtp(
          _otpController.text,
          _token ?? widget.token ?? '',
        );

        CrmSnackBar.showAwesomeSnackbar(
          title: "Success",
          message: "Account verified",
          contentType: ContentType.success,
        );
        Get.offAll(() => DashboardScreen());
      }
    } catch (e) {
      CrmSnackBar.showAwesomeSnackbar(
        title: "Error",
        message: e.toString().replaceAll('Exception: ', ''),
        contentType: ContentType.failure,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _resendOtp() async {
    if (_token == null && widget.token == null) {
      CrmSnackBar.showAwesomeSnackbar(
        title: "Error",
        message: "Unable to resend OTP - missing token",
        contentType: ContentType.failure,
      );
      return;
    }

    setState(() => _isResending = true);

    try {
      final authController = Get.find<AuthController>();

      if (widget.isPasswordReset) {
        // For password reset flow, we need to call forgotPassword again
        await authController.forgotPassword(id: widget.phone);
      } else {
        // For regular verification flow
        await authController.resendOtp(_token ?? widget.token!);
      }

      setState(() => _resendTimeout = 60);
      _startResendTimer();

      CrmSnackBar.showAwesomeSnackbar(
        title: "OTP Resent",
        message: "New OTP sent to ${widget.phone}",
        contentType: ContentType.success,
      );
    } catch (e) {
      CrmSnackBar.showAwesomeSnackbar(
        title: "Resend Failed",
        message: e.toString(),
        contentType: ContentType.failure,
      );
    } finally {
      setState(() => _isResending = false);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isPasswordReset ? 'Reset Password' : 'Verify OTP'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Icon(Icons.verified_user, size: 80, color: Colors.blue),
              const SizedBox(height: 20),
              Text(
                'Enter OTP',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'Sent to ${widget.phone}',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              // CrmTextField(
              //   hintText: '••••••',
              //   title: "OTP",
              //   controller: _otpController,
              //   keyboardType: TextInputType.number,
              //   prefixIcon: Icons.numbers_outlined,
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter OTP';
              //     }
              //     if (value.length != 6) {
              //       return 'OTP must be 6 digits';
              //     }
              //     return null;
              //   },
              // ),
              TextFormField(
                controller: _otpController,
                keyboardType: TextInputType.number,
                maxLength: 6,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24),
                decoration: InputDecoration(
                  counterText: '',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: '••••••',
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 12,
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter OTP';
                  }
                  if (value.length != 6) {
                    return 'OTP must be 6 digits';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),

              CrmButton(
                title: widget.isPasswordReset
                    ? 'Enter OTP'
                    : 'Enter OTP',
                // isLoading: _isLoading,
                onTap: _verifyOtp,
              ),


              const SizedBox(height: 20),
              TextButton(
                onPressed:
                    (_resendTimeout > 0 || _isResending) ? null : _resendOtp,
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child:
                    _isResending
                        ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                        : Text(
                          _resendTimeout > 0
                              ? 'Resend OTP in $_resendTimeout seconds'
                              : 'Resend OTP',
                          style: TextStyle(
                            color:
                                (_resendTimeout > 0 || _isResending)
                                    ? Colors.grey
                                    : Theme.of(context).primaryColor,
                          ),
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _otpController.dispose();
    _resendTimer?.cancel();
    super.dispose();
  }
}
