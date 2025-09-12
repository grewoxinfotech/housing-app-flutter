import 'package:flutter/material.dart';
import 'package:housing_flutter_app/modules/search_property/widget/suggested_list.dart';

class BHKTypes extends StatefulWidget {
  const BHKTypes({super.key, required this.bHKList, this.onSelectionChanged});

  final List<String> bHKList;
  final Function(List<String> selectedItems)? onSelectionChanged;

  @override
  State<BHKTypes> createState() => _BHKTypesState();
}

class _BHKTypesState extends State<BHKTypes> {
  List<String> selectedItems = [];

  void toggleSelection(int index) {
    String value = widget.bHKList[index];

    setState(() {
      if (value == "All") {
        if (selectedItems.length == widget.bHKList.length) {
          selectedItems.clear();
        } else {
          selectedItems.clear();
          selectedItems.addAll(widget.bHKList);
        }
      } else {
        if (selectedItems.contains(value)) {
          selectedItems.remove(value);
        } else {
          selectedItems.add(value);
        }
        if (selectedItems.length != widget.bHKList.length &&
            selectedItems.contains("All")) {
          selectedItems.remove("All");
        }
        if (selectedItems.length == widget.bHKList.length - 1 &&
            !selectedItems.contains("All")) {
          selectedItems.add("All");
        }
      }
    });
    widget.onSelectionChanged?.call(selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: 8),
      child: Row(
        children: List.generate(
          widget.bHKList.length,
          (index) => Padding(
            padding: EdgeInsets.only(right: 8),
            child: GestureDetector(
              onTap: () => toggleSelection(index),
              child: buildFilterPropertyTypes(
                title: widget.bHKList[index],
                isSelected: selectedItems.contains(widget.bHKList[index]),
                isExpanded: true,
                width: 80,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
