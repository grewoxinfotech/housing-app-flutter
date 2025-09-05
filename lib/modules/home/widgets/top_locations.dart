// import 'package:flutter/material.dart';
// import 'package:housing_flutter_app/app/constants/app_font_sizes.dart';
// import 'package:housing_flutter_app/app/constants/color_res.dart';
// import 'package:housing_flutter_app/app/utils/common_text.dart';
//
// import 'package:flutter/material.dart';
// import 'package:housing_flutter_app/app/constants/app_font_sizes.dart';
// import 'package:housing_flutter_app/app/constants/color_res.dart';
// import 'package:housing_flutter_app/app/utils/common_text.dart';
//
// class TopLocations extends StatelessWidget {
//   final String title;
//   final String imagePath;
//   final String street;
//   final String city;
//   final String? state;
//   final double pricePerSqft;
//   final double rating;
//
//   // --- Navigation ---
//   final VoidCallback? onTap;
//
//   // --- UI Customizations ---
//   final double width;
//   final double imageHeight;
//   final double borderRadius;
//   final Color borderColor;
//   final double borderWidth;
//   final Color dividerColor;
//
//   // --- Bottom Button Text ---
//   final String buttonText;
//
//   // --- Icons ---
//   final IconData ratingIcon;
//   final IconData actionIcon;
//   final Color iconColor;
//   final Color ratingColor;
//
//   const TopLocations({
//     super.key,
//     required this.title,
//     required this.imagePath,
//     required this.street,
//     required this.city,
//     this.state,
//     required this.pricePerSqft,
//     required this.rating,
//     this.onTap,
//
//     // ui
//     this.width = 250,
//     this.imageHeight = 80,
//     this.borderRadius = 15,
//     this.borderColor = Colors.grey,
//     this.borderWidth = 0.5,
//     this.dividerColor = Colors.grey,
//
//     // text/button
//     this.buttonText = "View Details",
//
//     // icons
//     this.ratingIcon = Icons.star,
//     this.actionIcon = Icons.arrow_forward_rounded,
//     this.iconColor = Colors.indigo,
//     this.ratingColor = Colors.grey,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Padding(
//         padding: const EdgeInsets.only(left: 10, top: 10),
//         child: Container(
//           width: width,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(borderRadius),
//             border: Border.all(
//               color: borderColor.withOpacity(0.5),
//               width: borderWidth,
//             ),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // 🔹 Image
//               Container(
//                 height: imageHeight,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage(imagePath),
//                     fit: BoxFit.cover,
//                   ),
//                   borderRadius: BorderRadius.circular(borderRadius),
//                 ),
//               ),
//
//               // 🔹 Content
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(height: 4),
//
//                     CustomText(
//                       title,
//                       fontSize: AppFontSizes.title,
//                       fontWeight: AppFontWeights.semiBold,
//                       color: ColorRes.black,
//                       maxLines: 1,
//                     ),
//
//                     const SizedBox(height: 2),
//
//                     CustomText(
//                       "Location: $street, $city${state != null ? ', $state' : ''}",
//                       fontSize: AppFontSizes.extraSmall,
//                       fontWeight: AppFontWeights.regular,
//                       color: ColorRes.black,
//                       maxLines: 1,
//                     ),
//
//                     const SizedBox(height: 2),
//
//                     Row(
//                       children: [
//                         CustomText(
//                           '₹ ${pricePerSqft.toStringAsFixed(1)} K/ sqft',
//                           fontSize: AppFontSizes.extraSmall,
//                           fontWeight: AppFontWeights.semiBold,
//                           color: ColorRes.black,
//                           maxLines: 1,
//                         ),
//                         const Spacer(),
//                         Icon(ratingIcon, color: ratingColor, size: 16),
//                         const SizedBox(width: 3),
//                         CustomText(
//                           rating.toString(),
//                           fontSize: AppFontSizes.small,
//                           fontWeight: AppFontWeights.semiBold,
//                           color: ColorRes.black,
//                           maxLines: 1,
//                         ),
//                       ],
//                     ),
//
//                     Divider(
//                       color: dividerColor.withOpacity(0.5),
//                       thickness: 0.4,
//                       indent: 8,
//                       endIndent: 8,
//                     ),
//
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         CustomText(
//                           buttonText,
//                           fontSize: AppFontSizes.small,
//                           fontWeight: AppFontWeights.extraBold,
//                           color: ColorRes.primary,
//                           maxLines: 1,
//                         ),
//                         const SizedBox(width: 4),
//                         Icon(actionIcon, color: iconColor, size: 14),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:housing_flutter_app/app/constants/app_font_sizes.dart';
import 'package:housing_flutter_app/app/constants/color_res.dart';
import 'package:housing_flutter_app/app/utils/common_text.dart';
import 'package:housing_flutter_app/data/network/property/models/property_model.dart';

class TopLocations extends StatelessWidget {
  final Items property;

  // --- Navigation ---
  final VoidCallback? onTap;

  // --- UI Customizations ---
  final double width;
  final double imageHeight;
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;
  final Color dividerColor;

  // --- Bottom Button Text ---
  final String buttonText;

  // --- Icons ---
  final IconData ratingIcon;
  final IconData actionIcon;
  final Color iconColor;
  final Color ratingColor;

  const TopLocations({
    super.key,
    required this.property,
    this.onTap,

    // ui
    this.width = 250,
    this.imageHeight = 150,
    this.borderRadius = 15,
    this.borderColor = Colors.grey,
    this.borderWidth = 0.5,
    this.dividerColor = Colors.grey,

    // text/button
    this.buttonText = "View Details",

    // icons
    this.ratingIcon = Icons.star,
    this.actionIcon = Icons.arrow_forward_rounded,
    this.iconColor = Colors.indigo,
    this.ratingColor = Colors.orange,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 10),
        child: Container(
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: borderColor.withOpacity(0.5),
              width: borderWidth,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Image
              Container(
                height: imageHeight,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    // ✅ fallback if no image available
                    image: property.propertyMedia?.images?.isNotEmpty == true
                        ? NetworkImage(property.propertyMedia!.images!.first)
                        : const AssetImage("assets/images/placeholder.png")
                    as ImageProvider,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),

              // 🔹 Content
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),

                    CustomText(
                      property.title ?? "Untitled Property",
                      fontSize: AppFontSizes.title,
                      fontWeight: AppFontWeights.semiBold,
                      color: ColorRes.black,
                      maxLines: 1,
                    ),

                    const SizedBox(height: 2),

                    CustomText(
                      "Location: ${property.address}, ${property.city}${property.state != null ? ', ${property.state}' : ''}",
                      fontSize: AppFontSizes.extraSmall,
                      fontWeight: AppFontWeights.regular,
                      color: ColorRes.black,
                      maxLines: 1,
                    ),

                    const SizedBox(height: 2),

                    Row(
                      children: [
                        CustomText(
                          '₹ ${property.propertyDetails?.propertyBuiltUpArea?.toStringAsFixed(1) ?? "0"} K/ sqft',
                          fontSize: AppFontSizes.extraSmall,
                          fontWeight: AppFontWeights.semiBold,
                          color: ColorRes.black,
                          maxLines: 1,
                        ),
                        const Spacer(),
                        Icon(ratingIcon, color: ratingColor, size: 16),
                        const SizedBox(width: 3),
                        CustomText(
                          (property.rating ?? 4.5).toString(),
                          fontSize: AppFontSizes.small,
                          fontWeight: AppFontWeights.semiBold,
                          color: ColorRes.black,
                          maxLines: 1,
                        ),
                      ],
                    ),

                    Divider(
                      color: dividerColor.withOpacity(0.5),
                      thickness: 0.4,
                      indent: 8,
                      endIndent: 8,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          buttonText,
                          fontSize: AppFontSizes.small,
                          fontWeight: AppFontWeights.extraBold,
                          color: ColorRes.primary,
                          maxLines: 1,
                        ),
                        const SizedBox(width: 4),
                        Icon(actionIcon, color: iconColor, size: 14),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

