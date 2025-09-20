  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import 'package:housing_flutter_app/app/constants/app_font_sizes.dart';
  import 'package:housing_flutter_app/app/constants/color_res.dart';
  import 'package:housing_flutter_app/app/manager/icon_manager.dart';
  import 'package:housing_flutter_app/app/utils/svg_widget.dart';
  import 'package:housing_flutter_app/modules/add_property/controller/create_property_controller.dart';
import 'package:housing_flutter_app/modules/auth/controllers/auth_controller.dart';

  import '../../../data/network/auth/model/user_model.dart';


  class CreatePropertyScreen extends StatefulWidget {
    final SellerType sellerType;


    const CreatePropertyScreen({super.key, required this.sellerType});


    @override
    _CreatePropertyState createState() => _CreatePropertyState();

  }

  class _CreatePropertyState extends State<CreatePropertyScreen> {

    late final CreatePropertyController controller;

    @override
    void initState() {
      super.initState();
      controller = Get.put(CreatePropertyController());
      controller.selectedSellerType.value = widget.sellerType;
      print("Role passed to CreateProperty: ${widget.sellerType}");
    }

    @override
    Widget build(BuildContext context) {

      final controller = Get.put(CreatePropertyController());
      Get.lazyPut(() => AuthController());

      // Observable for selected user type

      // Other existing controllers
      RxString propertyType = ''.obs;
      RxString lookingTo = ''.obs;
      RxString countryCode = '+91'.obs;
      final phoneController = TextEditingController();
      final nameController = TextEditingController();
      final cityController = TextEditingController();

      // -------------------------
      // New method to toggle user type
      //
      // void setPropertyType(String type) => propertyType.value = type;
      // void setLookingTo(String type) => lookingTo.value = type;
      // void setCountryCode(String code) => countryCode.value = code;
      // void select(String index) => selectedIndex.value = index;



      return Scaffold(
        backgroundColor: const Color(0xff091F48),
        body: SafeArea(
          child: LayoutBuilder(
            builder:
                (context, constraints) => SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                        alignment: Alignment.topLeft,
                        decoration: const BoxDecoration(
                          color: Color(0xff091F48),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade300,
                              ),
                              alignment: Alignment.center,
                              child: IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.black,
                                  size: 20,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "Housing.com",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: AppFontSizes.large,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          // vertical: 8,
                        ),
                        decoration: const BoxDecoration(
                          color: Color(0xff091F48),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 5),
                            Text(
                              "Sell or rent your property faster",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: AppFontSizes.body,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 15),
                            _buildInfoPoint("Post property for free"),
                            _buildInfoPoint("Get verified buyers"),
                            _buildInfoPoint(
                              "Personalised selling assistance",
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Form Card Section
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 16,
                          ),
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(28),
                              topRight: Radius.circular(28),
                            ),
                          ),
                          child: Obx(
                                () => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                // Tabs
                                Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () => controller.toggleUserType(SellerType.owner),
                                            child: _buildTab("Owner", controller.selectedSellerType.value == SellerType.owner),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () => controller.toggleUserType(SellerType.builder),
                                            child: _buildTab("Broker/Builder", controller.selectedSellerType.value == SellerType.builder),
                                          ),
                                        ),
                                      ],
                                    )
                                ),

                                const SizedBox(height: 24),
                                if (controller.isOwner.value) ...[
                                  _buildSectionTitle("Property Type"),
                                  const SizedBox(height: 12),

                                  Row(
                                    children: [
                                      _buildChoice(
                                        title: 'Residential',
                                        selected:
                                        controller.propertyType.value ==
                                            'Residential',
                                        onTap:
                                            () => controller.setPropertyType(
                                          'Residential',
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      _buildChoice(
                                        title: 'Commercial',
                                        selected:
                                        controller.propertyType.value ==
                                            'Commercial',
                                        onTap:
                                            () => controller.setPropertyType(
                                          'Commercial',
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 24),
                                  _buildSectionTitle("You're looking to..."),
                                  const SizedBox(height: 12),

                                  Wrap(
                                    spacing: 12,
                                    runSpacing: 12,
                                    children: [
                                      if (controller.propertyType.value ==
                                          'Residential') ...[
                                        _buildChoice(
                                          title: 'Rent',
                                          selected:
                                          controller.lookingTo.value ==
                                              'Rent',
                                          onTap:
                                              () => controller.setLookingTo(
                                            'Rent',
                                          ),
                                        ),
                                        _buildChoice(
                                          title: 'Sell',
                                          selected:
                                          controller.lookingTo.value ==
                                              'Sell',
                                          onTap:
                                              () => controller.setLookingTo(
                                            'Sell',
                                          ),
                                        ),
                                        _buildChoice(
                                          title: 'PG/Co-Living',
                                          selected:
                                          controller.lookingTo.value ==
                                              'PG/Co-Living',
                                          onTap:
                                              () => controller.setLookingTo(
                                            'PG/Co-Living',
                                          ),
                                        ),
                                      ] else ...[
                                        _buildChoice(
                                          title: 'Rent',
                                          selected:
                                          controller.lookingTo.value ==
                                              'Rent',
                                          onTap:
                                              () => controller.setLookingTo(
                                            'Rent',
                                          ),
                                        ),
                                        _buildChoice(
                                          title: 'Sell',
                                          selected:
                                          controller.lookingTo.value ==
                                              'Sell',
                                          onTap:
                                              () => controller.setLookingTo(
                                            'Sell',
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),

                                  if (controller.propertyType.value ==
                                      "Commercial") ...[
                                    const SizedBox(height: 24),
                                    subPropertyType(controller),
                                  ],

                                  const SizedBox(height: 24),

                                  _buildTextField(
                                    "Phone Number",
                                    Icons.phone,
                                    controller.phoneController,
                                    isPhone: true,
                                  ),
                                  const SizedBox(height: 16),
                                  _buildTextField(
                                    "Your Name",
                                    Icons.person,
                                    controller.nameController,
                                  ),
                                  const SizedBox(height: 16),
                                  _buildTextField(
                                    "Search City",
                                    Icons.location_on,
                                    controller.cityController,
                                  ),

                                  const SizedBox(height: 28),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 45,
                                    child: ElevatedButton(
                                      onPressed: controller.submitForm,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: ColorRes.primary,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            14,
                                          ),
                                        ),
                                        elevation: 2,
                                      ),
                                      child: const Text(
                                        "Next, add address & price",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ] else ...[
                                  const SizedBox(height: 20),

                                  _buildTextField(
                                    "Phone Number",
                                    Icons.phone,
                                    controller.phoneController,
                                    isPhone: true,
                                  ),

                                  const SizedBox(height: 40),

                                  // Con const SizedBox(height: 20),tinue button
                                  Container(
                                    width: double.infinity,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: ColorRes.grey.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      'Continue',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  const Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'By clicking above you agree to ',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        'Terms & Conditions',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: ColorRes.primary,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Divider(
                                          color: Colors.grey.withOpacity(
                                            0.5,
                                          ), // choose color
                                          thickness: 0.8, // optional
                                        ),
                                      ),
                                      SizedBox(width: 16),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                        ),
                                        child: Text(
                                          'OR',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ), // adjust color if needed
                                        ),
                                      ),
                                      SizedBox(width: 16),
                                      Expanded(
                                        child: Divider(
                                          color: Colors.grey.withOpacity(0.5),
                                          thickness: 0.8,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),

                                  // SizedBox(
                                  //   width: double.infinity,
                                  //   height: 45,
                                  //   child: ElevatedButton(
                                  //     onPressed: controller.submitForm,
                                  //     style: ElevatedButton.styleFrom(
                                  //       backgroundColor: ColorRes.primary,
                                  //       shape: RoundedRectangleBorder(
                                  //         borderRadius: BorderRadius.circular(
                                  //           14,
                                  //         ),
                                  //       ),
                                  //       elevation: 2,
                                  //     ),
                                  //     child: const Text(
                                  //       "On Tap Login with Truecaller",
                                  //       style: TextStyle(
                                  //         fontSize: 14,
                                  //         color: Colors.white,
                                  //         fontWeight: FontWeight.w500,
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  const SizedBox(height: 40),

                                  Center(
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(8),
                                      onTap: controller.submitForm,
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 6,
                                          horizontal: 12,
                                        ),
                                        child: Row(
                                          mainAxisSize:
                                          MainAxisSize
                                              .min, // keep row compact
                                          children: [
                                            Text(
                                              "Existing User?",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: ColorRes.textSecondary,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(width: 6),
                                            Text(
                                              "Login Here",
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: ColorRes.primary,
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                TextDecoration
                                                    .underline, // 👈 adds a hint it's clickable
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),

                                  // const SizedBox(height: 25),
                                ],
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }


  }



    // ----- WIDGET HELPERS -----


    Widget _buildInfoPoint(String text) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            const Icon(Icons.check_circle, color: Colors.yellow, size: 15),
            const SizedBox(width: 8),
            Text(text, style: const TextStyle(color: Colors.white, fontSize: 13)),
          ],
        ),
      );
    }

    Widget _buildTab(String title, bool isSelected) {
      return Container(
        // duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? ColorRes.primary.withOpacity(0.15)
                  : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: AppFontSizes.bodySmall,
            color: isSelected ? ColorRes.primary : ColorRes.textPrimary,
          ),
        ),
      );
    }

    Widget _buildChoice({
      required String title,
      required bool selected,
      required VoidCallback onTap,
    }) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
          decoration: BoxDecoration(
            color: selected ? ColorRes.primary.withOpacity(0.1) : Colors.white,
            border: Border.all(
              color: selected ? Colors.transparent : Colors.grey.shade300,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: selected ? ColorRes.primary : ColorRes.textPrimary,
              fontWeight: FontWeight.w500,
              fontSize: AppFontSizes.small,
            ),
          ),
        ),
      );
    }

    Widget _buildSectionTitle(String title) {
      return Text(
        title,
        style: const TextStyle(
          fontSize: AppFontSizes.bodySmall,
          fontWeight: FontWeight.w600,
          color: ColorRes.textSecondary,
        ),
      );
    }

    Widget _buildTextField(
      String label,
      IconData icon,
      TextEditingController controller, {
      bool isPhone = false,
    }) {
      return TextField(
        controller: controller,
        keyboardType: isPhone ? TextInputType.phone : TextInputType.text,
        style: const TextStyle(fontSize: 14, color: ColorRes.textPrimary),
        decoration: InputDecoration(
          prefixIcon:
              isPhone
                  ? Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: _buildPhonePrefix(),
                  )
                  : Icon(icon, color: ColorRes.primary, size: 20),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 48,
            maxHeight: 20,
          ),
          hintText: label,
          hintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade500),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 14,
            horizontal: 12,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              width: 0.8,
              color: ColorRes.grey.withOpacity(0.3),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(width: 1.2, color: ColorRes.primary),
          ),
          filled: true,
          fillColor: Colors.grey.shade50,
        ),
      );
    }

    Widget _buildPhonePrefix() {
      final countryCodes = [
        {'code': '+91', 'flag': '🇮🇳'},
        {'code': '+1', 'flag': '🇺🇸'},
        {'code': '+44', 'flag': '🇬🇧'},
        {'code': '+61', 'flag': '🇦🇺'},
        {'code': '+1-CA', 'flag': '🇨🇦'},
        {'code': '+49', 'flag': '🇩🇪'},
        {'code': '+33', 'flag': '🇫🇷'},
        {'code': '+65', 'flag': '🇸🇬'},
        {'code': '+971', 'flag': '🇦🇪'},
        {'code': '+81', 'flag': '🇯🇵'},
      ];

      final controller = Get.find<CreatePropertyController>();

      return Obx(
        () => Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: controller.countryCode.value,
                isDense: true,
                icon: const SizedBox(),
                // 🔑 reduces built-in padding
                style: const TextStyle(
                  fontSize: 14,
                  color: ColorRes.textSecondary,
                ),
                items:
                    countryCodes.map((entry) {
                      return DropdownMenuItem(
                        value: entry['code'],
                        child: Row(
                          children: [
                            Text(
                              entry['flag']!,
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(width: 3), // reduced from 6 → 3
                            Text(entry['code']!),
                          ],
                        ),
                      );
                    }).toList(),
                selectedItemBuilder: (context) {
                  return countryCodes.map((entry) {
                    return Row(
                      children: [
                        Text(
                          entry['flag']!,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(width: 3), // reduced from 6 → 3
                        Text(entry['code']!),
                      ],
                    );
                  }).toList();
                },
                onChanged: (val) {
                  if (val != null) controller.setCountryCode(val);
                },
              ),
            ),
          ],
        ),
      );
    }

    Widget subPropertyType(CreatePropertyController controller) {
      final items = IconManager.items;

      return Obx(
        () => SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(items.length, (index) {
              final item = items[index];
              final isSelected = controller.selectedIndex.value == item.title;

              return GestureDetector(
                onTap: () => controller.select(item.title),
                child: Container(
                  // duration: const Duration(milliseconds: 200),
                  width: 100,
                  margin: const EdgeInsets.only(right: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color:
                        isSelected
                            ? ColorRes.primary.withOpacity(0.1)
                            : Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color:
                          isSelected ? Colors.transparent : Colors.grey.shade300,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppSvgIcon(
                        assetName: item.key,
                        size: 24,
                        color:
                            isSelected ? ColorRes.primary : Colors.grey.shade600,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item.title,
                        style: TextStyle(
                          fontSize: AppFontSizes.caption,
                          fontWeight: FontWeight.w500,
                          color: isSelected ? ColorRes.primary : Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      );
    }

    // SellerType _mapRoleToUserType(UserRole role) {
    //   switch (role) {
    //     case Sellertype.seller:
    //       return SellerType.owner;
    //     case UserRole.builder:
    //       return SellerType.builder;
    //     default:
    //       return SellerType.owner; // fallback
    //   }
    // }




