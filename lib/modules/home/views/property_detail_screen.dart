import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housing_flutter_app/app/constants/color_res.dart';
import 'package:housing_flutter_app/app/constants/img_res.dart';
import 'package:housing_flutter_app/app/constants/size_manager.dart';
import 'package:housing_flutter_app/widgets/button/crm_button.dart';

import '../../../app/widgets/texts/headline_text.dart';

class PropertyDetailScreen extends StatelessWidget {
  const PropertyDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      body: SingleChildScrollView(
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
      bottomNavigationBar: PropertyBottomBar(
        price: '₹ 8.9 Cr',
        onCallOwner: () {},
        onScheduleVisit: () {},
      ),
    );
  }

  Widget _buildImageBanner() {
    return Stack(
      children: [
        Container(
          height: 300,
          width: double.infinity,
          child: Image.asset(IMGRes.home1, fit: BoxFit.cover),
        ),
        Positioned(
          top: 30,
          left: 20,
          child: Row(
            children: [
              CircularIcon(
                icon: Icons.arrow_back_rounded,
                onPressed: () => Get.back(),
              ),
              SizedBox(width: 12),
              // Container(
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(AppRadius.extraLarge),
              //     color: Colors.black.withOpacity(0.7),
              //   ),
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(
              //       vertical: 8.0,
              //       horizontal: 12,
              //     ),
              //     child: Text(
              //       'For Rent',
              //       style: TextStyle(fontSize: 12, color: Colors.white),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        Positioned(
          top: 30,
          right: 20,
          child: Row(
            children: [
              CircularIcon(
                icon: Icons.favorite_border_rounded,
                onPressed: () {},
              ),
              SizedBox(width: 12),
              CircularIcon(icon: Icons.share_outlined, onPressed: () {}),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTitleSection() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        "Skyline Penthouse with Infinity Terrace in Mumbai",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: ColorRes.textPrimary,
        ),
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
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

  const CircularIcon({super.key, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.extraLarge),
          color: Colors.grey.shade300,
        ),
        child: Icon(icon),
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
                  color: Colors.green,
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
  final List<Color> bgColor = [
    Color(0xFFDBEAFE),
    Color(0xFFDCFCE7),
    Color(0xFFFFEDD5),
    Color(0xFFF3E8FF),
  ];
  final List<Color> txtColor = [
    Color(0xFF2563EB),
    Color(0xFF16A34A),
    Color(0xFFEA580C),
    Color(0xFF9333EA),
  ];

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
                bgColor: bgColor[index % 4],
                foreColor: txtColor[index % 4],
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

  final List<Color> bgColor = [
    Color(0xFFDBEAFE), // Light Blue
    Color(0xFFDCFCE7), // Light Green
    Color(0xFFFFEDD5), // Light Orange
    Color(0xFFF3E8FF), // Light Purple
    Color(0xFFFFE4E6), // Light Rose
    Color(0xFFFEF9C3), // Light Yellow
    Color(0xFFE0F2FE), // Light Sky Blue
    Color(0xFFF0FDF4), // Light Emerald
    Color(0xFFFAE8FF), // Light Fuchsia
  ];

  final List<Color> txtColor = [
    Color(0xFF2563EB), // Blue
    Color(0xFF16A34A), // Green
    Color(0xFFEA580C), // Orange
    Color(0xFF9333EA), // Purple
    Color(0xFFE11D48), // Rose
    Color(0xFFCA8A04), // Yellow
    Color(0xFF0284C7), // Sky Blue
    Color(0xFF22C55E), // Emerald
    Color(0xFFC026D3), // Fuchsia
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: List.generate(amenities.length, (index) {
          final bg = bgColor[index % bgColor.length];
          final color = txtColor[index % txtColor.length];
          final item = amenities[index];

          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(item['icon'], size: 16, color: color),
                const SizedBox(width: 8),
                Text(
                  item['label'],
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: color,
                  ),
                ),
              ],
            ),
          );
        }),
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
