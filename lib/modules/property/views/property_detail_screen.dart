import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housing_flutter_app/app/constants/color_res.dart';
import 'package:housing_flutter_app/app/constants/img_res.dart';
import 'package:housing_flutter_app/app/constants/size_manager.dart';
import 'package:housing_flutter_app/app/manager/icon_manager.dart';
import 'package:housing_flutter_app/app/manager/string_manager.dart';
import 'package:housing_flutter_app/app/widgets/video_player/custom_video_player.dart';
import 'package:housing_flutter_app/widgets/button/button.dart';
import 'package:video_player/video_player.dart';
import '../../../app/manager/property_detail_manager.dart';
import '../../../app/manager/property_highlight_manager.dart';
import '../../../app/widgets/texts/headline_text.dart';
import '../../../data/network/property/models/property_model.dart';

class PropertyDetailScreen extends StatelessWidget {
  final Items? property;

  const PropertyDetailScreen({super.key, this.property});

  @override
  Widget build(BuildContext context) {
    print("[DEBUG]=> Property : ${property?.toJson()}");
    return Scaffold(
      backgroundColor: ColorRes.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: kBottomNavigationBarHeight),

          // prevents overlap
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildMediaBanner(property?.propertyMedia ?? PropertyMedia()),
              _buildTitleSection(property ?? Items()),
              Divider(indent: 18, endIndent: 18, color: Colors.grey.shade300),

              SizedBox(height: 12),
              TitleWithViewAll(title: 'Facilities'),
              SizedBox(height: 18),
              Facilities(property: property ?? Items()),
              SizedBox(height: 6),
              Divider(indent: 18, endIndent: 18, color: Colors.grey.shade300),

              SizedBox(height: 12),
              TitleWithViewAll(title: 'Property Details'),
              SizedBox(height: 12),
              Details(property: property!),
              SizedBox(height: 12),
              Divider(indent: 18, endIndent: 18, color: Colors.grey.shade300),

              if (property?.propertyDetails?.amenities != null) ...[
                SizedBox(height: 12),
                TitleWithViewAll(title: 'Amenities'),
                SizedBox(height: 8),
                AmenitiesSection(
                  amenities: property!.propertyDetails!.amenities ?? [],
                ),
                SizedBox(height: 8),
                Divider(indent: 18, endIndent: 18, color: Colors.grey.shade300),
              ],

              if (property?.propertyDescription != null) ...[
                SizedBox(height: 12),
                TitleWithViewAll(title: 'Description'),
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    property?.propertyDescription ?? '-',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                SizedBox(height: 12),
                Divider(indent: 18, endIndent: 18, color: Colors.grey.shade300),
              ],

              SizedBox(height: 12),
              TitleWithViewAll(title: 'Location'),
              SizedBox(height: 12),
              AddressAndMapDetails(property: property!),
              SizedBox(height: 12),
              Divider(indent: 18, endIndent: 18, color: Colors.grey.shade300),

              SizedBox(height: 8),
              TitleWithViewAll(title: 'Nearby Locations'),
              SizedBox(height: 12),
              if (property?.nearbyLocations != null)
                NearbyPropertyDetails(
                  nearbyLocations: property?.nearbyLocations ?? [],
                ),
              SizedBox(height: 12),
              Divider(indent: 18, endIndent: 18, color: Colors.grey.shade300),

              SizedBox(height: 12),
              TitleWithViewAll(title: 'Owner Details'),
              SizedBox(height: 12),
              OwnerInformation(property: property!),
              //SizedBox(height: 12),
              //const SizedBox(height: 12), // Extra spacing at bottom
            ],
          ),
        ),
      ),
      bottomNavigationBar: PropertyBottomBar(
        price: '₹ ${property?.propertyDetails?.financialInfo?.price ?? '0'}',
        onCallOwner: () {},
        onScheduleVisit: () {},
      ),
    );
  }

  // Widget _buildImageBanner(PropertyMedia media) {
  //   final PageController _pageController = PageController();
  //   final images = media.images ?? [];
  //   // final List<String> images = [
  //   //   IMGRes.home1,
  //   //   IMGRes.home2,
  //   //   IMGRes.home3,
  //   //   IMGRes.home4,
  //   //   IMGRes.home4,
  //   //   IMGRes.home4,
  //   // ];
  //
  //   int currentPage = 0;
  //
  //   return SafeArea(
  //     // top: true, // ensures it stays below status bar
  //     child: StatefulBuilder(
  //       builder: (context, setState) {
  //         return Stack(
  //           children: [
  //             SizedBox(
  //               height: 350,
  //               width: double.infinity,
  //               child: PageView.builder(
  //                 controller: _pageController,
  //                 itemCount: images.length,
  //                 onPageChanged: (index) {
  //                   setState(() {
  //                     currentPage = index;
  //                   });
  //                 },
  //                 itemBuilder: (context, index) {
  //                   return Image.network(
  //                     images[index],
  //                     fit: BoxFit.cover,
  //                     width: double.infinity,
  //                   );
  //                 },
  //               ),
  //             ),
  //             // Back button
  //             Positioned(
  //               top: 16,
  //               left: 16,
  //               child: CircularIcon(
  //                 icon: Icons.arrow_back_rounded,
  //                 backgroundColor: Colors.white, // set background color
  //                 onPressed: () => Get.back(),
  //               ),
  //             ),
  //             // Right side icons
  //             Positioned(
  //               top: 16,
  //               right: 16,
  //               child: Row(
  //                 children: [
  //                   CircularIcon(
  //                     icon: Icons.favorite_border_rounded,
  //                     backgroundColor: Colors.white,
  //                     onPressed: () {},
  //                   ),
  //                   const SizedBox(width: 12),
  //                   CircularIcon(
  //                     icon: Icons.share_outlined,
  //                     onPressed: () {},
  //                     backgroundColor: Colors.white,
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             // Page indicator
  //             Positioned(
  //               bottom: 16,
  //               right: 16,
  //               child: Container(
  //                 padding: const EdgeInsets.symmetric(
  //                   horizontal: 8,
  //                   vertical: 4,
  //                 ),
  //                 decoration: BoxDecoration(
  //                   color: Colors.black54,
  //                   borderRadius: BorderRadius.circular(AppRadius.small),
  //                 ),
  //                 child: Text(
  //                   '${currentPage + 1}/${images.length}',
  //                   style: const TextStyle(
  //                     color: Colors.white,
  //                     fontSize: 12,
  //                     fontWeight: FontWeight.w600,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         );
  //       },
  //     ),
  //   );
  // }

  Widget _buildMediaBanner(PropertyMedia media) {
    final PageController _pageController = PageController();
    final images = media.images ?? [];
    final videos = media.videos ?? []; // Add videos list
    final List<Map<String, String>> mediaList = [
      ...images.map((e) => {"type": "image", "url": e}),
      ...videos.map((e) => {"type": "video", "url": e}),
    ];

    int currentPage = 0;

    return SafeArea(
      child: StatefulBuilder(
        builder: (context, setState) {
          return Stack(
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: mediaList.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final item = mediaList[index];
                    if (item["type"] == "image") {
                      return Image.network(
                        item["url"]!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      );
                    } else if (item["type"] == "video") {
                      return CustomVideoPlayer(url: item["url"]!);
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
              // Back button
              Positioned(
                top: 16,
                left: 16,
                child: CircularIcon(
                  icon: Icons.arrow_back_rounded,
                  backgroundColor: Colors.white,
                  onPressed: () => Get.back(),
                ),
              ),
              // Right side icons
              Positioned(
                top: 16,
                right: 16,
                child: Row(
                  children: [
                    CircularIcon(
                      icon: Icons.favorite_border_rounded,
                      backgroundColor: Colors.white,
                      onPressed: () {},
                    ),
                    const SizedBox(width: 12),
                    CircularIcon(
                      icon: Icons.share_outlined,
                      onPressed: () {},
                      backgroundColor: Colors.white,
                    ),
                  ],
                ),
              ),
              // Page indicator
              Positioned(
                bottom: 16,
                right: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '${currentPage + 1}/${mediaList.length}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  /// Inline video player builder
  Widget _buildVideoPlayer(String url) {
    final VideoPlayerController _videoController =
        VideoPlayerController.network(url);

    return FutureBuilder(
      future: _videoController.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          _videoController.setLooping(true);
          _videoController.play();
          return AspectRatio(
            aspectRatio: _videoController.value.aspectRatio,
            child: VideoPlayer(_videoController),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _buildTitleSection(Items property) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title + ⭐ Rating Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              // Title
              Expanded(
                child: Text(
                  property.title ?? "-",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: ColorRes.textPrimary,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              const SizedBox(width: 8),

              // ⭐ Rating
              Row(
                children: [
                  Icon(Icons.star, size: 16, color: Colors.amber),
                  const SizedBox(width: 4),
                  Text(
                    "4.5",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 4),

          // 📍 Location Row (icon aligned with title start)
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.location_on_rounded, size: 16, color: Colors.grey[600]),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  '${property.city ?? '-'}, ${property.state ?? "-"}',
                  style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),

          const SizedBox(height: 4),

          // Type + See on Map Row
          Row(
            children: [
              // Type Chip
              if (property.listingType != null)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: ColorRes.primary.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(AppRadius.small),
                  ),
                  child: Text(
                    property.listingType!.toUpperCase(),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: ColorRes.primary,
                    ),
                  ),
                ),

              const Spacer(),

              // See on Map Button
              GestureDetector(
                onTap: () {
                  // TODO: Add map navigation logic
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: ColorRes.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppRadius.small),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.location_pin,
                        size: 16,
                        color: ColorRes.primary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "See on Map",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: ColorRes.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPriceAndType() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          const Text(
            "₹8.9 Cr",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(width: 16),
          Chip(
            label: const Text("Sell - apartment"),
            backgroundColor: Colors.orange.shade50,
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureChips() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Wrap(
        spacing: 12,
        runSpacing: 8,
        children: const [
          Chip(label: Text("4 BHK")),
          Chip(label: Text("5 Bath")),
          Chip(label: Text("2 Balcony")),
          Chip(label: Text("Floor: 34/34")),
          Chip(label: Text("Area: 3900 sqft")),
          Chip(label: Text("Facing: West")),
        ],
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(content),
        ],
      ),
    );
  }

  Widget _buildAmenitiesSection() {
    final List<String> amenities = [
      "Infinity Pool",
      "Sky Lounge",
      "24x7 Concierge",
      "Private Elevator",
      "Smart Lighting",
      "Solar Panels",
    ];
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Amenities",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 12,
            runSpacing: 8,
            children: amenities.map((e) => Chip(label: Text(e))).toList(),
          ),
        ],
      ),
    );
  }
}

class CircularIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final Color? backgroundColor; // add this
  final Color? iconColor; // add this

  const CircularIcon({
    super.key,
    required this.icon,
    this.onPressed,
    this.backgroundColor, // add this
    this.iconColor, // add this
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: backgroundColor ?? Colors.grey.shade300, // fallback
        ),
        child: Icon(icon, color: iconColor ?? Colors.black),
      ),
    );
  }
}

class PropertyBottomBar extends StatelessWidget {
  final String price;
  final VoidCallback onCallOwner;
  final VoidCallback onScheduleVisit;

  const PropertyBottomBar({
    super.key,
    required this.price,
    required this.onCallOwner,
    required this.onScheduleVisit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                price,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'See Pricing in Detail',
                  style: TextStyle(
                    fontSize: 10,
                    color: ColorRes.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 140,
                child: NesticoPeButton(
                  onTap: onCallOwner,
                  title: "View Contact",
                ),
              ),
              SizedBox(width: 6),
              SizedBox(
                width: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFDBEAFE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppRadius.medium,
                      ), // Adjust for more/less curve
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ), // Optional: for better touch target
                  ),
                  child: const Icon(Icons.phone_outlined),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// class Facilities extends StatelessWidget {
//   Facilities({super.key});
//
//   final List<String> labels = [
//     'Fully furnished',
//     '1650 Sq ft',
//     'Floor 6/8',
//     '3 to 5 years old',
//     'For Male, Family, Female',
//   ];
//   final List<IconData> icons = [
//     Icons.bed,
//     Icons.zoom_out_map_outlined,
//     Icons.layers_outlined,
//     Icons.date_range,
//     Icons.person,
//   ];
//
//   final Color bgColor = Color(0xFFDBEAFE); // Single background color
//   final Color txtColor = Color(0xFF2563EB); // Single text/icon color
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       child: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: List.generate(labels.length, (index) {
//             return Padding(
//               padding: const EdgeInsets.only(right: 12),
//               child: FacilitiesCard(
//                 label: labels[index],
//                 icon: icons[index],
//                 bgColor: bgColor,
//                 foreColor: txtColor,
//               ),
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }

class Facilities extends StatelessWidget {
  final Items property;
  final Color bgColor;
  final Color txtColor;

  Facilities({
    super.key,
    required this.property,
    this.bgColor = const Color(0xFFDBEAFE),
    this.txtColor = const Color(0xFF2563EB),
  });

  // Map detail keys to icons
  final Map<String, IconData> iconMap = {
    "BHK": Icons.bed,
    "Furnishing": Icons.chair_alt,
    "Built-up Area": Icons.zoom_out_map_outlined,
    "Carpet Area": Icons.square_foot,
    "Floor": Icons.layers_outlined,
    "Age of Property": Icons.date_range,
    "Rent": Icons.attach_money,
    "Price": Icons.price_change,
    "Possession": Icons.home_work,
    "Amenities": Icons.checklist_rtl,
    "Parking": Icons.local_parking,
    "Facing": Icons.explore,
    "Condition": Icons.handyman,
    // Add more mappings if needed
  };

  @override
  Widget build(BuildContext context) {
    final highlights = PropertyHighlightManager(property).getHighlights();

    return SizedBox(
      height: 100,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children:
          highlights.map((item) {
            final key = item.keys.first;
            final value = item.values.first;
            final icon = iconMap[key] ?? Icons.info_outline;

            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: FacilitiesCard(
                label: "$value",
                icon: icon,
                bgColor: bgColor,
                foreColor: txtColor,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class FacilitiesCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color bgColor;
  final Color foreColor;

  const FacilitiesCard({
    Key? key,
    required this.label,
    required this.icon,
    required this.bgColor,
    required this.foreColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 1),
        borderRadius: BorderRadius.circular(12), // Rounded like screenshot
        color: Colors.white, // Background white
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16,
            color: Colors.grey.shade800, // Dark grey icons
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade800, // Dark grey text
            ),
          ),
        ],
      ),
    );
  }
}

// Example of FacilitiesCard widget
// class FacilitiesCard extends StatelessWidget {
//   final String label;
//   final IconData icon;
//   final Color bgColor;
//   final Color foreColor;
//
//   const FacilitiesCard({
//     super.key,
//     required this.label,
//     required this.icon,
//     required this.bgColor,
//     required this.foreColor,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//       decoration: BoxDecoration(
//         color: bgColor,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(
//         children: [
//           Icon(icon, color: foreColor, size: 20),
//           const SizedBox(width: 6),
//           Text(
//             label,
//             style: TextStyle(
//               color: foreColor,
//               fontWeight: FontWeight.w600,
//               fontSize: 12,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



// class Details extends StatelessWidget {
//   Details({super.key});
//
//   final List<String> title = [
//     "Age of the Property",
//     "BHK Types",
//     "Furnished Types",
//     "Built-up Area",
//     "Floors",
//     "Notice Period",
//   ];
//
//   final List<String> data = [
//     "3 to 5 years old",
//     "3 BHK",
//     "Fully Furnished",
//     "1,650 Sq.ft.",
//     "6 of 8",
//     "1 month",
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
//       // disable scroll if inside another scroll
//       itemCount: title.length,
//       padding: const EdgeInsets.symmetric(horizontal: 24),
//       itemBuilder: (context, index) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(vertical: 4),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 width: MediaQuery.of(context).size.width / 2.2,
//                 child: Text(
//                   title[index],
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.grey[600],
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 4),
//               Expanded(
//                 child: Text(
//                   data[index],
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

class Details extends StatelessWidget {
  final Items property;

  const Details({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    final manager = PropertyDetailManager(property);
    final details = manager.getDetails(); // Returns List<Map<String, String>>

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      itemCount: details.length,
      itemBuilder: (context, index) {
        final entry = details[index];
        final title = entry.keys.first;
        final value = entry.values.first;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.2,
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  value,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class AmenitiesSection extends StatelessWidget {
  final List<String> amenities;

  AmenitiesSection({super.key, required this.amenities});

  // final List<Map<String, dynamic>> amenities = [
  //   {'icon': Icons.pool, 'label': "Infinity Pool"},
  //   {'icon': Icons.wine_bar, 'label': "Sky Lounge"},
  //   {'icon': Icons.support_agent, 'label': "24x7 Concierge"},
  //   {'icon': Icons.elevator, 'label': "Private Elevator"},
  //   {'icon': Icons.lightbulb, 'label': "Smart Lighting"},
  //   {'icon': Icons.solar_power, 'label': "Solar Panels"},
  // ];

  final Color bgColor = Color(0xFFDBEAFE); // single background color
  final Color txtColor = Color(0xFF2563EB); // single text/icon color

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children:
            amenities.map((item) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(IconManager.getIcon(item), size: 16, color: txtColor),
                    const SizedBox(width: 8),
                    Text(
                      StringManager.formatLabel(item) ?? ' -',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: txtColor,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
      ),
    );
  }
}

class AddressAndMapDetails extends StatelessWidget {
  final Items property;

  const AddressAndMapDetails({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.location_on_rounded, size: 16),
          SizedBox(width: 8),
          Flexible(
            child: Text(
              "${property.address ?? ''}, ${property.city ?? ''}, ${property.state ?? ''}, ${property.zipCode ?? ''},",
              style: TextStyle(fontSize: 12),
            ),
          ),
          SizedBox(width: 8),
        ],
      ),
    );
  }
}

class NearbyPropertyDetails extends StatelessWidget {
  final List<NearbyLocations> nearbyLocations;

  NearbyPropertyDetails({super.key, required this.nearbyLocations});

  final List<Map<String, String>> nearby = [
    {"name": "Worli Sea Link", "distance": "0.5 km"},
    {"name": "High Street Phoenix", "distance": "2.1 km"},
    {"name": "Mumbai International Airport", "distance": "14 km"},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
          nearbyLocations
              .map(
                (loc) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8,
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.place_outlined, size: 16),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          loc.name ?? "-",
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Text(
                        "${loc.distance.toString()} KM" ?? '-',
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
    );
  }
}

class OwnerInformation extends StatelessWidget {
  final Items property;

  const OwnerInformation({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage(
                      IMGRes.home2,
                    ), // Use a real image or placeholder
                    // backgroundColor: Colors.grey[300], // fallback if no image
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          property.ownerName ?? "-",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 4),
                        if (property.ownerPhone != null)
                          Row(
                            children: [
                              Icon(
                                Icons.phone_outlined,
                                size: 18,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 6),
                              Text(
                                "+91 ${property.ownerPhone ?? '-'} ",
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        if (property.ownerEmail != null)
                          Row(
                            children: [
                              Icon(
                                Icons.email_outlined,
                                size: 18,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  property.ownerEmail ?? '-',
                                  style: TextStyle(color: Colors.black),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
