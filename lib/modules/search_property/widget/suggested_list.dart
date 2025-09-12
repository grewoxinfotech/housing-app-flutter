import 'package:flutter/material.dart';
import 'package:housing_flutter_app/app/constants/app_font_sizes.dart';
import 'package:housing_flutter_app/app/constants/color_res.dart';
import 'package:housing_flutter_app/app/constants/size_manager.dart';
import 'package:housing_flutter_app/modules/search_property/view/search_screen.dart';

Widget buildFilterPropertyTypes({
  required String title,
  required bool isSelected,
  required bool isExpanded,
  double height = AppSpacing.medium,
  double width = AppSpacing.large,
  double paddingHorizontal = AppPadding.medium,
  double paddingVertical = AppPadding.small,
}) {
  if (isExpanded) {
    return Container(
      // height: height,
      // width: width,
      padding: EdgeInsets.symmetric(
        horizontal: paddingHorizontal,
        vertical: paddingVertical,
      ),
      decoration: BoxDecoration(
        border:
            isSelected
                ? null
                : Border.all(color: Colors.grey.shade300, width: 1),
        color: isSelected ? ColorRes.primary : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(AppRadius.small),
      ),
      alignment: Alignment.center,
      child: buildCommonText(
        title,
        AppFontSizes.small,
        AppFontWeights.medium,
        isSelected ? Colors.white : ColorRes.textColor,
        1,
      ),
    );
  } else {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: paddingHorizontal,
        vertical: paddingVertical,
      ),
      decoration: BoxDecoration(
        border:
            isSelected
                ? null
                : Border.all(color: Colors.grey.shade300, width: 1),
        color: isSelected ? ColorRes.primary : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(AppRadius.small),
      ),
      child: buildCommonText(
        title,
        AppFontSizes.small,
        AppFontWeights.medium,
        isSelected ? Colors.white : ColorRes.textColor,
        1,
      ),
    );
  }
}
