import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housing_flutter_app/app/constants/color_res.dart';
import 'package:housing_flutter_app/app/constants/img_res.dart';
import 'package:housing_flutter_app/app/constants/size_manager.dart';
import 'package:housing_flutter_app/modules/home/views/property_detail_screen.dart';
import 'package:housing_flutter_app/widgets/button/crm_button.dart';
import 'package:housing_flutter_app/widgets/display/crm_card.dart';

class PropertyListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> dummyProperties = [
    {
      "title": "Luxury 3BHK Apartment",
      "price": "₹ 1.8 Cr",
      "availability": "For Family, Male, Female",
      "area": "1180 ft",
      "type": "2 BHK",
      "furnishing": "Semi Furnished",
      "floor": "1/3 Floor",
      "age": "3 to 5 years old",
      "description":
          "Experience luxurious living in this spacious 3BHK apartment located in the heart of Mumbai.",
      "postedBy": "John Doe",
      "image": IMGRes.home1,
    },
    {
      "title": "Modern 2BHK Flat",
      "price": "₹ 95 Lakh",
      "availability": "For Family Only",
      "area": "950 ft",
      "type": "2 BHK",
      "furnishing": "Unfurnished",
      "floor": "5/10 Floor",
      "age": "New Construction",
      "description":
          "A brand new 2BHK flat with spacious interiors and modular kitchen setup.",
      "postedBy": "Jane Smith",
      "image": IMGRes.home2,
    },
    {
      "title": "Cozy 1BHK Studio",
      "price": "₹ 60 Lakh",
      "availability": "For Bachelors Only",
      "area": "600 ft",
      "type": "1 BHK",
      "furnishing": "Fully Furnished",
      "floor": "2/4 Floor",
      "age": "5 to 10 years old",
      "description":
          "Perfect for working professionals, this 1BHK comes with all amenities and close proximity to metro.",
      "postedBy": "Anil Kapoor",
      "image": IMGRes.home3,
    },
    {
      "title": "Spacious 4BHK Villa",
      "price": "₹ 3.2 Cr",
      "availability": "For Family Only",
      "area": "2400 ft",
      "type": "4 BHK",
      "furnishing": "Semi Furnished",
      "floor": "Ground Floor",
      "age": "10+ years",
      "description":
          "Independent villa with garden, car parking and large terrace area.",
      "postedBy": "Karan Mehta",
      "image": IMGRes.home4,
    },
    {
      "title": "Compact Studio Apartment",
      "price": "₹ 45 Lakh",
      "availability": "For Single Male",
      "area": "400 ft",
      "type": "Studio",
      "furnishing": "Furnished",
      "floor": "3/5 Floor",
      "age": "Under Construction",
      "description":
          "Affordable and efficient studio apartment near business district.",
      "postedBy": "Simran Kaur",
      "image": IMGRes.home1,
    },
  ];

  PropertyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: CustomSearchAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView.builder(
          itemCount: dummyProperties.length,
          itemBuilder: (context, index) {
            final property = dummyProperties[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: PropertyListScreenCard(property: property),
            );
          },
        ),
      ),
    );
  }
}

class PropertyListScreenCard extends StatelessWidget {
  final Map<String, dynamic> property;

  const PropertyListScreenCard({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(PropertyDetailScreen()),
      child: CrmCard(
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with Favorite Icon
            Stack(
              children: [
                SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    child: Image.asset(property["image"], fit: BoxFit.cover),
                  ),
                ),
              ],
            ),

            // Info Section
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          property["title"],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 12),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 6,
                        ),
                        decoration: BoxDecoration(
                          color: ColorRes.primary,
                          borderRadius: BorderRadius.circular(AppRadius.small),
                        ),
                        child: Text(
                          "Rent",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Divider(
                    indent: 12,
                    endIndent: 12,
                    color: Colors.grey.shade200,
                  ),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 4.5,
                              child: Text(
                                property["price"],
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 80,
                              child: Text(
                                property["availability"],
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[700],
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 6),
                        VerticalDivider(
                          thickness: 1,
                          width: 20, // space between items
                          color: Colors.grey.shade200,
                        ),
                        SizedBox(width: 6),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 4.5,
                          child: Column(
                            children: [
                              Text(
                                property["area"],
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 80,
                                child: Text(
                                  "Built Up area",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[700],
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 6),
                        VerticalDivider(
                          thickness: 1,
                          width: 20, // space between items
                          color: Colors.grey.shade200,
                        ),
                        SizedBox(width: 6),

                        SizedBox(
                          width: MediaQuery.of(context).size.width / 4.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                property["type"],
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                property["furnishing"],
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[700],
                                ),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Divider(
                  //   indent: 12,
                  //   endIndent: 12,
                  //   color: Colors.grey.shade300,
                  // ),
                  const SizedBox(height: 4),
                  // Row(
                  //   children: [
                  //     Container(
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(AppRadius.small),
                  //         color: Color(0xFFDBEAFE),
                  //       ),
                  //       child: Padding(
                  //         padding: const EdgeInsets.symmetric(
                  //           vertical: 4.0,
                  //           horizontal: 8,
                  //         ),
                  //         child: Text(
                  //           property["floor"],
                  //           style: TextStyle(
                  //             fontWeight: FontWeight.w600,
                  //             fontSize: 10,
                  //             color: Color(0xFF2563EB),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     SizedBox(width: 8),
                  //     Container(
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(AppRadius.small),
                  //         color: Color(0xFFDBEAFE),
                  //       ),
                  //       child: Padding(
                  //         padding: const EdgeInsets.symmetric(
                  //           vertical: 4.0,
                  //           horizontal: 8,
                  //         ),
                  //         child: Text(
                  //           property["age"],
                  //           style: TextStyle(
                  //             fontWeight: FontWeight.w600,
                  //             fontSize: 10,
                  //             color: Color(0xFF2563EB),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(height: 4),

                  /// Description
                  Text(
                    property["description"],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  SizedBox(height: 4),
                  Divider(
                    indent: 12,
                    endIndent: 12,
                    color: Colors.grey.shade200,
                  ),
                  Row(
                    children: [
                      // Profile picture
                      SizedBox(
                        height: 35,
                        width: 35,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                            property["image"], // Replace with actual image URL
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),

                      // Column with 'Posted by' and name
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Posted by',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              property["postedBy"],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Button 1
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 80,
                            height: 40,
                            child: CrmButton(onTap: () {}, title: "Call"),
                          ),
                          // SizedBox(width: 6),
                          // SizedBox(
                          //   width: 40,
                          //   height: 40,
                          //   child: ElevatedButton(
                          //     onPressed: () {
                          //       // Your onPressed logic
                          //     },
                          //     style: ElevatedButton.styleFrom(
                          //       backgroundColor: const Color(0xFFDBEAFE),
                          //       padding:
                          //           EdgeInsets.zero, // Remove default padding
                          //       shape: RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.circular(
                          //           AppRadius.medium,
                          //         ),
                          //       ),
                          //       elevation: 0, // Optional: flat look
                          //     ),
                          //     child: Icon(
                          //       Icons.phone_outlined,
                          //       size: 20, // Optional: control icon size
                          //       color:
                          //           ColorRes
                          //               .primary, // Optional: set icon color
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSearchAppBar extends StatelessWidget {
  const CustomSearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12, top: 24),
        child: Column(
          children: [
            // Row 1: Search Bar + Sort Icon
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(AppRadius.medium),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        border: InputBorder.none,
                        icon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                CircleAvatar(
                  backgroundColor: Colors.grey.shade200,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_downward_outlined),
                    onPressed: () {},
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Row 2: Filter icon + Chips
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey.shade200,
                  child: IconButton(
                    icon: const Icon(Icons.filter_list),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        FilterChip(
                          label: const Text('3 BHK'),
                          onSelected: (val) {},
                        ),
                        const SizedBox(width: 8),
                        FilterChip(
                          label: const Text('Fully Furnished'),
                          onSelected: (val) {},
                        ),
                        const SizedBox(width: 8),
                        FilterChip(
                          label: const Text('₹50L - ₹1Cr'),
                          onSelected: (val) {},
                        ),
                        const SizedBox(width: 8),
                        FilterChip(
                          label: const Text('Ready to Move'),
                          onSelected: (val) {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
