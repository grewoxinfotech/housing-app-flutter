import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housing_flutter_app/app/constants/app_font_sizes.dart';
import 'package:housing_flutter_app/app/constants/color_res.dart';
import 'package:housing_flutter_app/app/constants/size_manager.dart';
import 'package:housing_flutter_app/modules/filter_property/view/filter_screen.dart';

import 'package:housing_flutter_app/modules/search_property/controller/search_controller.dart';
import 'package:housing_flutter_app/modules/search_property/widget/search_result.dart';
import 'package:housing_flutter_app/modules/search_property/widget/suggested_area.dart';
import 'package:housing_flutter_app/modules/search_property/widget/suggeted_card.dart';
import 'package:housing_flutter_app/utils/global.dart';
import 'package:housing_flutter_app/widgets/input/custom_text_field.dart';

class CommonSearchField extends StatefulWidget {
  const CommonSearchField({super.key});

  @override
  State<CommonSearchField> createState() => _CommonSearchFieldState();
}

class _CommonSearchFieldState extends State<CommonSearchField> {
  final TextEditingController _searchController = TextEditingController();
  final GoogleMapController controller = Get.put(GoogleMapController());
  String popularArea = 'Mumbai';
  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      controller.fetchPredictions(_searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: buildCommonText(
          'Search in Surat',
          20,
          FontWeight.w600,
          ColorRes.black,
          1,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppPadding.medium),
              child: GestureDetector(
                onTap: () {},
                child: CustomTextField(
                  enabled: true,
                  suffixIcon: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppPadding.medium,
                    ),
                    child: Icon(Icons.search, color: Colors.black, size: 25),
                  ),
                  controller: _searchController,
                  hintText: 'Surat , Gujarat , 395010',
                ),
              ),
            ),
            AppSpacing.verticalMedium,
            Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: SizedBox.shrink());
              }

              if (_searchController.text.isNotEmpty) {
                if (controller.predictions.isEmpty) {
                  return Center(
                    child: buildCommonText(
                      'No results found',
                      AppFontSizes.medium,
                      FontWeight.w400,
                      Colors.grey.shade600,
                      1,
                    ),
                  );
                }

                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.predictions.length,
                  separatorBuilder:
                      (context, index) => Divider(
                        color: Colors.grey.shade300,
                        height: 2,
                        indent: 16,
                        endIndent: 16,
                      ),
                  itemBuilder: (context, index) {
                    final item = controller.predictions[index];
                    return InkWell(
                      onTap: () {
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   SnackBar(
                        //     content: Text("Selected: ${item.description}"),
                        //   ),
                        // );
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => RealEstateFilterScreen(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppPadding.medium,
                          vertical: AppPadding.small,
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.apartment, color: ColorRes.primary),
                            SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Main text with highlight
                                  highlightText(
                                    item.description ?? "",
                                    _searchController.text,
                                    item.structuredFormatting?.secondaryText ??
                                        '',
                                    normalStyle: const TextStyle(
                                      fontSize: AppFontSizes.bodySmall,
                                      fontWeight: FontWeight.w500,
                                      color: ColorRes.textColor,
                                    ),
                                    highlightStyle: const TextStyle(
                                      fontSize: AppFontSizes.extraSmall,
                                      fontWeight: FontWeight.bold,
                                      color: ColorRes.error,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  // Secondary text as subtitle
                                  Text(
                                    item.structuredFormatting?.secondaryText ??
                                        '',
                                    style: TextStyle(
                                      fontSize: AppFontSizes.extraSmall,
                                      fontWeight: FontWeight.w400,
                                      color:
                                          ColorRes
                                              .grey, // Optional, lighter color
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildSection("Popular Locations", propertyList),
                    buildSection("Nearby Places", propertyList),
                    AppSpacing.verticalSmall,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.small,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/change_location');
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                left: AppPadding.small,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppPadding.small,
                                vertical: AppPadding.small,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  AppRadius.small,
                                ),
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                  width: 1,
                                ),
                                color: Colors.grey.shade100,
                              ),
                              child: buildCommonText(
                                'Change Location',
                                AppFontSizes.small,
                                FontWeight.w600,
                                ColorRes.textColor,
                                1,
                              ),
                            ),
                          ),
                          AppSpacing.verticalSmall,
                          buildFilterHeadingPadding('Some Popular Cities'),
                          AppSpacing.verticalSmall,
                          CityDropdownResult(
                            initialCity: popularCities,
                            onCitySelected: (index, city) {
                              setState(() {
                                popularCities = city;
                                popularArea =
                                    popularCitiesWithAreas[city]?[0] ?? '';
                              });
                              print("Selected City: $city at index $index");
                            },
                          ),
                          AppSpacing.verticalSmall,
                          buildFilterHeadingPadding(
                            'Suggested Area ($popularCities)',
                          ),
                          AppSpacing.verticalSmall,
                          SelectableWrap(
                            items: popularCitiesWithAreas[popularCities] ?? [],
                            selectedItem: popularArea,
                            onSelected: (value) {
                              setState(() {
                                popularArea = value;
                                print("Selected Area: $value");
                              });
                            },
                          ),
                          AppSpacing.verticalSmall,
                        ],
                      ),
                    ),
                  ],
                );
              }
            }),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

Widget highlightText(
  String text,
  String secondText,
  String query, {
  TextStyle? normalStyle,
  TextStyle? highlightStyle,
}) {
  if (query.isEmpty) return Text(text, style: normalStyle);

  final lowerText = text.toLowerCase();
  final lowerQuery = query.toLowerCase();

  if (!lowerText.contains(lowerQuery)) {
    return Text(text, style: normalStyle);
  }

  final start = lowerText.indexOf(lowerQuery);
  final end = start + lowerQuery.length;

  return RichText(
    text: TextSpan(
      children: [
        TextSpan(text: text.substring(0, start), style: normalStyle),
        TextSpan(text: text.substring(end), style: normalStyle),
      ],
    ),
  );
}

/// 🔹 Reusable section widget
Widget buildSection(String title, List<Map<String, dynamic>> data) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      SizedBox(height: AppSpacing.verticalSmall.height),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.medium),
        child: buildCommonText(
          title,
          12,
          FontWeight.w600,
          ColorRes.textColor,
          1,
        ),
      ),

      SizedBox(
        height: 100,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: AppPadding.medium),
          itemCount: data.length,
          separatorBuilder: (_, __) => SizedBox(width: AppSpacing.small),
          itemBuilder: (context, index) {
            final property = data[index];
            return SuggestionCardList(
              address: property['address']['city'],
              price:
                  '${property['price_range']['min']} - ${property['price_range']['max']}',
              propertyType: property['type'],
              cardHeight: 65,
            );
          },
        ),
      ),
    ],
  );
}

Text buildCommonText(
  String title,
  double size,
  FontWeight weight,
  Color color,
  int maxLines,
) {
  return Text(
    title,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(fontSize: size, color: color, fontWeight: weight),
  );
}

Padding buildFilterHeadingPadding(String title) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    child: buildCommonText(
      '$title',
      AppFontSizes.medium,
      FontWeight.w600,
      ColorRes.textColor,
      1,
    ),
  );
}
