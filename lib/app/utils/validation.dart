import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

final formKey = GlobalKey<FormState>();

String? emailValidation(String value) {
  if (value.isEmpty) return 'Email is required';
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$');
  if (!emailRegex.hasMatch(value)) return 'Enter a valid email';
  return null;
}


String? passwordValidation(String value) {
  if (value.isEmpty) return 'Password is required';
  if (value.length < 6) return 'Password must be at least 6 characters';
  return null;
}


String? nameValidation(String? name) {
  if (name == null || name.trim().isEmpty) {
    return "Please enter your name!";
  } else if (name.trim().length < 3) {
    return "Name must be at least 3 characters long!";
  }
  return null;
}

String? phoneValidation(String? phone) {
  if (phone == null || phone.trim().isEmpty) {
    return "Please enter your phone number!";
  } else if (!GetUtils.isPhoneNumber(phone.trim()) || phone.length != 10) {
    return "Enter a valid 10-digit phone number!";
  }
  return null;
}

/// Validates Generic Required Field
String? requiredField(String? value, String fieldName) {
  if (value == null || value.trim().isEmpty) {
    return "Please enter $fieldName!";
  }
  return null;
}
