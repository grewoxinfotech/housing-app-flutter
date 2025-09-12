import 'package:flutter/material.dart';
import 'package:housing_flutter_app/app/utils/dummy_data.dart';
import 'package:housing_flutter_app/modules/filter_property/view/widget/commercial_property_filter/component/buy_commercial.dart';
import 'package:housing_flutter_app/modules/search_property/view/search_screen.dart';
import 'package:housing_flutter_app/modules/search_property/widget/suggested_list.dart';

import 'component/rent_commercial_property.dart';

class CommercialPropertyFilter extends StatefulWidget {
  const CommercialPropertyFilter({super.key});

  @override
  State<CommercialPropertyFilter> createState() =>
      _CommercialPropertyFilterState();
}

class _CommercialPropertyFilterState extends State<CommercialPropertyFilter> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildFilterHeadingPadding('Sub category'),
        SizedBox(height: 7),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(subCategory.length, (index) {
              return Padding(
                padding: EdgeInsets.only(left: 10),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: buildFilterPropertyTypes(
                    title: propertyType[index],
                    isSelected: selectedIndex == index,
                    isExpanded: true,
                  ),
                ),
              );
            }),
          ),
        ),
        SizedBox(height: 7),
        SingleChildScrollView(
          child: Column(
            children: [
              if (subCategory[selectedIndex] == 'Buy') ...[
                BuyCommercial(),
              ] else ...[
                RentCommercialProperty(),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
