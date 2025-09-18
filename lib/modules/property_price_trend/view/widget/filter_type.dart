import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housing_flutter_app/app/constants/color_res.dart';
import 'package:housing_flutter_app/modules/property_price_trend/controller/price_trend_controller.dart';
import 'package:housing_flutter_app/modules/property_price_trend/view/property_price_trend.dart';
import 'package:housing_flutter_app/modules/search_property/view/search_screen.dart';


SizedBox buildFilter(BuildContext context) {
  final controller = Get.find<PriceTrendController>();

  final propertyTypes = [
    'Apartment',
    'Independent House',
    'Independent Floor',
    'Villa',
  ];

  return SizedBox(
    height: 600,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            buildHeading('Show the price trends'),
            Row(
              children: [
                Expanded(
                  child: Obx(
                    () => RadioListTile<FilterType>(
                      value: FilterType.Locality,
                      groupValue: controller.selectedFilter.value,
                      activeColor: ColorRes.primary,
                      onChanged: (val) {
                        if (val != null) {
                          controller.getFilterValue(val);
                        }
                      },
                      title: buildCommonText(
                        'Locality',
                        12,
                        FontWeight.w500,
                        ColorRes.textColor,
                        1,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Obx(
                    () => RadioListTile<FilterType>(
                      value: FilterType.Projects,
                      groupValue: controller.selectedFilter.value,
                      activeColor: ColorRes.primary,
                      onChanged: (val) {
                        if (val != null) {
                          controller.getFilterValue(val);
                        }
                      },
                      title: buildCommonText(
                        'Project',
                        12,
                        FontWeight.w500,
                        ColorRes.textColor,
                        1,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            buildHeading('Property types'),
            const SizedBox(height: 10),
            Obx(
              () => Wrap(
                spacing: 10,
                runSpacing: 10,
                children:
                    propertyTypes.map((type) {
                      final isSelected = controller.propertyType.value == type;
                      return GestureDetector(
                        onTap: () {
                          controller.getPropertyType(type);
                        },
                        child: buildFilterPropertyTypes(
                          title: type,
                          isSelected: isSelected,
                          isExpanded: false,
                        ),
                      );
                    }).toList(),
              ),
            ),

            const SizedBox(height: 10),

            /// Duration Slider
            buildHeading('Duration'),
            const SizedBox(height: 5),
            Obx(
              () => Slider(
                min: 1,
                max: 5,
                activeColor: ColorRes.primary,
                value: controller.currentDiscreteSliderValue.value,
                label:
                    controller.currentDiscreteSliderValue.value
                        .round()
                        .toString(),
                onChanged: (double value) {
                  controller.getSliderValue(value);
                },
              ),
            ),
            const SizedBox(height: 5),
            Obx(
              () => buildCommonText(
                "Selected: ${controller.currentDiscreteSliderValue.value.round()} years",
                16,
                FontWeight.w500,
                  ColorRes.primary,
                1,
              ),
            ),

            const SizedBox(height: 10),

            /// Apply Button
            GestureDetector(
              onTap: () {
                controller.getAllFilter(
                  locality:
                      controller.selectedFilter.value == FilterType.Locality
                          ? 'Locality'
                          : 'Project',
                  property: controller.propertyType.value,
                  year: controller.currentDiscreteSliderValue.value,
                );
                Navigator.pop(context);
              },
              child: Container(
                height: 35,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: ColorRes.primary,
                ),
                alignment: Alignment.center,
                child: buildCommonText(
                  'Filter Apply',
                  13,
                  FontWeight.w600,
                  Colors.white,
                  1,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    ),
  );
}

Widget buildHeading(String title) {
  return buildCommonText(title, 15, FontWeight.w600, ColorRes.textColor, 1);
}

Widget buildFilterPropertyTypes({
  required String title,
  required bool isSelected,
  required bool isExpanded,
  double height = 30,
  double width = 100,
  double paddingHorizontal = 10,
  double paddingVertical = 8,
}) {
  return isExpanded
      ? Container(
        height: height,
        width: width,
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
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: buildCommonText(
          title,
          11,
          FontWeight.w500,
          isSelected ? Colors.white : ColorRes.textColor,
          1,
        ),
      )
      : Container(
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
          borderRadius: BorderRadius.circular(10),
        ),
        child: buildCommonText(
          title,
          11,
          FontWeight.w500,
          isSelected ? Colors.white : ColorRes.textColor,
          1,
        ),
      );
}
