import 'package:flutter/material.dart';

import 'package:housing_flutter_app/modules/search_property/widget/suggested_list.dart';

class ListedBy extends StatefulWidget {
  const ListedBy({super.key, required this.listedByList, this.onTap});

  final List<String> listedByList;
  final Function(List<String> items)? onTap;

  @override
  State<ListedBy> createState() => _ListedByState();
}

class _ListedByState extends State<ListedBy> {
  List<String> selectedItems = [];

  void toggleSelection(int index) {
    String value = widget.listedByList[index];

    setState(() {
      if (value == "All") {
        if (selectedItems.length == widget.listedByList.length) {
          selectedItems.clear();
        } else {
          selectedItems.clear();
          selectedItems.addAll(widget.listedByList);
        }
      } else {
        if (selectedItems.contains(value)) {
          selectedItems.remove(value);
        } else {
          selectedItems.add(value);
        }
        if (selectedItems.length != widget.listedByList.length &&
            selectedItems.contains("All")) {
          selectedItems.remove("All");
        }
        if (selectedItems.length == widget.listedByList.length - 1 &&
            !selectedItems.contains("All")) {
          selectedItems.add("All");
        }
      }
    });

    widget.onTap?.call(selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: EdgeInsets.only(right: 10),
        itemCount: widget.listedByList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => toggleSelection(index),
            child: Padding(
              padding: EdgeInsets.only(left: 8),
              child: buildFilterPropertyTypes(
                title: widget.listedByList[index],
                isSelected: selectedItems.contains(widget.listedByList[index]),
                isExpanded: false,
                paddingHorizontal: 20,
              ),
            ),
          );
        },
      ),
    );
  }
}
