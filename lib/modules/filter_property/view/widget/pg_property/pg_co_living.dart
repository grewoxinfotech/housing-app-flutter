import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:housing_flutter_app/app/constants/color_res.dart';
import 'package:housing_flutter_app/app/constants/size_manager.dart';
import 'package:housing_flutter_app/app/utils/dummy_data.dart';
import 'package:housing_flutter_app/modules/filter_property/view/widget/buy_componet/buy_component.dart';
import 'package:housing_flutter_app/modules/search_property/view/search_screen.dart'
    hide buildFilterHeadingPadding;

import '../common_component/budget_filter.dart';
import '../common_component/sale_type.dart';

class PgCoLiving extends StatefulWidget {
  const PgCoLiving({super.key});

  @override
  State<PgCoLiving> createState() => _PgCoLivingState();
}

class _PgCoLivingState extends State<PgCoLiving> {
  String selectedGender = 'Male';
  String selectedFoodAvailable = 'Yes';
  final List<dynamic> itemList = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildFilterHeadingPadding('Gender'),
        SizedBox(height: 7),
        SelectableWrap(
          items: genderList,
          selectedItem: selectedGender,
          onSelected: (value) {
            setState(() {
              selectedGender = value;
            });
          },
          isExpanded: false,
        ),
        SizedBox(height: 7),
        buildFilterHeadingPadding('Room Type'),
        SizedBox(height: 7),
        FilterPropertyTypesList(
          items: roomTypeList,
          onSelectionChanged: (index) {},
        ),
        SizedBox(height: 7),
        buildFilterHeadingPadding('Budget'),
        // SizedBox(height: 7),
        BudgetFilter(
          minValue: 0.0,
          maxValue: 20,
          values: RangeValues(5, 15),
          onChanged: (value) {},
          minLabel: "Min",
          maxLabel: "Max",
          minQuantityLabel: "L",
          maxQuantityLabel: "Cr+",
        ),
        buildFilterHeadingPadding('Food available'),
        SizedBox(height: 7),
        SelectableWrap(
          items: foodAvailable,
          selectedItem: selectedFoodAvailable,
          onSelected: (value) {
            setState(() {
              selectedFoodAvailable = value;
            });
          },
          isExpanded: false,
        ),
        SizedBox(height: 7),
        buildFilterHeadingPadding('Brand'),
        SizedBox(height: 7),
        SizedBox(
          height: 35,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(right: 8),
            shrinkWrap: true,
            itemCount: builderList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  String value = builderList[index]['title'];
                  setState(() {
                    if (value == "All") {
                      if (itemList.length == builderList.length) {
                        itemList.clear();
                      } else {
                        itemList.clear();
                        itemList.addAll(builderList);
                      }
                    } else {
                      if (itemList.contains(value)) {
                        itemList.remove(value);
                      } else {
                        itemList.add(value);
                      }
                      if (itemList.length != builderList.length &&
                          itemList.contains("All")) {
                        itemList.remove("All");
                      }
                      if (itemList.length == builderList.length - 1 &&
                          !itemList.contains("All")) {
                        itemList.add("All");
                      }
                    }
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300, width: 1),
                      color:
                          itemList.contains(builderList[index]['title'])
                              ? ColorRes.primary
                              : Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(AppRadius.small),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Image.asset(
                          builderList[index]['image'],
                          height: 20,
                          width: 20,
                        ),
                        SizedBox(width: 5),

                        buildCommonText(
                          builderList[index]['title'],
                          11,
                          FontWeight.w500,
                          itemList.contains(builderList[index]['title'])
                              ? Colors.white
                              : ColorRes.textColor,
                          1,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
