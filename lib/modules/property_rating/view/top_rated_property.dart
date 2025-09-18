// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

// import 'package:google_fonts/google_fonts.dart';
// import 'package:housing_flutter_app/app/constants/app_font_sizes.dart';
// import 'package:housing_flutter_app/app/constants/color_res.dart';
// import 'package:housing_flutter_app/app/utils/dummy_data.dart';
// import 'package:housing_flutter_app/data/network/property/models/property_model.dart';
// import 'package:housing_flutter_app/modules/home/views/home_screen.dart';
// import 'package:housing_flutter_app/modules/home/widgets/home_header.dart';
// import 'package:housing_flutter_app/modules/property/controllers/property_controller.dart';
// import 'package:housing_flutter_app/modules/property/views/property_detail_screen.dart';
// import 'package:housing_flutter_app/modules/property_price_trend/view/widget/price_property_card.dart';
// import 'package:housing_flutter_app/modules/property_rating/view/widget/feedback.dart';
// import 'package:housing_flutter_app/modules/property_rating/view/widget/rating.dart';
// import 'package:housing_flutter_app/modules/search_property/view/search_screen.dart';

// import '../../property_price_trend/view/property_price_trend.dart';

// class RatingDetail extends StatefulWidget {
//   final Items property;
//   RatingDetail({super.key, required this.property});
//   final PropertyController propertyController = Get.put(PropertyController());
//   @override
//   State<RatingDetail> createState() => _RatingDetailState();
// }

// class _RatingDetailState extends State<RatingDetail> {
//   @override
//   Widget build(BuildContext context) {
//     return AnnotatedRegion<SystemUiOverlayStyle>(
//       value: SystemUiOverlayStyle.light.copyWith(
//         systemNavigationBarDividerColor: Colors.transparent,
//         systemNavigationBarColor: Theme.of(context).secondaryHeaderColor,
//         systemNavigationBarIconBrightness: Brightness.light,
//         statusBarIconBrightness: Brightness.dark,
//         statusBarColor: Colors.transparent,
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: Padding(
//           padding: EdgeInsets.only(bottom: 20),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 widget.property == null
//                     ? const Center(child: CircularProgressIndicator())
//                     : BlurredHeader(
//                       imagePath:
//                           widget.property.propertyMedia?.images?.isNotEmpty ??
//                                   false
//                               ? widget.property.propertyMedia!.images![0]
//                               : 'https://images.pexels.com/photos/186077/pexels-photo-186077.jpeg?...',
//                       height: 200,
//                       onBack: () => Navigator.pop(context),
//                     ),

//                 SizedBox(height: 10),
//                 // Scrollable Content Section
//                 Container(
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     // border: Border(
//                     //   top: BorderSide(
//                     //     color: ColorRes.primary.withOpacity(0.3),
//                     //     width: 1,
//                     //   ),
//                     // ),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.symmetric(
//                           vertical: 10,
//                           horizontal: 12,
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             /// Image
//                             Container(
//                               height: 65,
//                               width: 70,
//                               decoration: BoxDecoration(
//                                 border: Border.all(
//                                   color: ColorRes.primary,
//                                   width: 2,
//                                 ),
//                                 image: DecorationImage(
//                                   image: NetworkImage(
//                                     widget
//                                                 .property
//                                                 .propertyMedia
//                                                 ?.images
//                                                 ?.isNotEmpty ??
//                                             false
//                                         ? widget
//                                             .property
//                                             .propertyMedia!
//                                             .images![0]
//                                         : 'https://images.pexels.com/photos/186077/pexels-photo-186077.jpeg?cs=srgb&dl=pexels-binyaminmellish-186077.jpg&fm=jpg',
//                                   ),
//                                   fit: BoxFit.cover,
//                                 ),
//                                 borderRadius: BorderRadius.circular(15),
//                               ),
//                             ),
//                             SizedBox(width: 5),
//                             VerticalDivider(
//                               color: Colors.grey.shade300,
//                               indent: 15,
//                               endIndent: 15,
//                               thickness: 0.5,
//                             ),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   buildCommonText(
//                                     '${widget.property.title}',
//                                     AppFontSizes.bodySmall,
//                                     FontWeight.w600,
//                                     ColorRes.textPrimary,
//                                     1,
//                                   ),

//                                   buildCommonText(
//                                     'Location : ${widget.property.address ?? "City"}',
//                                     AppFontSizes.extraSmall,
//                                     FontWeight.w400,
//                                     ColorRes.grey.withOpacity(0.7),
//                                     1,
//                                   ),
//                                   SizedBox(height: 4),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     children: [
//                                       Icon(
//                                         Icons.star,
//                                         color: ColorRes.primary,
//                                         size: 15,
//                                       ),
//                                       buildCommonText(
//                                         ' ${widget.property.performanceScore} ',
//                                         10,
//                                         FontWeight.w600,
//                                         Colors.grey,
//                                         1,
//                                       ),
//                                       SizedBox(width: 2),
//                                       buildCommonText(
//                                         '| Rating',
//                                         AppFontSizes.extraSmall,
//                                         FontWeight.w500,
//                                         Colors.grey,
//                                         1,
//                                       ),
//                                       //   Icon(
//                                       //     Icons.arrow_upward,
//                                       //     size: 15,
//                                       //     color: ColorRes.success,
//                                       //   ),
//                                       //   buildCommonText(
//                                       //     ' ${widget.property}%',
//                                       //     12,
//                                       //     FontWeight.bold,
//                                       //   ColorRes.success,
//                                       //   1,
//                                       // ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: 5),
//                       Padding(
//                         padding: EdgeInsets.symmetric(
//                           horizontal: 7,
//                           vertical: 10,
//                         ),
//                         child: Row(
//                           children:
//                               stats.take(2).map((stat) {
//                                 return Expanded(
//                                   child: Padding(
//                                     padding: EdgeInsets.symmetric(
//                                       horizontal: 5,
//                                     ),
//                                     child: StatCard(
//                                       title: stat["title"] as String,
//                                       value: stat["value"] as String,
//                                       subText: stat["subText"] as String?,
//                                       icon: stat["icon"] as IconData?,
//                                       iconColor: stat["iconColor"] as Color?,
//                                     ),
//                                   ),
//                                 );
//                               }).toList(),
//                         ),
//                       ),

//                       SizedBox(height: 5),

//                       Padding(
//                         padding: EdgeInsets.symmetric(
//                           horizontal: 12,
//                           vertical: 5,
//                         ),
//                         child: buildHeading(context, 'Rating'),
//                       ),
//                       SizedBox(height: 5),
//                       RatingWidget(
//                         averageRating: propertyList[0]['rating'],
//                         ratingCounts: {5: 30, 4: 15, 3: 8, 2: 4, 1: 3},
//                       ),
//                       SizedBox(height: 5),
//                       Padding(
//                         padding: EdgeInsets.symmetric(
//                           horizontal: 12,
//                           vertical: 5,
//                         ),
//                         child: buildHeading(context, 'Reviews'),
//                       ),
//                       ...List.generate(
//                         3,
//                         (index) => FeedbackCard(
//                           date: '20-Aug-2025',
//                           rating: propertyList[index]['rating'],
//                           userName: propertyList[index]['seller']['name'],
//                           feedback:
//                               propertyList[index]['seller']['description'],
//                           profileUrl: propertyList[index]['seller']['image'],
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(
//                           horizontal: 10,
//                           vertical: 5,
//                         ),
//                         child: Row(
//                           children: [
//                             Expanded(
//                               child: buildButton(
//                                 title: 'Read More Reviews',
//                                 context: context,
//                               ),
//                             ),

//                             Expanded(
//                               child: buildButton(
//                                 title: 'View other properties',
//                                 context: context,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: 5),
//                       Padding(
//                         padding: EdgeInsets.symmetric(
//                           horizontal: 12,
//                           vertical: 5,
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             buildHeading(
//                               context,
//                               'Similar result of trending ',
//                             ),

//                             buildCommonText(
//                               'See all',
//                               12,
//                               FontWeight.w500,
//                               ColorRes.primary,
//                               1,
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: 10),
//                       ...List.generate(widget.propertyController.items.length, (
//                         index,
//                       ) {
//                         final property = widget.propertyController.items[index];
//                         final percentage =
//                             double.tryParse(propertyPercentage[index]) ?? 0.0;

//                         return Padding(
//                           padding: const EdgeInsets.only(bottom: 12),
//                           child: PricePropertyCard(
//                             // title: property['title'],
//                             // address: property['complete_address'] ?? "City",
//                             // imagePath: property['image'],
//                             // rating: property['rating'],
//                             // pricePerSqft: property['area_sqft'],
//                             title: property.title ?? '',
//                             address: property.address ?? "City",
//                             imagePath:
//                                 property.propertyMedia?.images?.isNotEmpty ==
//                                         true
//                                     ? property.propertyMedia!.images!.first
//                                     : 'assets/logo/Avant.jpg',
//                             rating: 4.2,
//                             pricePerSqft:
//                                 property
//                                             .propertyDetails
//                                             ?.financialInfo
//                                             ?.pricePerSqft !=
//                                         null
//                                     ? int.tryParse(
//                                       property
//                                           .propertyDetails!
//                                           .financialInfo!
//                                           .pricePerSqft
//                                           .toString(),
//                                     )
//                                     : null,
//                             showPercentage: true,
//                             // pricePerSqft: int.parse(property.propertyDetails?.financialInfo?.pricePerSqft.toString()??'0'),
//                             onTap: () {
//                               print(
//                                 "Tapped on ${int.tryParse(property.propertyDetails!.financialInfo!.pricePerSqft.toString())}",
//                               );
//                             },
//                           ),
//                         );
//                       }),
//                       SizedBox(height: 20),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildStars(double rating, double size) {
//     List<Widget> stars = [];
//     int fullStars = rating.floor();
//     bool hasHalf = (rating - fullStars) >= 0.5;

//     for (int i = 0; i < 5; i++) {
//       if (i < fullStars) {
//         stars.add(Icon(Icons.star, color: ColorRes.primary, size: size));
//       } else if (i == fullStars && hasHalf) {
//         stars.add(Icon(Icons.star_half, color: ColorRes.primary, size: size));
//       } else {
//         stars.add(Icon(Icons.star_border, color: ColorRes.primary, size: size));
//       }
//     }
//     return Row(children: stars);
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:housing_flutter_app/app/constants/app_font_sizes.dart';
import 'package:housing_flutter_app/app/constants/color_res.dart';
import 'package:housing_flutter_app/app/utils/dummy_data.dart';
import 'package:housing_flutter_app/data/network/property/models/property_model.dart';
import 'package:housing_flutter_app/modules/home/views/home_screen.dart';
import 'package:housing_flutter_app/modules/property/controllers/property_controller.dart';
import 'package:housing_flutter_app/modules/property/views/property_detail_screen.dart';
import 'package:housing_flutter_app/modules/property_price_trend/view/property_price_trend.dart';
import 'package:housing_flutter_app/modules/property_price_trend/view/widget/price_property_card.dart';
import 'package:housing_flutter_app/modules/property_rating/view/widget/feedback.dart';
import 'package:housing_flutter_app/modules/property_rating/view/widget/rating.dart';
import 'package:housing_flutter_app/modules/search_property/view/search_screen.dart';

class RatingDetail extends StatefulWidget {
  final Items property;
  RatingDetail({super.key, required this.property});
  final PropertyController propertyController = Get.put(PropertyController());

  @override
  State<RatingDetail> createState() => _RatingDetailState();
}

class _RatingDetailState extends State<RatingDetail> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarColor: Theme.of(context).secondaryHeaderColor,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              BlurredHeader(
                    imagePath:
                        widget.property.propertyMedia?.images?.isNotEmpty ??
                                false
                            ? widget.property.propertyMedia!.images![0]
                            : 'https://images.pexels.com/photos/186077/pexels-photo-186077.jpeg?...',
                    height: 200,
                    onBack: () => Navigator.pop(context),
                  ),

              const SizedBox(height: 16),

              Container(
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 12,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          /// Property image
                          Container(
                            height: 65,
                            width: 70,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: ColorRes.primary,
                                width: 2,
                              ),
                              image: DecorationImage(
                                image: NetworkImage(
                                  widget
                                              .property
                                              .propertyMedia
                                              ?.images
                                              ?.isNotEmpty ??
                                          false
                                      ? widget
                                          .property
                                          .propertyMedia!
                                          .images![0]
                                      : 'https://images.pexels.com/photos/186077/pexels-photo-186077.jpeg?cs=srgb&dl=pexels-binyaminmellish-186077.jpg&fm=jpg',
                                ),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildCommonText(
                                  '${widget.property.title}',
                                  AppFontSizes.bodySmall,
                                  FontWeight.w600,
                                  ColorRes.textPrimary,
                                  1,
                                ),
                                const SizedBox(height: 4),
                                buildCommonText(
                                  'Location : ${widget.property.address ?? "City"}',
                                  AppFontSizes.extraSmall,
                                  FontWeight.w400,
                                  ColorRes.grey.withOpacity(0.7),
                                  1,
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: ColorRes.primary,
                                      size: 14,
                                    ),
                                    const SizedBox(width: 4),
                                    buildCommonText(
                                      ' ${widget.property.performanceScore} ',
                                      11,
                                      FontWeight.w600,
                                      Colors.grey,
                                      1,
                                    ),
                                    const SizedBox(width: 6),
                                    buildCommonText(
                                      '| Rating',
                                      AppFontSizes.extraSmall,
                                      FontWeight.w500,
                                      Colors.grey,
                                      1,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    /// Stats cards
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        spacing: 5,
                        children:
                            stats.take(2).map((stat) {
                              return Expanded(
                                child: StatCard(
                                  title: stat["title"] as String,
                                  value: stat["value"] as String,
                                  subText: stat["subText"] as String?,
                                  icon: stat["icon"] as IconData?,
                                  iconColor: stat["iconColor"] as Color?,
                                ),
                              );
                            }).toList(),
                      ),
                    ),

                    const SizedBox(height: 20),
                    ReviewHighlights(
                      goodThings:
                          propertyList[0]['good_things'] as List<String>,
                      improvements:
                          propertyList[0]['needs_improvement'] as List<String>,
                    ),
                    const SizedBox(width: 12),

                    /// Rating
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: buildHeading(context, 'Rating'),
                    ),
                    const SizedBox(height: 8),
                    RatingWidget(
                      averageRating: propertyList[0]['rating'],
                      ratingCounts: const {5: 30, 4: 15, 3: 8, 2: 4, 1: 3},
                    ),

                    const SizedBox(height: 20),

                    /// Reviews
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: buildHeading(context, 'Reviews'),
                    ),
                    const SizedBox(height: 8),
                    ...List.generate(
                      3,
                      (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: FeedbackCard(
                          date: '20-Aug-2025',
                          rating: propertyList[index]['rating'],
                          userName: propertyList[index]['seller']['name'],
                          feedback:
                              propertyList[index]['seller']['description'],
                          profileUrl: propertyList[index]['seller']['image'],
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    /// Buttons
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          Expanded(
                            child: buildButton(
                              title: 'Read More Reviews',
                              context: context,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: buildButton(
                              title: 'View other properties',
                              context: context,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    /// Similar trending section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildHeading(context, 'Similar result of trending '),
                          buildCommonText(
                            'See all',
                            12,
                            FontWeight.w500,
                            ColorRes.primary,
                            1,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    /// Property cards
                    ...List.generate(widget.propertyController.items.length, (
                      index,
                    ) {
                      final property = widget.propertyController.items[index];

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: PricePropertyCard(
                          title: property.title ?? '',
                          address: property.address ?? "City",
                          imagePath:
                              property.propertyMedia?.images?.isNotEmpty == true
                                  ? property.propertyMedia!.images!.first
                                  : 'assets/logo/Avant.jpg',
                          rating: 4.2,
                          pricePerSqft:
                              property
                                          .propertyDetails
                                          ?.financialInfo
                                          ?.pricePerSqft !=
                                      null
                                  ? int.tryParse(
                                    property
                                        .propertyDetails!
                                        .financialInfo!
                                        .pricePerSqft
                                        .toString(),
                                  )
                                  : null,
                          showPercentage: true,
                          onTap: () {
                            print(
                              "Tapped on ${int.tryParse(property.propertyDetails!.financialInfo!.pricePerSqft.toString())}",
                            );
                          },
                        ),
                      );
                    }),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStars(double rating, double size) {
    List<Widget> stars = [];
    int fullStars = rating.floor();
    bool hasHalf = (rating - fullStars) >= 0.5;

    for (int i = 0; i < 5; i++) {
      if (i < fullStars) {
        stars.add(Icon(Icons.star, color: ColorRes.primary, size: size));
      } else if (i == fullStars && hasHalf) {
        stars.add(Icon(Icons.star_half, color: ColorRes.primary, size: size));
      } else {
        stars.add(Icon(Icons.star_border, color: ColorRes.primary, size: size));
      }
    }
    return Row(children: stars);
  }
}
