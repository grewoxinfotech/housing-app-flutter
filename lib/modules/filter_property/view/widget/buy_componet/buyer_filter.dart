import 'package:flutter/material.dart';

import 'package:housing_flutter_app/app/utils/dummy_data.dart';

import '../common_component/bhk_list.dart';
import '../common_component/budget_filter.dart';
import '../common_component/listed_by.dart';
import 'buy_component.dart';

class BuyFilters extends StatefulWidget {
  const BuyFilters({super.key});

  @override
  State<BuyFilters> createState() => _BuyFiltersState();
}

class _BuyFiltersState extends State<BuyFilters> {
  List<String> bHKList = [];
  double min = 0.0;
  double max = 20.0;
  RangeValues rangeValues = const RangeValues(2, 10);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildFilterHeadingPadding('Budget Range'),

        BudgetFilter(
          maxQuantityLabel: 'Cr+',
          minQuantityLabel: 'L',
          maxLabel: 'Max',
          minLabel: 'Min',
          minValue: min,
          maxValue: max,
          values: rangeValues,
          onChanged: (newValues) {
            setState(() {
              rangeValues = newValues;
            });
          },
        ),
        SizedBox(height: 7),

        buildFilterHeadingPadding('BHK Type'),
        SizedBox(height: 7),
        BHKTypes(
          bHKList: bHkType,
          onSelectionChanged: (index) {
            print(index);
          },
        ),
        SizedBox(height: 7),

        buildFilterHeadingPadding('Property Types'),
        SizedBox(height: 7),
        FilterPropertyTypesList(
          items: propertyTypesList,
          onSelectionChanged: (index) {
            setState(() {});
          },
        ),
        SizedBox(height: 7),

        buildFilterHeadingPadding('Listed By'),
        SizedBox(height: 7),
        ListedBy(
          listedByList: listedByList,
          onTap: (index) {
            setState(() {});
          },
        ),
        SizedBox(height: 7),

        buildFilterHeadingPadding('Construction Status'),
        SizedBox(height: 7),
        ListedBy(
          listedByList: constructionStatus,
          onTap: (index) {
            setState(() {});
          },
        ),
      ],
    );
  }
}
