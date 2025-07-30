// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:housing_flutter_app/widgets/button/crm_button.dart';
// import 'package:provider/provider.dart';
// import 'package:housing_flutter_app/modules/auth/controllers/auth_controller.dart';
// import 'package:housing_flutter_app/widgets/input/custom_text_field.dart';
// import 'package:housing_flutter_app/widgets/button/custom_button.dart';
// import 'package:housing_flutter_app/modules/auth/views/login_screen.dart';
//
// enum UserRole { buyer, seller, reseller }
//
// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({Key? key}) : super(key: key);
//
//   @override
//   _RegisterScreenState createState() => _RegisterScreenState();
// }
//
// class _RegisterScreenState extends State<RegisterScreen> {
//   // final _formKey = GlobalKey<FormState>();
//   // final _nameController = TextEditingController();
//   // final _emailController = TextEditingController();
//   // final _phoneController = TextEditingController();
//   // final _passwordController = TextEditingController();
//   // final _confirmPasswordController = TextEditingController();
//   // bool _isPasswordVisible = false;
//   // bool _isConfirmPasswordVisible = false;
//   // bool _isLoading = false;
//   // bool _acceptTerms = false;
//   // UserRole _selectedRole = UserRole.buyer;
//   final _formKey = GlobalKey<FormState>();
//   final _usernameController = TextEditingController();
//   final _firstNameController = TextEditingController();
//   final _lastNameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _phoneController = TextEditingController();
//   final _addressController = TextEditingController();
//   final _cityController = TextEditingController();
//   final _stateController = TextEditingController();
//   final _zipCodeController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();
//   bool _isPasswordVisible = false;
//   bool _isConfirmPasswordVisible = false;
//   bool _isLoading = false;
//   bool _acceptTerms = false;
//   UserRole _selectedRole = UserRole.buyer;
//
//   @override
//   void dispose() {
//     _usernameController.dispose();
//     _firstNameController.dispose();
//     _lastNameController.dispose();
//     _emailController.dispose();
//     _phoneController.dispose();
//     _addressController.dispose();
//     _cityController.dispose();
//     _stateController.dispose();
//     _zipCodeController.dispose();
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     super.dispose();
//   }
//
//   void _togglePasswordVisibility() {
//     setState(() {
//       _isPasswordVisible = !_isPasswordVisible;
//     });
//   }
//
//   void _toggleConfirmPasswordVisibility() {
//     setState(() {
//       _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
//     });
//   }
//
//   // Future<void> _register() async {
//   //   if (_formKey.currentState!.validate()) {
//   //     if (!_acceptTerms) {
//   //       _showErrorDialog('Please accept the terms and conditions to continue');
//   //       return;
//   //     }
//   //
//   //     setState(() {
//   //       _isLoading = true;
//   //     });
//   //
//   //     try {
//   //       final authController = Provider.of<AuthController>(
//   //           context, listen: false);
//   //       final success = await authController.register(
//   //         context,
//   //         _nameController.text.trim(),
//   //         _emailController.text.trim(),
//   //         _phoneController.text.trim(),
//   //         _passwordController.text.trim(),
//   //
//   //       );
//   //
//   //       if (success) {
//   //         _showSuccessDialog();
//   //       } else {
//   //         _showErrorDialog(
//   //             authController.errorMessage ?? 'Registration failed');
//   //       }
//   //     } catch (e) {
//   //       _showErrorDialog('An unexpected error occurred: ${e.toString()}');
//   //     } finally {
//   //       if (mounted) {
//   //         setState(() {
//   //           _isLoading = false;
//   //         });
//   //       }
//   //     }
//   //   }
//   // }
//
//   Future<void> _register() async {
//     if (_formKey.currentState!.validate()) {
//       if (!_acceptTerms) {
//         _showErrorDialog('Please accept the terms and conditions to continue');
//         return;
//       }
//
//       setState(() {
//         _isLoading = true;
//       });
//
//       try {
//         final authController = Provider.of<AuthController>(context, listen: false);
//         final success = await authController.register(
//           context,
//           _usernameController.text.trim(),
//           _passwordController.text.trim(),
//           _emailController.text.trim(),
//           _firstNameController.text.trim(),
//           _lastNameController.text.trim(),
//           _phoneController.text.trim(),
//           _addressController.text.trim(),
//           _cityController.text.trim(),
//           _stateController.text.trim(),
//           _zipCodeController.text.trim(),
//         );
//
//         if (success) {
//           _showSuccessDialog();
//         } else {
//           _showErrorDialog(authController.errorMessage ?? 'Registration failed');
//         }
//       } catch (e) {
//         _showErrorDialog('An unexpected error occurred: ${e.toString()}');
//       } finally {
//         if (mounted) {
//           setState(() {
//             _isLoading = false;
//           });
//         }
//       }
//     }
//   }
//
//   void _showSuccessDialog() {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) =>
//           AlertDialog(
//             title: const Text('Registration Successful'),
//             content: const Text(
//                 'Your account has been created successfully. Please login to continue.'),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop(); // Close dialog
//                   Navigator.of(context).pushReplacement(
//                       MaterialPageRoute(builder: (context) => LoginScreen())
//                   );
//                 },
//                 child: const Text('Login'),
//               ),
//             ],
//           ),
//     );
//   }
//
//   void _showErrorDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (context) =>
//           AlertDialog(
//             title: const Text('Registration Error'),
//             content: Text(message),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.of(context).pop(),
//                 child: const Text('OK'),
//               ),
//             ],
//           ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     Get.lazyPut(() => AuthController());
//
//
//     @override
//     Widget build(BuildContext context) {
//       final theme = Theme.of(context);
//       Get.lazyPut(() => AuthController());
//
//       return Scaffold(
//           appBar: AppBar(
//             title: Text('Create Account'),
//             centerTitle: true,
//             elevation: 0,
//           ),
//           body: SafeArea(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.all(24.0),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                   Text(
//                   'Select Account Type',
//                   style: theme.textTheme.titleLarge?.copyWith(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Colors.grey[100],
//                     borderRadius: BorderRadius.circular(30),
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 _selectedRole = UserRole.buyer;
//                               });
//                             },
//                             child: Container(
//                               padding: EdgeInsets.symmetric(vertical: 12),
//                               decoration: BoxDecoration(
//                                 color: _selectedRole == UserRole.buyer
//                                     ? theme.colorScheme.primary
//                                     : Colors.transparent,
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                               child: Center(
//                                 child: Text(
//                                   'Buyer',
//                                   style: TextStyle(
//                                     color: _selectedRole == UserRole.buyer
//                                         ? Colors.white
//                                         : Colors.black87,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           child: GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 _selectedRole = UserRole.seller;
//                               });
//                             },
//                             child: Container(
//                               padding: EdgeInsets.symmetric(vertical: 12),
//                               decoration: BoxDecoration(
//                                 color: _selectedRole == UserRole.seller
//                                     ? theme.colorScheme.primary
//                                     : Colors.transparent,
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                               child: Center(
//                                 child: Text(
//                                   'Seller',
//                                   style: TextStyle(
//                                     color: _selectedRole == UserRole.seller
//                                         ? Colors.white
//                                         : Colors.black87,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           child: GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 _selectedRole = UserRole.reseller;
//                               });
//                             },
//                             child: Container(
//                               padding: EdgeInsets.symmetric(vertical: 12),
//                               decoration: BoxDecoration(
//                                 color: _selectedRole == UserRole.reseller
//                                     ? theme.colorScheme.primary
//                                     : Colors.transparent,
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                               child: Center(
//                                 child: Text(
//                                   'Reseller',
//                                   style: TextStyle(
//                                     color: _selectedRole == UserRole.reseller
//                                         ? Colors.white
//                                         : Colors.black87,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 24),
//                   CustomTextField(
//                     controller: _usernameController,
//                     hintText: 'Username',
//                     prefixIcon: Icons.person_outline,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter a username';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 16),
//                   CustomTextField(
//                     controller: _firstNameController,
//                     hintText: 'First Name',
//                     prefixIcon: Icons.person_outline,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your first name';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 16),
//                   CustomTextField(
//                     controller: _lastNameController,
//                     hintText: 'Last Name',
//                     prefixIcon: Icons.person_outline,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your last name';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 16),
//                   CustomTextField(
//                     controller: _emailController,
//                     hintText: 'Email Address',
//                     keyboardType: TextInputType.emailAddress,
//                     prefixIcon: Icons.email_outlined,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your email';
//                       }
//                       if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
//                         return 'Please enter a valid email';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 16),
//                   CustomTextField(
//                     controller: _phoneController,
//                     hintText: 'Phone Number',
//                     keyboardType: TextInputType.phone,
//                     prefixIcon: Icons.phone_outlined,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your phone number';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 16),
//                   CustomTextField(
//                     controller: _addressController,
//                     hintText: 'Address',
//                     prefixIcon: Icons.home_outlined,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your address';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 16),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: CustomTextField(
//                           controller: _cityController,
//                           hintText: 'City',
//                           prefixIcon: Icons.location_city_outlined,
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter your city';
//                             }
//                             return null;
//                           },
//                         ),
//                       ),
//                       const SizedBox(width: 16),
//                       Expanded(
//                         child: CustomTextField(
//                           controller: _stateController,
//                           hintText: 'State',
//                           prefixIcon: Icons.map_outlined,
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter your state';
//                             }
//                             return null;
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 16),
//                   CustomTextField(
//                     controller: _zipCodeController,
//                     hintText: 'Zip Code',
//                     keyboardType: TextInputType.number,
//                     prefixIcon: Icons.numbers_outlined,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your zip code';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 16),
//                   CustomTextField(
//                     controller: _passwordController,
//                     hintText: 'Password',
//                     obscureText: !_isPasswordVisible,
//                     prefixIcon: Icons.lock_outline,
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                         _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
//                         color: Colors.grey,
//                         size: 20,
//                       ),
//                       onPressed: _togglePasswordVisibility,
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter a password';
//                       }
//                       if (value.length < 6) {
//                         return 'Password must be at least 6 characters';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 16),
//                   CustomTextField(
//                     controller: _confirmPasswordController,
//                     hintText: 'Confirm Password',
//                     obscureText: !_isConfirmPasswordVisible,
//                     prefixIcon: Icons.lock_outline,
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                         _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
//                         color: Colors.grey,
//                         size: 20,
//                       ),
//                       onPressed: _toggleConfirmPasswordVisibility,
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please confirm your password';
//                       }
//                       if (value != _passwordController.text) {
//                         return 'Passwords do not match';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 16),
//                   Row(
//                     children: [
//                       SizedBox(
//                         height: 24,
//                         width: 24,
//                         child: Checkbox(
//                           value: _acceptTerms,
//                           onChanged: (value) {
//                             setState(() {
//                               _acceptTerms = value ?? false;
//                             });
//                           },
//                           activeColor: theme.colorScheme.primary,
//                         ),
//                       ),
//                       SizedBox(width: 8),
//                       Expanded(
//                         child: Text(
//                           'I agree to the Terms and Conditions and Privacy Policy',
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.grey[700],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 24),
//                   CrmButton(
//                     title: 'Create Account',
//                     onTap: _isLoading ? null : _register,
//                   ),
//                   const SizedBox(height: 24),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Already have an account?',
//                         style: TextStyle(color: Colors.grey[700]),
//                         TextButton(
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                           child: Text(
//                             'Login here',
//                             style: TextStyle(
//                               color: theme.colorScheme.primary,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//       }
//   }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housing_flutter_app/widgets/button/crm_button.dart';
import 'package:housing_flutter_app/modules/auth/controllers/auth_controller.dart';
import 'package:housing_flutter_app/widgets/input/custom_text_field.dart';
import 'package:housing_flutter_app/modules/auth/views/login_screen.dart';

enum UserRole { buyer, seller, reseller }

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);



  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _zipCodeController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isLoading = false;
  bool _acceptTerms = false;
  UserRole _selectedRole = UserRole.buyer;

  @override
  void dispose() {
    _usernameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _zipCodeController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    });
  }

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      if (!_acceptTerms) {
        _showErrorDialog('Please accept the terms and conditions');
        return;
      }

      setState(() => _isLoading = true);

      try {
        final authController = Get.find<AuthController>();
        final success = await authController.register(
          context: context,
          username: _usernameController.text.trim(),
          password: _passwordController.text.trim(),
          email: _emailController.text.trim(),
          firstName: _firstNameController.text.trim(),
          lastName: _lastNameController.text.trim(),
          phone: _phoneController.text.trim(),
          address: _addressController.text.trim(),
          city: _cityController.text.trim(),
          state: _stateController.text.trim(),
          zipCode: _zipCodeController.text.trim(),
          userType: _roleToString(_selectedRole),
        );

        if (!success) {
          _showErrorDialog(authController.errorMessage.value);
        }
      } catch (e) {
        _showErrorDialog('Registration failed: ${e.toString()}');
      } finally {
        if (mounted) setState(() => _isLoading = false);
      }
    }
  }

  String _roleToString(UserRole role) {
    switch (role) {
      case UserRole.buyer: return 'buyer';
      case UserRole.seller: return 'seller';
      case UserRole.reseller: return 'reseller';
    }
  }




  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Registration Successful'),
        content: const Text('Your account has been created successfully. Please login to continue.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginScreen())
              );
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Registration Error'),
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

  String _roleToDisplayText(UserRole role) {
    switch (role) {
      case UserRole.buyer: return 'Buyer';
      case UserRole.seller: return 'Seller';
      case UserRole.reseller: return 'Reseller';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Get.lazyPut(() => AuthController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Select Account Type',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),



                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: UserRole.values.map((role) {
                      return Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => _selectedRole = role),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: _selectedRole == role
                                  ? theme.colorScheme.primary
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Text(
                                _roleToDisplayText(role),
                                style: TextStyle(
                                  color: _selectedRole == role
                                      ? Colors.white
                                      : Colors.black87,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),

                const SizedBox(height: 24),
                CustomTextField(
                  controller: _usernameController,
                  hintText: 'Username',
                  prefixIcon: Icons.person_outline,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a username';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _firstNameController,
                  hintText: 'First Name',
                  prefixIcon: Icons.person_outline,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _lastNameController,
                  hintText: 'Last Name',
                  prefixIcon: Icons.person_outline,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _emailController,
                  hintText: 'Email Address',
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icons.email_outlined,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _phoneController,
                  hintText: 'Phone Number',
                  keyboardType: TextInputType.phone,
                  prefixIcon: Icons.phone_outlined,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _addressController,
                  hintText: 'Address',
                  prefixIcon: Icons.home_outlined,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: _cityController,
                        hintText: 'City',
                        prefixIcon: Icons.location_city_outlined,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your city';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: CustomTextField(
                        controller: _stateController,
                        hintText: 'State',
                        prefixIcon: Icons.map_outlined,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your state';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _zipCodeController,
                  hintText: 'Zip Code',
                  keyboardType: TextInputType.number,
                  prefixIcon: Icons.numbers_outlined,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your zip code';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _passwordController,
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
                      return 'Please enter a password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _confirmPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: !_isConfirmPasswordVisible,
                  prefixIcon: Icons.lock_outline,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                      size: 20,
                    ),
                    onPressed: _toggleConfirmPasswordVisibility,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: Checkbox(
                        value: _acceptTerms,
                        onChanged: (value) {
                          setState(() {
                            _acceptTerms = value ?? false;
                          });
                        },
                        activeColor: theme.colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'I agree to the Terms and Conditions and Privacy Policy',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                CrmButton(
                  title: 'Create Account',
                  onTap: _isLoading ? null : _register,
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Login here',
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
    );
  }
}
