import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:housing_flutter_app/app/constants/color_res.dart';
import 'package:housing_flutter_app/app/constants/size_manager.dart';
import 'package:housing_flutter_app/modules/search_property/view/search_screen.dart';
import 'package:housing_flutter_app/widgets/input/custom_text_field.dart';

class HomeHeader extends StatefulWidget {
  final String cityName;
  final List<String> propertyTypes;
  final String backgroundImage;

  const HomeHeader({
    super.key,
    this.cityName = "Surat",
    this.backgroundImage =
        "https://sitasurat.in/assets/images/about/surat-city.jpg",
    this.propertyTypes = const [
      "Apartment",
      "Villa",
      "Plot",
      "Commercial",
      "PG",
      "Shop",
      "Office",
      "Studio",
      "Warehouse",
    ],
  });

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
      child: Stack(
        children: [
          // Background Image
          // Image.network(
          //   widget.backgroundImage,
          //   width: double.infinity,
          //   height: 220,
          //   fit: BoxFit.cover,
          // ),
          SizedBox(
            width: double.infinity,
            height: 230,
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Background Image
                Image.network(
                  widget.backgroundImage,
                  width: double.infinity,
                  height: 230,
                  fit: BoxFit.cover,
                ),

                // Gradient overlay (transparent → black)
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent, // top
                        ColorRes.grey.withOpacity(0.5), // bottom
                      ],
                      stops: [0.0, 1.0], // smooth transition
                    ),
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
                  // 👈 blur intensity
                  child: Container(color: Colors.transparent),
                ),
              ],
            ),
          ),

          // Overlay content
          Container(
            height: 230,

            padding: const EdgeInsets.symmetric(vertical: 20),
            //color: ColorRes.primary.withOpacity(1),
            decoration: BoxDecoration(
              color: Colors.blueGrey.withOpacity(0.2),
              // gradient: LinearGradient(
              //   begin: Alignment.topCenter,
              //   end: Alignment.bottomCenter,
              //   // stops: [0.2, 0.8, 1.0],
              //   // colors: [
              //   //   ColorRes.white,
              //   //   ColorRes.primary.withOpacity(0.5),
              //   //   ColorRes.primary.withOpacity(0.10),
              //   // ],
              //
              //       // stops: [0.0, 0.3, 1.0], // control smoothness
              //       colors: [
              //         // Colors.,
              //         // ColorRes.success.withOpacity(0.4), // soft transition
              //         ColorRes.primary,                  // solid bottom
              //       ],
              //
              //
              //
              //
              // ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Row: City + Post Property
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Icon(Icons.location_on, color: ColorRes.primary),
                            const SizedBox(width: 4),
                            Flexible(
                              child: Text(
                                widget.cityName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: ColorRes.white,
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          print("Post Property tapped");
                        },
                        icon: const Icon(Icons.add, size: 18),
                        label: const Text("Post Property"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorRes.primary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 6,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // Search Bar
                // Container(
                //   padding: const EdgeInsets.symmetric(horizontal: 12),
                //
                //   child: CustomTextField(
                //     controller: TextEditingController(),
                //     hintText: "Search for City, locality or property",
                //     prefixIcon: Icons.search,
                //     radius: 16,
                //     suffixIcon: IconButton(
                //       icon: const Icon(Icons.clear),
                //       onPressed: () {
                //         print("Clear button pressed");
                //       },
                //     ),
                //     onChanged: (value) {
                //       print("Searching: $value");
                //     },
                //   ),
                // ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: buildPositionedTextField(context,() {
                    Get.to(() => CommonSearchField());
                  },),
                ),
                const SizedBox(height: 16),
                // Property Type Tags (Scrollable horizontally, no side padding)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  //  padding: EdgeInsets.zero, // remove default scroll padding
                  child: Row(
                    children: List.generate(widget.propertyTypes.length, (
                      index,
                    ) {
                      final type = widget.propertyTypes[index];
                      final isSelected = selectedIndex == index;

                      return Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                selectedIndex = index;
                              });
                              print("Selected: $type");
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  isSelected ? Colors.white : Colors.white,
                              foregroundColor:
                                  isSelected
                                      ? ColorRes.primary
                                      : ColorRes.black,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 10,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side:
                                    isSelected
                                        ? BorderSide(
                                          color: ColorRes.primary,
                                          width: 1.5,
                                        )
                                        : BorderSide.none,
                              ),
                              minimumSize: const Size(0, 40),
                            ),
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 120),

                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Text(
                                  type,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Add spacing only between buttons
                          if (index != widget.propertyTypes.length - 1)
                            const SizedBox(width: 8),
                        ],
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


Widget buildPositionedTextField(BuildContext context,VoidCallback? onTap) {
  return GestureDetector(
    onTap: onTap,
    child: CustomTextField(
      enabled:false,
      radius: 16,
      suffixIcon: const Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.small),
        child: Icon(Icons.search, color: Colors.black, size: 25),
      ),
      prefixIcon:
        Icons.my_location,
      
      
      controller: TextEditingController(),
      hintText: 'Surat , Gujarat , 395010',

    ),
  );
}






