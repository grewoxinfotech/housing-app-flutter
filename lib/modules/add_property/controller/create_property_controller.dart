import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housing_flutter_app/app/constants/color_res.dart';

class CreatePropertyController extends GetxController {
  // Reactive states
  var isOwner = true.obs;
  var propertyType = "Residential".obs;
  var lookingTo = "Rent".obs;
  var countryCode = '+91'.obs;

  // Text Controllers
  final phoneController = TextEditingController();
  final nameController = TextEditingController();
  final cityController = TextEditingController();
  RxString selectedIndex = "Area".obs;

  void select(String index) {
    selectedIndex.value = index;
    print("$selectedIndex     =   === == = = == = = = $index");
  }

  void toggleOwner(bool ownerSelected) {
    isOwner.value = ownerSelected;
  }

  void setCountryCode(String code) {
    countryCode.value = code;
  }

  void setPropertyType(String type) {
    propertyType.value = type;
  }

  void setLookingTo(String type) {
    lookingTo.value = type;
  }

  void submitForm() {
    Get.snackbar(
      "Form Submitted",
      "Owner: ${isOwner.value ? "Owner" : "Broker/Builder"}\n"
          "Property: ${propertyType.value}\n"
          "Looking to: ${lookingTo.value}\n"
          "Phone:$countryCode ${phoneController.text}\n"
          "Name: ${nameController.text}\n"
          "City: ${cityController.text}",
      snackPosition: SnackPosition.TOP,
      colorText: ColorRes.white,
      backgroundColor: ColorRes.primary.withOpacity(0.2),
    );
  }
}
