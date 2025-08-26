// import 'package:crm_flutter/app/care/constants/size_manager.dart';
// import 'package:crm_flutter/app/modules/functions/controller/function_controller.dart';
// import 'package:crm_flutter/app/modules/functions/widget/functions_widget.dart';
// import 'package:crm_flutter/app/modules/home/widgets/attendance/views/attendance_widget.dart';
// import 'package:crm_flutter/app/widgets/_screen/view_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housing_flutter_app/app/constants/color_res.dart';
import 'package:housing_flutter_app/app/constants/font_res.dart';
import 'package:housing_flutter_app/app/constants/img_res.dart';
import 'package:housing_flutter_app/app/widgets/cards/crm_banner_card_with_text.dart';
import 'package:housing_flutter_app/app/widgets/texts/headline_text.dart';
import 'package:housing_flutter_app/modules/home/views/profile_screen.dart';
import 'package:housing_flutter_app/modules/home/views/property_list_screen.dart';
import 'package:housing_flutter_app/modules/home/views/widgets/banner_list.dart';
import 'package:housing_flutter_app/modules/home/views/widgets/city_filter.dart';
import 'package:housing_flutter_app/modules/home/views/widgets/property_card.dart';
import 'package:housing_flutter_app/widgets/New%20folder/inputs/crm_dropdown_field.dart';
import 'package:housing_flutter_app/widgets/display/crm_card.dart';
import '../../../app/constants/ic_res.dart';
import '../../../app/constants/size_manager.dart';
import '../../../widgets/_screen/view_screen.dart';

import '../../../widgets/bar/app_bar/custom_appbar.dart';
import '../../../widgets/display/crm_app_logo.dart';
import '../../../widgets/display/crm_ic.dart';
import 'widgets/filter_list.dart';

class HomeScreen extends StatelessWidget {
  //final controller = Get.put(FunctionController());

  HomeScreen({super.key});

  static final List<String> images = [
    IMGRes.home1,
    IMGRes.home2,
    IMGRes.home3,
    IMGRes.home4,
  ];
  static final List<String> banners = [
    IMGRes.banner1,
    IMGRes.banner2,
    IMGRes.banner3,
  ];
  static final List<String> shops = [
    IMGRes.shop1,
    IMGRes.shop2,
    IMGRes.shop3,
    IMGRes.shop4,
  ];
  static final List<String> plots = [IMGRes.plot1, IMGRes.plot2, IMGRes.plot3];
  static final List<String> bhk = [IMGRes.bhk1, IMGRes.bhk2, IMGRes.bhk3];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const CustomAppBar(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // /// Header Dropdown of cities
                  // SizedBox(height: 12),
                  // CityDropdown(),
                  //
                  // /// Filter Tags
                  // SizedBox(height: 12),
                  // FilterTagList(),
                  SizedBox(height: 24),
                  FilterTagList(),

                  /// Banner
                  // const SizedBox(height: 24),
                  // // const TitleWithViewAll(title: "Banners", showViewAll: false),
                  // // const SizedBox(height: 12),
                  // // HorizontalBannerList(),
                  // const TitleWithViewAll(
                  //   title: "Property Types",
                  //   showViewAll: false,
                  // ),
                  // const SizedBox(height: 12),
                  // PropertyTypeFilterTagList(),

                  // /// Recommended Product
                  // const SizedBox(height: 12),
                  // const TitleWithViewAll(
                  //   title: "Recommended Property's",
                  //   showViewAll: true,
                  // ),
                  // SingleChildScrollView(
                  //   scrollDirection: Axis.horizontal,
                  //   child: Row(
                  //     children: List.generate(images.length, (index) {
                  //       return Padding(
                  //         padding: const EdgeInsets.only(right: 12),
                  //         child: PropertyCard(
                  //           imageUrl: images[index],
                  //           title: "Villa Newly Renovated",
                  //           price: "9.8 Cr",
                  //           location:
                  //               "123 Palm Beach Road, Juhu, Maharastra, india",
                  //         ),
                  //       );
                  //     }),
                  //   ),
                  // ),
                  const SizedBox(height: 24),
                  TitleWithViewAll(
                    title: "Editor's Choice",
                    showViewAll: true,
                    onViewAll: () => Get.to(PropertyListScreen()),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Wrap(
                      spacing: 12, // Horizontal spacing
                      runSpacing: 12, // Vertical spacing
                      children: List.generate(4, (index) {
                        return SizedBox(
                          width:
                              (MediaQuery.of(context).size.width - 12 * 3) /
                              2, // 2 columns
                          child: PropertyCard(
                            imageUrl: images[index],
                            title:
                                "Villa Newly RenovatedVilla Newly RenovatedVilla Newly RenovatedVilla Newly RenovatedVilla Newly Renovated",
                            price: "9.8 Cr",
                            location: "Juhu, Maharastr",
                          ),
                        );
                      }),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(12.0),
                  //   child: Column(
                  //     children: [
                  //       ...List.generate(2, (index) {
                  //         return Container(
                  //           padding: EdgeInsets.only(bottom: 12),
                  //           width: double.infinity,
                  //           child: PropertyCard(
                  //             imageUrl: images[index],
                  //             title:
                  //                 "Villa Newly RenovatedVilla Newly RenovatedVilla Newly RenovatedVilla Newly RenovatedVilla Newly Renovated",
                  //             price: "9.8 Cr",
                  //             location: "Juhu, Maharastr",
                  //           ),
                  //         );
                  //       }),
                  //     ],
                  //   ),
                  // ),

                  /// Filters by cities
                  const SizedBox(height: 24),
                  const TitleWithViewAll(title: "City", showViewAll: true),
                  const SizedBox(height: 12),

                  const CityFilterList(),

                  const SizedBox(height: 12),
                  const SizedBox(height: 12),
                  const TitleWithViewAll(title: "Residential Properties"),
                  // const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GridView.count(
                      shrinkWrap: true,
                      physics:
                          NeverScrollableScrollPhysics(), // Avoid scrolling conflict if inside scrollable
                      crossAxisCount: 2, // Number of columns in the grid
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 170 / 125, // Width / Height
                      children: List.generate(images.length, (index) {
                        return CrmBannerCardWithText(
                          height: 125,
                          width: 170,
                          imageUrl: images[index],
                          title: "Apartment",
                        );
                      }),
                    ),
                  ),

                  const SizedBox(height: 24),

                  const TitleWithViewAll(title: "Explore by furnishing type"),
                  // const SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: List.generate(banners.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: CrmBannerCardWithText(
                              height: 125,
                              width: 250,
                              imageUrl: banners[index],
                              title: "Fully Furnished",
                              description: "Properties with all Essentials",
                            ),
                          );
                        }),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  const TitleWithViewAll(title: "Commercial offering"),
                  // const SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: List.generate(shops.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: CrmBannerCardWithText(
                              height: 125,
                              width: 125,
                              imageUrl: shops[index],
                              title: "Retail Shop",
                            ),
                          );
                        }),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  const TitleWithViewAll(title: "Find BHK?"),
                  // const SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: List.generate(plots.length * 2, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: CrmBannerCardWithText(
                              height: 100,
                              width: 100,
                              imageUrl: bhk[index % 3],
                              title: "1BHK",
                              isCenterText: true,
                            ),
                          );
                        }),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  const TitleWithViewAll(title: "Plots In Surat"),
                  // const SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: List.generate(plots.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: CrmBannerCardWithText(
                              height: 125,
                              width: 200,
                              imageUrl: plots[index],
                              title: "Residential Plot",
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CityDropdown extends StatefulWidget {
  const CityDropdown({super.key});

  @override
  State<CityDropdown> createState() => _CityDropdownState();
}

class _CityDropdownState extends State<CityDropdown> {
  final List<String> cities = [
    'Mumbai',
    'Delhi',
    'Bangalore',
    'Hyderabad',
    'Chennai',
    'Kolkata',
    'Pune',
  ];

  String? selectedCity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            // Remove borders
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          value: selectedCity,
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.grey,
          ), // Custom arrow icon
          items:
              cities.map((String city) {
                return DropdownMenuItem<String>(value: city, child: Text(city));
              }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedCity = newValue!;
            });
          },
        ),
      ),

      // child: DropdownButtonFormField<String>(
      //   decoration: InputDecoration(
      //     labelText: 'Select City',
      //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      //   ),
      //   value: selectedCity,
      //   items:
      //       cities.map((String city) {
      //         return DropdownMenuItem<String>(value: city, child: Text(city));
      //       }).toList(),
      //   onChanged: (String? newValue) {
      //     setState(() {
      //       selectedCity = newValue!;
      //     });
      //   },
      // ),
    );
  }
}

// CrmDropdownField(
// title: 'Select City',
// value: selectedCity,
// items:
// cities.map((String city) {
// return DropdownMenuItem<String>(value: city, child: Text(city));
// }).toList(),
// onChanged: (newValue) {
// setState(() {
// selectedCity = newValue!;
// });
// },
//
// ),
