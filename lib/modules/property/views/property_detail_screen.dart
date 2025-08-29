import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housing_flutter_app/app/constants/color_res.dart';
import 'package:housing_flutter_app/app/constants/img_res.dart';
import 'package:housing_flutter_app/app/constants/size_manager.dart';
import 'package:housing_flutter_app/widgets/button/crm_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../app/widgets/texts/headline_text.dart';

class PropertyDetailScreen extends StatelessWidget {
  const PropertyDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: kBottomNavigationBarHeight),

          // prevents overlap
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImageBanner(),
              _buildTitleSection(),
              Divider(indent: 18, endIndent: 18, color: Colors.grey.shade300),

              SizedBox(height: 12),
              TitleWithViewAll(title: 'Highlights'),
              SizedBox(height: 18),
              HighLights(),
              SizedBox(height: 12),
              Divider(indent: 18, endIndent: 18, color: Colors.grey.shade300),

              SizedBox(height: 12),
              TitleWithViewAll(title: 'Property Details'),
              SizedBox(height: 18),
              Details(),
              SizedBox(height: 12),
              Divider(indent: 18, endIndent: 18, color: Colors.grey.shade300),

              SizedBox(height: 12),
              TitleWithViewAll(title: 'Furniture'),
              SizedBox(height: 18),
              FurnitureSection(),
              SizedBox(height: 12),
              Divider(indent: 18, endIndent: 18, color: Colors.grey.shade300),

              SizedBox(height: 12),
              TitleWithViewAll(title: 'Description'),
              SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Breathtaking 4-bedroom penthouse on the 34th floor, boasting 270° sea and city views,'
                  ' floor-to-ceiling windows, private infinity terrace, and designer interiors.'
                  ' A rare gem for urban luxury seekers.',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              SizedBox(height: 12),
              Divider(indent: 18, endIndent: 18, color: Colors.grey.shade300),

              SizedBox(height: 12),
              TitleWithViewAll(title: 'Location'),
              SizedBox(height: 18),
              AddressAndMapDetails(),
              SizedBox(height: 12),
              Divider(indent: 18, endIndent: 18, color: Colors.grey.shade300),

              SizedBox(height: 12),
              TitleWithViewAll(title: 'Nearby Locations'),
              SizedBox(height: 18),
              NearbyPropertyDetails(),
              SizedBox(height: 12),
              Divider(indent: 18, endIndent: 18, color: Colors.grey.shade300),

              SizedBox(height: 12),
              TitleWithViewAll(title: 'Owner Details'),
              SizedBox(height: 18),
              OwnerInformation(),
              SizedBox(height: 12),
              const SizedBox(height: 36), // Extra spacing at bottom
            ],
          ),
        ),
      ),
      bottomNavigationBar: PropertyBottomBar(
        price: '₹ 11199,24,000',
        onCallOwner: () {},
        onScheduleVisit: () {},
      ),
    );
  }

  Widget _buildImageBanner() {
    final PageController _pageController = PageController();
    final List<String> images = [
      IMGRes.home1,
      IMGRes.home2,
      IMGRes.home3,
      IMGRes.home4,
      IMGRes.home4,
      IMGRes.home4,
    ];

    int currentPage = 0;

    return SafeArea(
      // top: true, // ensures it stays below status bar
      child: StatefulBuilder(
        builder: (context, setState) {
          return Stack(
            children: [
              SizedBox(
                height: 350,
                width: double.infinity,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: images.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Image.asset(
                      images[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    );
                  },
                ),
              ),
              // Back button
              Positioned(
                top: 16,
                left: 16,
                child: CircularIcon(
                  icon: Icons.arrow_back_rounded,
                  backgroundColor: Colors.white, // set background color
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
                    borderRadius: BorderRadius.circular(AppRadius.small),
                  ),
                  child: Text(
                    '${currentPage + 1}/${images.length}',
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

  Widget _buildTitleSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Price
          Text(
            "₹ 8,25,000",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),

          // Property Title
          Text(
            "Skyline Penthouse with Infinity Terrace aaaaaaaaa",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: ColorRes.textPrimary,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),

          // Location Row
          Row(
            children: [
              Icon(Icons.location_on, size: 16, color: Color(0xFF2563EB)),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  "Mumbai, Maharashtra aaaaaaaaaaaaaaaaaaaaaaaaaa",
                  style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Type + See on Map Row (aligned with start)
          Row(
            children: [
              // Type Chip
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
                  "For Sale",
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
                child: CrmButton(onTap: onCallOwner, title: "View Contact"),
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

class HighLights extends StatelessWidget {
  HighLights({super.key});

  final List<String> labels = [
    'Fully furnished',
    '1650 Sq ft',
    'Floor 6/8',
    '3 to 5 years old',
    'For Male, Family, Female',
  ];
  final List<IconData> icons = [
    Icons.bed,
    Icons.zoom_out_map_outlined,
    Icons.layers_outlined,
    Icons.date_range,
    Icons.person,
  ];

  final Color bgColor = Color(0xFFDBEAFE); // Single background color
  final Color txtColor = Color(0xFF2563EB); // Single text/icon color

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(labels.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: HighLightsCard(
                label: labels[index],
                icon: icons[index],
                bgColor: bgColor,
                foreColor: txtColor,
              ),
            );
          }),
        ),
      ),
    );
  }
}

class HighLightsCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color? bgColor, foreColor;

  const HighLightsCard({
    super.key,
    required this.label,
    required this.icon,
    this.bgColor,
    this.foreColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(AppRadius.extraLarge),
            ),
            child: Center(child: Icon(icon, color: foreColor)),
          ),
          SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: foreColor,
            ),
          ),
        ],
      ),
    );
  }
}

class Details extends StatelessWidget {
  Details({super.key});

  final List<String> title = [
    "Age of the Property",
    "BHK Types",
    "Furnished Types",
    "Built-up Area",
    "Floors",
    "Notice Period",
  ];

  final List<String> data = [
    "3 to 5 years old",
    "3 BHK",
    "Fully Furnished",
    "1,650 Sq.ft.",
    "6 of 8",
    "1 month",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      // disable scroll if inside another scroll
      itemCount: title.length,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.2,
                child: Text(
                  title[index],
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
                  data[index],
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

class FurnitureSection extends StatelessWidget {
  FurnitureSection({super.key});

  final List<Map<String, dynamic>> amenities = [
    {'icon': Icons.pool, 'label': "Infinity Pool"},
    {'icon': Icons.wine_bar, 'label': "Sky Lounge"},
    {'icon': Icons.support_agent, 'label': "24x7 Concierge"},
    {'icon': Icons.elevator, 'label': "Private Elevator"},
    {'icon': Icons.lightbulb, 'label': "Smart Lighting"},
    {'icon': Icons.solar_power, 'label': "Solar Panels"},
  ];

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
                    Icon(item['icon'], size: 16, color: txtColor),
                    const SizedBox(width: 8),
                    Text(
                      item['label'],
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
  const AddressAndMapDetails({super.key});

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
              "3401, Platinum Sky Residences, Worli Sea Link Road",
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
  NearbyPropertyDetails({super.key});

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
          nearby
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
                          loc['name']!,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Text(
                        loc['distance']!,
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
  const OwnerInformation({super.key});

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
                      IMGRes.home1,
                    ), // Use a real image or placeholder
                    // backgroundColor: Colors.grey[300], // fallback if no image
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Anita Desai",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.phone_outlined,
                              size: 18,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 6),
                            Text(
                              "+91 9988776655",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.email_outlined,
                              size: 18,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 6),
                            Text(
                              "anita.desai@example.com",
                              style: TextStyle(color: Colors.black),
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
