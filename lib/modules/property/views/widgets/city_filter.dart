import 'package:flutter/material.dart';
import 'package:housing_flutter_app/app/widgets/cards/crm_banner_card_with_text.dart';
import '../../../../app/constants/img_res.dart';

class CityFilterList extends StatefulWidget {
  const CityFilterList({super.key});

  @override
  State<CityFilterList> createState() => _CityFilterListState();
}

class _CityFilterListState extends State<CityFilterList> {
  final List<String> cities = [
    "Mumbai",
    "Delhi",
    "Bangalore",
    "Pune",
    "Chennai",
    "Kolkata",
    "Hyderabad",
  ];

  final List<String> images = [
    IMGRes.city1,
    IMGRes.city2,
    IMGRes.city3,
    IMGRes.city4,
    IMGRes.city5,
    IMGRes.city6,
    IMGRes.city7,
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: cities.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;

          return CrmBannerCardWithText(
            imageUrl: images[index],
            title: cities[index],
            height: 100,
            width: 150,
            isCenterText: true,
          );
        },
      ),
    );
  }
}

// GestureDetector(
// onTap: () {
// setState(() {
// selectedIndex = index;
// });
// },
// child: Column(
// mainAxisSize: MainAxisSize.min,
// children: [
// Container(
// decoration: BoxDecoration(
// shape: BoxShape.circle,
// border:
// isSelected
// ? Border.all(color: Colors.blueAccent, width: 3)
//     : null,
// ),
// padding: const EdgeInsets.all(2),
// child: ClipOval(
// child: Image.asset(
// images[index],
// width: 70,
// height: 70,
// fit: BoxFit.cover,
// ),
// ),
// ),
// const SizedBox(height: 8),
// Text(
// cities[index],
// style: TextStyle(
// fontSize: 14,
// fontWeight: FontWeight.w500,
// color: isSelected ? Colors.blueAccent : Colors.black87,
// ),
// ),
// ],
// ),
// );
