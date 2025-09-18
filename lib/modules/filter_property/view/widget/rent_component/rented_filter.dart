import 'package:flutter/material.dart';

import 'package:housing_flutter_app/app/utils/dummy_data.dart';

import '../common_component/bhk_list.dart';
import '../buy_componet/buy_component.dart';
import '../common_component/budget_filter.dart';
import '../common_component/listed_by.dart';

class RentFilter extends StatelessWidget {
  const RentFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildFilterHeadingPadding('BHK Type'),
        const SizedBox(height: 7),
        BHKTypes(bHKList: bHkType),
        const SizedBox(height: 7),
        buildFilterHeadingPadding('Rent Range'),
        BudgetFilter(
          maxQuantityLabel: 'Cr+',
          minQuantityLabel: 'L',
          maxLabel: 'Max',
          minLabel: 'Min',
          minValue: 0.0,
          maxValue: 10.0,
          values: const RangeValues(1, 10),
          onChanged: (newValues) {},
        ),
        const SizedBox(height: 7),
        buildFilterHeadingPadding('Listed By'),
        const SizedBox(height: 7),
        ListedBy(listedByList: listedByList),
        const SizedBox(height: 7),
        buildFilterHeadingPadding('Furnishing Type'),
        const SizedBox(height: 7),
        ListedBy(listedByList: furnishingType),
      ],
    );
  }
}
