import 'package:flutter/material.dart';
import 'package:housing_flutter_app/app/constants/color_res.dart';
import 'package:housing_flutter_app/app/constants/img_res.dart';
import 'package:housing_flutter_app/app/constants/size_manager.dart';
import 'package:housing_flutter_app/app/utils/common_text.dart';

import 'package:housing_flutter_app/app/utils/formater/formater.dart';

import '../../../data/network/property/models/property_model.dart';



class TopPropertyByLocation extends StatelessWidget {
  final Items property;
  final double rating;
  final bool isPositive;
  const TopPropertyByLocation({
    super.key,
    required this.rating,

    required this.isPositive, required this.property,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        // width: width,
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSpacing.medium),
          border: Border.all(
            color: ColorRes.grey.withOpacity(0.5),
            width: 0.5,
          ),
        ),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                image:  DecorationImage(
                  image:property.propertyMedia!.images!.isNotEmpty ? NetworkImage(property.propertyMedia!.images!.first): AssetImage(IMGRes.home1),
                  fit: BoxFit.cover,
                ) ,
                borderRadius: BorderRadius.circular(AppSpacing.medium),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),

                  CustomText(property.title!,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: ColorRes.textPrimary,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),

                  CustomText("${property.address}, ${property.city}${property.state != null ? ', ${property.zipCode}' : ''}",
                    fontSize: 9,
                    fontWeight: FontWeight.w400,
                    color: ColorRes.textPrimary,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),

                  Row(
                    children: [

                      CustomText('${Formatter.formatPriceCompact(property.propertyDetails!.financialInfo!
                          .price ?? 0.0)}/ sqft',
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: ColorRes.textPrimary,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      isPositive ? Icon(Icons.arrow_upward, color: ColorRes.success, size: 16) : Icon(Icons.arrow_downward, color: ColorRes.error, size: 16),
                      const SizedBox(width: 3),

                      CustomText(rating.toString(),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: ColorRes.textPrimary,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Divider(
                    color: ColorRes.grey.withOpacity(0.5),
                    thickness: 0.4,
                    indent: 8,
                    endIndent: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: CustomText("Price Trends",
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: ColorRes.primary,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(Icons.arrow_forward_rounded, color: ColorRes.primary, size: 14),
                    ],
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


