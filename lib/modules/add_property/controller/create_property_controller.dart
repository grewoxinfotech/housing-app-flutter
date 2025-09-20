import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housing_flutter_app/app/constants/color_res.dart';
import 'package:housing_flutter_app/modules/auth/controllers/auth_controller.dart';

enum SellerType { owner, builder }

class CreatePropertyController extends GetxController {
  // Reactive states
  var selectedSellerType = SellerType.owner.obs; // New: selected user type
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

  // Toggle user type
  void toggleUserType(SellerType type) {
    selectedSellerType.value = type;
    // Update isOwner reactive accordingly
    isOwner.value = (type == SellerType.owner);
    print("Selected User Type: $type"); // Debug log

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

  // void submitForm() {
  //   Get.snackbar(
  //     "Form Submitted",
  //     "Owner: ${isOwner.value ? "Owner" : "Broker/Builder"}\n"
  //         "Property: ${propertyType.value}\n"
  //         "Looking to: ${lookingTo.value}\n"
  //         "Phone:$countryCode ${phoneController.text}\n"
  //         "Name: ${nameController.text}\n"
  //         "City: ${cityController.text}",
  //     snackPosition: SnackPosition.TOP,
  //     colorText: ColorRes.white,
  //     backgroundColor: ColorRes.primary.withOpacity(0.2),
  //   );
  // }
  void submitForm() async {
    if (phoneController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Please fill all required fields",
        snackPosition: SnackPosition.TOP,
        colorText: ColorRes.white,
        backgroundColor: ColorRes.error.withOpacity(0.8),
      );
      return;
    }

    try {
      //Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);

      final sellerController = Get.put(AuthController());

      await sellerController.sellerRegister(
        phone: phoneController.text.trim(),
        userType: "seller",
        sellerType: selectedSellerType.value.name, // "owner" or "builder"
      );

      //if (Get.isDialogOpen ?? false) Get.back();
    } catch (e) {
      if (Get.isDialogOpen ?? false) Get.back();
      Get.snackbar(
        "Error",
        "Registration failed: ${e.toString()}",
        snackPosition: SnackPosition.TOP,
        colorText: ColorRes.white,
        backgroundColor: ColorRes.error.withOpacity(0.8),
      );
    }
  }


}
