// import 'package:flutter/material.dart';
// import 'package:housing_flutter_app/app/constants/color_res.dart';
// import 'package:housing_flutter_app/app/constants/img_res.dart';
// import 'package:housing_flutter_app/app/constants/size_manager.dart';
// import 'package:housing_flutter_app/app/utils/common_text.dart';

// import 'package:housing_flutter_app/app/utils/formater/formater.dart';

// import '../../../data/network/property/models/property_model.dart';

// class TopPropertyByLocation extends StatelessWidget {
//   final Items property;
//   final double rating;
//   final bool isPositive;
//   const TopPropertyByLocation({
//     super.key,
//     required this.rating,

//     required this.isPositive,
//     required this.property,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {},
//       child: Container(
//         // width: width,
//         width: 180,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(AppSpacing.medium),
//           border: Border.all(color: ColorRes.grey.withOpacity(0.5), width: 0.5),
//         ),
//         alignment: Alignment.centerLeft,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               height: 100,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image:
//                       property.propertyMedia!.images!.isNotEmpty
//                           ? NetworkImage(property.propertyMedia!.images!.first)
//                           : AssetImage(IMGRes.home1),
//                   fit: BoxFit.cover,
//                 ),
//                 borderRadius: BorderRadius.circular(AppSpacing.medium),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: 4),

//                   CustomText(
//                     property.title!,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w600,
//                     color: ColorRes.textPrimary,
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   const SizedBox(height: 3),

//                   CustomText(
//                     " ${property.city} , ${property.state}",
//                     fontSize: 10,
//                     fontWeight: FontWeight.w400,
//                     color: Colors.grey.shade700,
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   const SizedBox(height: 3),

//                   Row(
//                     children: [
//                       CustomText(
//                         '${Formatter.formatPriceCompact(property.propertyDetails!.financialInfo!.price ?? 0.0)} / sqft',
//                         fontSize: 11,
//                         fontWeight: FontWeight.w600,
//                         color: ColorRes.textColor,
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                       const Spacer(),
//                       isPositive
//                           ? Icon(
//                             Icons.arrow_upward,
//                             color: ColorRes.success,
//                             size: 16,
//                           )
//                           : Icon(
//                             Icons.arrow_downward,
//                             color: ColorRes.error,
//                             size: 16,
//                           ),
//                       const SizedBox(width: 3),

//                       CustomText(
//                         rating.toString(),
//                         fontSize: 12,
//                         fontWeight: FontWeight.w600,
//                         color: ColorRes.textPrimary,
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 3),
//                   Divider(
//                     color: ColorRes.grey.withOpacity(0.5),
//                     thickness: 0.4,
//                     indent: 8,
//                     endIndent: 8,
//                   ),

//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       GestureDetector(
//                         child: CustomText(
//                           "Price Trends",
//                           fontSize: 12,
//                           fontWeight: FontWeight.w500,
//                           color: ColorRes.primary,
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                       const SizedBox(width: 4),
//                       Icon(
//                         Icons.arrow_forward_rounded,
//                         color: ColorRes.primary,
//                         size: 14,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

///MARK:Change City Card Widget Change in 13-09-2025

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housing_flutter_app/app/constants/color_res.dart';
import 'package:housing_flutter_app/app/constants/img_res.dart';
import 'package:housing_flutter_app/app/constants/size_manager.dart';
import 'package:housing_flutter_app/app/utils/common_text.dart';
import 'package:housing_flutter_app/app/utils/formater/formater.dart';
import 'package:housing_flutter_app/modules/property_price_trend/view/property_price_trend.dart';

import '../../../data/network/property/models/property_model.dart';

class TopPropertyByLocation extends StatelessWidget {
  final Items property;
  final double rating;
  final bool isPositive;
  const TopPropertyByLocation({
    super.key,
    required this.rating,
    required this.isPositive,
    required this.property,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const PriceDetails());
      },
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppRadius.large),
          border: Border.all(color: ColorRes.grey.withOpacity(0.3), width: 0.8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(AppRadius.medium),
              child: Stack(
                children: [
                  Image(
                    image:
                        property.propertyMedia!.images!.isNotEmpty
                            ? NetworkImage(
                              property.propertyMedia!.images!.first,
                            )
                            : const AssetImage(IMGRes.home1) as ImageProvider,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.90),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            isPositive
                                ? Icons.arrow_upward
                                : Icons.arrow_downward,
                            color:
                                isPositive ? ColorRes.success : ColorRes.error,
                            size: 12,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            rating.toStringAsFixed(1),
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: ColorRes.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    property.title ?? "Property",
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: ColorRes.textPrimary,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),

                  CustomText(
                    "${property.city}, ${property.state}",
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade700,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      CustomText(
                        '${Formatter.formatPriceCompact(property.propertyDetails!.financialInfo!.price ?? 0.0)} ',
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: ColorRes.textColor,
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 65,
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                '${property.propertyDetails!.propertyBuiltUpArea ?? 0}',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ),
                            Text(
                              '/ sqft',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      //Add space between area and '/ sqft'
                    ],
                  ),
                  // const SizedBox(height: 4),
                  Divider(
                    color: ColorRes.grey.withOpacity(0.4),
                    thickness: 0.5,
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          "Price Trends",
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: ColorRes.primary,
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: ColorRes.primary,
                          size: 14,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
