import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:housing_flutter_app/app/constants/size_manager.dart';
import '../../../../app/constants/color_res.dart';

import 'package:flutter/material.dart';
import '../../../../app/constants/color_res.dart';

class PropertyTypeFilterTagList extends StatefulWidget {
  const PropertyTypeFilterTagList({super.key});

  @override
  State<PropertyTypeFilterTagList> createState() =>
      _PropertyTypeFilterTagListState();
}

class _PropertyTypeFilterTagListState extends State<PropertyTypeFilterTagList> {
  final List<String> tags = [
    "Rent",
    "Buy",
    "Sell",
    "Lease",
    "Commercial",
    "Residential",
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: tags.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;
          return ChoiceChip(
            checkmarkColor: Colors.white,
            shape: StadiumBorder(
              side: BorderSide(
                color:
                    isSelected
                        ? ColorRes.primary
                        : Colors.grey.shade300, // gray border when not selected
              ),
            ),
            label: Text(
              tags[index],
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            selected: isSelected,
            selectedColor: ColorRes.primary,
            backgroundColor: Colors.grey[200],
            onSelected: (bool selected) {
              setState(() {
                selectedIndex = index;
              });
            },
          );
        },
      ),
    );
  }
}

class FilterTagList extends StatefulWidget {
  const FilterTagList({Key? key}) : super(key: key);

  @override
  State<FilterTagList> createState() => _FilterTagListState();
}

class _FilterTagListState extends State<FilterTagList> {
  final List<String> tags = ["Buy", "Rent", "Sell", "PG", "Contractor"];
  final List<Color> bgColor = [
    Color(0xFFDBEAFE),
    Color(0xFFDCFCE7),
    Color(0xFFF3E8FF),
    Color(0xFFFFEDD5),
  ];
  final List<IconData> icon = [
    Icons.home,
    Icons.key,
    Icons.handshake,
    Icons.bed,
    Icons.home_repair_service_rounded,
  ];
  final List<Color> txtColor = [
    Color(0xFF2563EB),
    Color(0xFF16A34A),
    Color(0xFF9333EA),
    Color(0xFFEA580C),
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,

      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: tags.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;
          return Container(
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadius.medium),
              color: bgColor[index % 4],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon[index], color: txtColor[index % 4], size: 30),
                SizedBox(height: 6),
                Text(
                  tags[index],
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: txtColor[index % 4],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          );
          // return ChoiceChip(
          //   checkmarkColor: ColorRes.white,
          //   label: Text(
          //     tags[index],
          //     style: TextStyle(
          //       color: isSelected ? Colors.white : Colors.black,
          //       fontWeight: FontWeight.w500,
          //     ),
          //   ),
          //   selected: isSelected,
          //   selectedColor: ColorRes.primary,
          //   backgroundColor: Colors.grey[200],
          //   onSelected: (bool selected) {
          //     setState(() {
          //       selectedIndex = index;
          //     });
          //   },
          // );
        },
      ),
    );
  }
}
