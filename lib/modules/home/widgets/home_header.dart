// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';
// import 'package:housing_flutter_app/app/constants/app_font_sizes.dart';
// import 'package:housing_flutter_app/app/constants/color_res.dart';
// import 'package:housing_flutter_app/app/constants/size_manager.dart';
// import 'package:housing_flutter_app/modules/search_property/view/search_screen.dart';
// import 'package:housing_flutter_app/widgets/input/custom_text_field.dart';

// class HomeHeader extends StatefulWidget {
//   final String cityName;
//   final List<String> propertyTypes;
//   final String backgroundImage;

//   const HomeHeader({
//     super.key,
//     this.cityName = "Surat",
//     this.backgroundImage =
//         "https://sitasurat.in/assets/images/about/surat-city.jpg",
//     this.propertyTypes = const [
//       "Buy",
//       "Sell",
//       "Rent",
//       // "Commercial",
//       "PG",
//       // "Shop",
//       // "Office",
//       // "Studio",
//       // "Warehouse",
//     ],
//   });

//   @override
//   State<HomeHeader> createState() => _HomeHeaderState();
// }

// class _HomeHeaderState extends State<HomeHeader> {
//   int selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
//       child: Stack(
//         children: [
//           // Background Image
//           // Image.network(
//           //   widget.backgroundImage,
//           //   width: double.infinity,
//           //   height: 220,
//           //   fit: BoxFit.cover,
//           // ),
//           SizedBox(
//             width: double.infinity,
//             // height: 230,
//             height: 180,
//             child: Stack(
//               fit: StackFit.expand,
//               children: [
//                 // Background Image
//                 Image.network(
//                   widget.backgroundImage,
//                   width: double.infinity,
//                   height: 230,
//                   fit: BoxFit.cover,
//                 ),

//                 // Gradient overlay (transparent → black)
//                 Container(
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                       colors: [
//                         Colors.transparent, // top
//                         ColorRes.grey.withOpacity(0.5), // bottom
//                       ],
//                       stops: [0.0, 1.0], // smooth transition
//                     ),
//                   ),
//                 ),
//                 BackdropFilter(
//                   filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
//                   // 👈 blur intensity
//                   child: Container(color: Colors.transparent),
//                 ),
//               ],
//             ),
//           ),

//           // Overlay content
//           Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Top Row: City + Post Property
//               Container(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 12,
//                   vertical: 12 ,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Expanded(
//                       child: Row(
//                         children: [
//                           Row(
//                             children: [
//                               Icon(
//                                 Icons.location_on,
//                                 color: ColorRes.white,
//                                 size: 20,
//                               ),
//                               const SizedBox(width: 4),
//                               Text(
//                                 widget.cityName,
//                                 style: const TextStyle(
//                                   fontSize: 18,
//                                   color: ColorRes.white,
//                                   fontWeight: FontWeight.w700,
//                                 ),
//                               ),
//                               const SizedBox(width: 4),
//                               Icon(
//                                 Icons.keyboard_arrow_down,
//                                 color: ColorRes.white,
//                                 size: 20,
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),

//                     // SizedBox(width: 8),
//                     ElevatedButton.icon(
//                       onPressed: () {
//                         print("Post Property tapped");
//                       },
//                       icon: const Icon(Icons.add, size: 18),
//                       label: const Text(
//                         "Create",
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: ColorRes.primary,
//                         foregroundColor: Colors.white,
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 8,
//                           vertical: 6,
//                         ),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: buildPositionedTextField(context, () {
//                         Get.to(() => CommonSearchField());
//                       }),
//                     ),
//                     const SizedBox(width: 8),
//                     GestureDetector(
//                       onTap: () {
//                         print("Mic tapped");
//                         Get.to(() => CommonSearchField());
//                       },
//                       child: Container(
//                         padding: const EdgeInsets.all(12),
//                         decoration: BoxDecoration(
//                           color: ColorRes.white,
//                           borderRadius: BorderRadius.circular(16),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.1),
//                               blurRadius: 5,
//                               offset: const Offset(0, 2),
//                             ),
//                           ],
//                         ),
//                         child: Icon(
//                           Icons.mic_sharp,
//                           color: ColorRes.primary,
//                           size: 24,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 16),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// Widget buildPositionedTextField(BuildContext context, VoidCallback? onTap) {
//   return GestureDetector(
//     onTap: onTap,
//     child: TextField(
//       enabled: false, // same as your CustomTextField
//       controller: TextEditingController(),
//       decoration: InputDecoration(
//         hintText: 'Surat , Gujarat , 395010',
//         filled: true,
//         fillColor: ColorRes.white,
//         prefixIcon: const Icon(
//           Icons.my_location,
//           color: ColorRes.grey,
//           size: 22,
//         ),
//         suffixIcon: const Padding(
//           padding: EdgeInsets.symmetric(horizontal: AppPadding.small),
//           child: Icon(Icons.search, color: Colors.black, size: 22),
//         ),
//         contentPadding: const EdgeInsets.symmetric(
//           vertical: 14,
//           horizontal: 12,
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(16),
//           // borderSide: BorderSide(
//           //   color: ColorRes.grey,
//           //   width: 1,
//           // ), // remove border like your custom field
//         ),
//       ),
//     ),
//   );
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housing_flutter_app/app/constants/app_font_sizes.dart';
import 'package:housing_flutter_app/app/constants/color_res.dart';
import 'package:housing_flutter_app/modules/search_property/view/search_screen.dart';

class HomeHeader extends StatefulWidget {
  final String cityName;
  final List<String> propertyTypes;
  final String backgroundImage;

  const HomeHeader({
    super.key,
    this.cityName = "Surat, Gujarat",
    this.backgroundImage =
        "https://sitasurat.in/assets/images/about/surat-city.jpg",
    this.propertyTypes = const [
      "Buy",
      "Sell",
      "Rent",
      // "Commercial",
      "PG",
      // "Shop",
      // "Office",
      // "Studio",
      // "Warehouse",
    ],
  });

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Top Row: City + Post Property
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: ColorRes.white,
                            border: Border.all(
                              color: ColorRes.grey.withOpacity(0.2),
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: const Icon(
                            Icons.notes_outlined,
                            color: ColorRes.black,
                            size: 22,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Location",
                              style: TextStyle(
                                fontSize: AppFontSizes.extraSmall,
                                color: ColorRes.primary,

                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              widget.cityName,
                              style: const TextStyle(
                                fontSize: AppFontSizes.body,
                                color: ColorRes.textColor,
                                fontWeight: AppFontWeights.semiBold,
                                // fontFamily: 'Roboto',
                              ),
                            ),
                          ],
                        ),
                  
                      ],
                    ),
                  ],
                ),
              ),

              // SizedBox(width: 8),
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(color: ColorRes.grey.withOpacity(0.2)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    "https://img.freepik.com/premium-vector/man-avatar-profile-picture-isolated-background-avatar-profile-picture-man_1293239-4866.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: buildPositionedTextField(context, () {
                  Get.to(() => const CommonSearchField());
                }),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  print("Mic tapped");
                  Get.to(() => const CommonSearchField());
                },
                child: Container(
                  height: 52,
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    color: ColorRes.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: ColorRes.grey.withOpacity(0.2)),
                  ),
                  child: const Icon(
                    Icons.category_outlined,
                    color: ColorRes.primary,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
        // const SizedBox(height: 8),
      ],
    );
  }
}

Widget buildPositionedTextField(BuildContext context, VoidCallback? onTap) {
  return GestureDetector(
    onTap: onTap,
    child: TextField(
      enabled: false, // same as your CustomTextField
      controller: TextEditingController(),
      decoration: InputDecoration(
        hintText: 'Change your Location ...',
        hintStyle: const TextStyle(fontSize: 14),
        filled: true,
        fillColor: ColorRes.white,
        prefixIcon: const Icon(Icons.search, color: ColorRes.primary, size: 22),

        contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 12,
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorRes.grey.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(16),
          // borderSide: BorderSide(
          //   color: ColorRes.grey,
          //   width: 1,
          // ), // remove border like your custom field
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorRes.grey.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(16),
          // borderSide: BorderSide(
          //   color: ColorRes.grey,
          //   width: 1,
          // ), // remove border like your custom field
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: ColorRes.grey.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
  );
}
