import 'package:flutter/material.dart';
import 'package:housing_flutter_app/app/utils/dummy_data.dart';
import 'package:housing_flutter_app/modules/search_property/widget/suggested_list.dart';

import '../../buy_componet/buy_component.dart';
import '../../common_component/budget_filter.dart';
import '../../common_component/listed_by.dart';

class RentCommercialProperty extends StatefulWidget {
  const RentCommercialProperty({super.key});

  @override
  State<RentCommercialProperty> createState() => _RentCommercialPropertyState();
}

class _RentCommercialPropertyState extends State<RentCommercialProperty> {
  String saleType = "New Properties";
  String possessionType = "Ready to move";
  String selectedLeased = 'Pre-Leased';
  int selectedAvailable = 0;
  List<String> availableList = [
    'Within a week',
    'Within 15 days',
    'Within a month',
    'After a month',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildFilterHeadingPadding("Property Type"),
        const SizedBox(height: 7),
        ListedBy(listedByList: buyCommercialPropertyType),
        const SizedBox(height: 7),
        buildFilterHeadingPadding('Budget'),
        BudgetFilter(
          minValue: 0.0,
          maxValue: 20,
          values: const RangeValues(1, 20),
          onChanged: (value) {},
          minLabel: 'Min',
          maxLabel: 'Max',
          minQuantityLabel: 'L',
          maxQuantityLabel: 'Cr+',
        ),

        buildFilterHeadingPadding('Build-up Area'),
        BudgetFilter(
          minValue: 0.0,
          maxValue: 4950,
          values: const RangeValues(50, 2000),
          onChanged: (value) {},
          minLabel: 'Min',
          maxLabel: 'Max',
          minQuantityLabel: 'sqft',
          maxQuantityLabel: 'sqft+',
        ),

        buildFilterHeadingPadding("Available"),
        const SizedBox(height: 7),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(availableList.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedAvailable = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: buildFilterPropertyTypes(
                      title: availableList[index],
                      isSelected: selectedAvailable == index,
                      isExpanded: false,
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
        const SizedBox(height: 7),
        buildFilterHeadingPadding("Listed By"),

        const SizedBox(height: 7),
        ListedBy(listedByList: listedByList),
        const SizedBox(height: 7),
      ],
    );
  }
}
