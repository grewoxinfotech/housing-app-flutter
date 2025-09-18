import 'package:alphabet_list_view/alphabet_list_view.dart';
import 'package:flutter/material.dart';
import 'package:housing_flutter_app/app/constants/app_font_sizes.dart';

import 'package:housing_flutter_app/app/constants/color_res.dart';
import 'package:housing_flutter_app/modules/search_property/view/search_screen.dart';

class CityAlphabetList extends StatefulWidget {
  const CityAlphabetList({super.key, required this.letterCity});

  final Map<String, List<String>> letterCity;

  @override
  State<CityAlphabetList> createState() => _CityAlphabetListState();
}

class _CityAlphabetListState extends State<CityAlphabetList> {
  @override
  Widget build(BuildContext context) {
    final List<AlphabetListViewItemGroup> items =
        widget.letterCity.entries.map((entry) {
          return AlphabetListViewItemGroup(
            tag: entry.key,

            children:
                entry.value
                    .map<Widget>(
                      (city) => GestureDetector(
                        onTap: () {},
                        child: ListTile(
                          title: buildCommonText(
                            city,
                            13,
                            FontWeight.w600,
                            ColorRes.textColor,
                            1,
                          ),
                          subtitle: buildCommonText(
                            'Gujarat',
                            11,
                            FontWeight.w400,
                            Colors.grey.shade600,
                            1,
                          ),
                          leading: const Icon(
                            Icons.location_city,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    )
                    .toList(),
          );
        }).toList();

    return Scaffold(
      body: AlphabetListView(
        items: items,
        scrollController: ScrollController(),
        options: AlphabetListViewOptions(
          listOptions: ListOptions(
            stickySectionHeader: false,
            listHeaderBuilder:
                (context, symbol) => Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  alignment: const Alignment(-0.9, 0.0),
                  child: buildCommonText(
                    symbol,
                    15,
                    FontWeight.w500,
                    ColorRes.textColor,
                    1,
                  ),
                ),
          ),
          scrollbarOptions: ScrollbarOptions(
            symbolBuilder: (context, symbol, state) {
              final isSelected = state == AlphabetScrollbarItemState.active;
              return Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? ColorRes.primary : Colors.transparent,
                ),
                alignment: Alignment.center,
                child: buildCommonText(
                  symbol,
                  isSelected ? AppFontSizes.medium : 12,
                  isSelected ? AppFontWeights.semiBold : FontWeight.w400,
                  isSelected ? Colors.white : ColorRes.grey,
                  1,
                ),
              );
            },
          ),

          overlayOptions: OverlayOptions(
            showOverlay: true,
            overlayBuilder:
                (context, symbol) => Container(
                  alignment: Alignment.center,
                  height: 80,
                  width: 80,
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: ColorRes.primary.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: buildCommonText(
                    symbol,
                    30,
                    FontWeight.w500,
                    ColorRes.textColor,
                    1,
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
