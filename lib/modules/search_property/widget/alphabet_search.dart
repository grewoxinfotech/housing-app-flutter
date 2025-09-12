// import 'package:flutter/material.dart';

// import 'package:housing_flutter_app/app/constants/color_res.dart';
// import 'package:housing_flutter_app/modules/search_property/view/search_screen.dart';
// import '../../../utils/global.dart';


// class CityAlphabetList extends StatefulWidget {
//   CityAlphabetList({super.key, required this.letterCity});

//   final Map<String, List<String>> letterCity;

//   @override
//   State<CityAlphabetList> createState() => _CityAlphabetListState();
// }

// class _CityAlphabetListState extends State<CityAlphabetList> {
//   @override
//   Widget build(BuildContext context) {
//     final List<AlphabetListViewItemGroup> items = widget.letterCity.entries.map(
//       (entry) {
//         return AlphabetListViewItemGroup(
//           tag: entry.key,

//           children: entry.value
//               .map<Widget>(
//                 (city) => GestureDetector(
//                   onTap: () {},
//                   child: ListTile(
//                     title: buildCommonText(city, 13, FontWeight.w600, ColorRes.textColor, 1),
//                     subtitle: buildCommonText('Gujarat', 11, FontWeight.w400, Colors.grey.shade600,1),
//                     leading: const Icon(
//                       Icons.location_city,
//                       color: Colors.blue,
//                     ),
//                   ),
//                 ),
//               )
//               .toList(),
//         );
//       },
//     ).toList();

//     return Scaffold(
//       body: AlphabetListView(
//         items: items,
//         scrollController: ScrollController(),
//         options: AlphabetListViewOptions(
//           listOptions: ListOptions(
//             stickySectionHeader: false,
//             listHeaderBuilder: (context, symbol) => Container(
//               margin: EdgeInsets.all(8.w),
//               padding: EdgeInsets.all(8.0.w),
//               decoration: BoxDecoration(
//                 color: Colors.grey.shade200,
//                 borderRadius: BorderRadius.circular(100),
//               ),
//               alignment: Alignment(-0.9, 0.0),
//               child: buildCommonText(symbol, 15, FontWeight.w500, AppTheme.textColor, 1),
//             ),
//           ),
//           scrollbarOptions: ScrollbarOptions(
//             symbolBuilder: (context, symbol, state) {
//               final isSelected = state == AlphabetScrollbarItemState.active;
//               return Container(
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: isSelected ? AppTheme.accentColor : Colors.transparent,
//                 ),
//                 alignment: Alignment.center,
//                 child: buildCommonText(symbol, 13,isSelected ? FontWeight.w800 : FontWeight.w500, isSelected ? Colors.white : Colors.black, 1),
//               );
//             },
//           ),

//           overlayOptions: OverlayOptions(
//             showOverlay: true,
//             overlayBuilder: (context, symbol) => Container(
//               alignment: Alignment.center,
//               height: 60.h,
//               width: 80.w,
//               margin: EdgeInsets.all(8.w),
//               padding: EdgeInsets.all(8.0.w),
//               decoration: BoxDecoration(
//                 color: AppTheme.accentColor.toMaterialColor.shade300,
//                 borderRadius: BorderRadius.circular(12.r),
//               ),
//               child: buildCommonText(symbol, 30, FontWeight.w500,AppTheme.textColor,1),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

