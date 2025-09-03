import 'package:flutter/material.dart';
import 'package:housing_flutter_app/app/constants/color_res.dart';
import 'package:housing_flutter_app/widgets/input/custom_text_field.dart';

class HomeHeader extends StatefulWidget {
  final String cityName;
  final List<String> propertyTypes;
  final String backgroundImage;

  const HomeHeader({
    super.key,
    this.cityName = "Surat",
    this.backgroundImage =
        "https://sitasurat.in/assets/images/about/surat-city.jpg",
    this.propertyTypes = const [
      "Apartment",
      "Villa",
      "Plot",
      "Commercial",
      "PG",
      "Shop",
      "Office",
      "Studio",
      "Warehouse",
    ],
  });

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
      child: Stack(
        children: [
          // Background Image
          // Image.network(
          //   widget.backgroundImage,
          //   width: double.infinity,
          //   height: 220,
          //   fit: BoxFit.cover,
          // ),
          // Overlay content
          Container(
            height: 220,

            padding: const EdgeInsets.symmetric(vertical: 12),
            //color: ColorRes.primary.withOpacity(1),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.2, 0.8, 1.0],
                colors: [
                  ColorRes.primary.withOpacity(0.10),
                  ColorRes.primary.withOpacity(0.15),
                  ColorRes.primary.withOpacity(0.25),
                ],
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Row: City + Post Property
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Icon(Icons.location_on, color: ColorRes.primary),
                            const SizedBox(width: 4),
                            Flexible(
                              child: Text(
                                widget.cityName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: ColorRes.primary,
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          print("Post Property tapped");
                        },
                        icon: const Icon(Icons.add, size: 18),
                        label: const Text("Post Property"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorRes.primary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 6,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                // Search Bar
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),

                  child: CustomTextField(
                    controller: TextEditingController(),
                    hintText: "Search for City, locality or property",
                    prefixIcon: Icons.search,
                    radius: 16,
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        print("Clear button pressed");
                      },
                    ),
                    onChanged: (value) {
                      print("Searching: $value");
                    },
                  ),
                ),
                const SizedBox(height: 12),
                // Property Type Tags (Scrollable horizontally, no side padding)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  //  padding: EdgeInsets.zero, // remove default scroll padding
                  child: Row(
                    children: List.generate(widget.propertyTypes.length, (
                      index,
                    ) {
                      final type = widget.propertyTypes[index];
                      final isSelected = selectedIndex == index;

                      return Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                selectedIndex = index;
                              });
                              print("Selected: $type");
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  isSelected ? Colors.white : Colors.white,
                              foregroundColor: isSelected ? ColorRes.primary : ColorRes.black,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 10,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side:
                                    isSelected
                                        ? BorderSide(
                                          color: ColorRes.primary,
                                          width: 1.5,
                                        )
                                        : BorderSide.none,
                              ),
                              minimumSize: const Size(0, 40),
                            ),
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 120),

                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Text(
                                  type,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Add spacing only between buttons
                          if (index != widget.propertyTypes.length - 1)
                            const SizedBox(width: 8),
                        ],
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
