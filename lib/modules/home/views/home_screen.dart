import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:housing_flutter_app/app/constants/img_res.dart';
import 'package:housing_flutter_app/app/widgets/cards/banner_card_with_text.dart';
import 'package:housing_flutter_app/app/widgets/texts/headline_text.dart';
import 'package:housing_flutter_app/app/widgets/texts/title_with_disc.dart';
import 'package:housing_flutter_app/data/network/property/models/property_model.dart';
import 'package:housing_flutter_app/modules/home/widgets/city_card.dart';
import 'package:housing_flutter_app/modules/home/widgets/home_header.dart';
import 'package:housing_flutter_app/modules/home/widgets/top_locations.dart';
import 'package:housing_flutter_app/modules/propert_detail/view/property_details.dart';
import 'package:housing_flutter_app/modules/property/controllers/property_controller.dart';
import 'package:housing_flutter_app/modules/property/views/property_list_screen.dart';
import 'package:housing_flutter_app/modules/property/views/widgets/property_card.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app/constants/color_res.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  static final List<String> images = [
    IMGRes.home1,
    IMGRes.home2,
    IMGRes.home3,
    IMGRes.home4,
  ];
  static final List<String> banners = [
    IMGRes.plot1,
    IMGRes.banner2,
    IMGRes.banner3,
  ];
  static final List<String> shops = [
    IMGRes.shop1,
    IMGRes.shop2,
    IMGRes.shop3,
    IMGRes.shop4,
  ];
  static final List<String> plots = [IMGRes.plot1, IMGRes.plot2, IMGRes.plot3];
  static final List<String> bhk = [IMGRes.bhk1, IMGRes.bhk2, IMGRes.bhk3];

  final List<Map<String, dynamic>> cities = [
    {
      "imageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgiSMhfr1LlJcuQraQeqAGmt1ma5s9tGvoVQ&s",
      "cityName": "Delhi / NCR",
      "propertyCount": "232,000+ Properties",
    },
    {
      "imageUrl": "https://sitasurat.in/assets/images/about/surat-city.jpg",
      "cityName": "Surat",
      "propertyCount": "232,000+ Properties",
    },
    {
      "imageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgiSMhfr1LlJcuQraQeqAGmt1ma5s9tGvoVQ&s",
      "cityName": "Bangalore",
      "propertyCount": "63,000+ Properties",
    },
    {
      "imageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgiSMhfr1LlJcuQraQeqAGmt1ma5s9tGvoVQ&s",
      "cityName": "Pune",
      "propertyCount": "64,000+ Properties",
    },
    {
      "imageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgiSMhfr1LlJcuQraQeqAGmt1ma5s9tGvoVQ&s",
      "cityName": "Hyderabad",
      "propertyCount": "30,000+ Properties",
    },
  ];

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => PropertyController());
    final PropertyController controller = Get.find();
    return Scaffold(
      body: SafeArea(
        // backgroundColor: Colors.white,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const HomeHeader(),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // /// Header Dropdown of cities
                  // SizedBox(height: 12),
                  // CityDropdown(),
                  //
                  // /// Filter Tags
                  // SizedBox(height: 12),
                  // FilterTagList(),
                  SizedBox(height: 10),
                  //    FilterTagList(),

                  /// Banner
                  // const SizedBox(height: 24),
                  // // const TitleWithViewAll(title: "Banners", showViewAll: false),
                  // // const SizedBox(height: 12),
                  // // HorizontalBannerList(),
                  // const TitleWithViewAll(
                  //   title: "Property Types",
                  //   showViewAll: false,
                  // ),
                  // const SizedBox(height: 12),
                  // PropertyTypeFilterTagList(),

                  // /// Recommended Product
                  // const SizedBox(height: 12),
                  // const TitleWithViewAll(
                  //   title: "Recommended Property's",
                  //   showViewAll: true,
                  // ),
                  // SingleChildScrollView(
                  //   scrollDirection: Axis.horizontal,
                  //   child: Row(
                  //     children: List.generate(images.length, (index) {
                  //       return Padding(
                  //         padding: const EdgeInsets.only(right: 12),
                  //         child: PropertyCard(
                  //           imageUrl: images[index],
                  //           title: "Villa Newly Renovated",
                  //           price: "9.8 Cr",
                  //           location:
                  //               "123 Palm Beach Road, Juhu, Maharastra, india",
                  //         ),
                  //       );
                  //     }),
                  //   ),
                  // ),
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      Column(
                        children: [
                          TitleWithViewAll(
                            title: "Newly added properties",
                            showViewAll: true,
                            onViewAll: () => Get.to(PropertyListScreen()),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      FutureBuilder(
                        future: controller.loadInitial(),
                        builder: (context, asyncSnapshot) {
                          print(
                            'asyncSnapshot: ${asyncSnapshot.connectionState}',
                          );

                          if (asyncSnapshot.connectionState ==
                              ConnectionState.waiting) {
                            // Show loader while waiting
                            return Center(child: CircularProgressIndicator());
                          } else if (asyncSnapshot.hasError) {
                            // Show error message if future fails
                            return Center(
                              child: Text(
                                'Error: ${asyncSnapshot.error}',
                                style: TextStyle(color: Colors.red),
                              ),
                            );
                          } else if (asyncSnapshot.connectionState ==
                              ConnectionState.done) {
                            return Obx(() {
                              if (!controller.isLoading.value &&
                                  controller.items.isEmpty) {
                                return const Center(
                                  child: Text("No Property found."),
                                );
                              }
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                                child: NotificationListener<ScrollNotification>(
                                  onNotification: (scrollEnd) {
                                    final metrics = scrollEnd.metrics;
                                    if (metrics.atEdge && metrics.pixels != 0) {
                                      controller.loadMore();
                                    }
                                    return false;
                                  },
                                  child: SizedBox(
                                    height: 260,
                                    child: ClipRRect(
                                      child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: controller.items.length,
                                        separatorBuilder:
                                            (_, __) =>
                                                const SizedBox(width: 12),
                                        itemBuilder: (context, index) {
                                          final data = controller.items[index];
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 8.0,
                                            ),
                                            child: MediaQuery(
                                              data: MediaQuery.of(
                                                context,
                                              ).copyWith(
                                                textScaler:
                                                    const TextScaler.linear(
                                                      1.0,
                                                    ),
                                              ),
                                              child: PropertyCard(
                                                property: data,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            });
                          } else {
                            return Center(child: Text('No Property Available'));
                          }
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  TitleWithDescription(
                    title: "Recommended Properties",
                    showViewAll: true,
                    description: "Best properties for you",
                    onViewAll: () => Get.to(PropertyDetail()),
                  ),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: List.generate(banners.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: NesticoPeBannerCardWithText(
                              height: 200,
                              width: 230,
                              imageUrl: banners[index],
                              title: "Fully Furnished",
                              description: "Properties with all Essentials",
                            ),
                          );
                        }),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  TitleWithViewAll(title: "Trending Areas", showViewAll: true),

                  const SizedBox(height: 12),

                  FutureBuilder(
                    future: controller.loadInitial(),
                    builder: (context, asyncSnapshot) {
                      print('asyncSnapshot: ${asyncSnapshot.connectionState}');

                      if (asyncSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        // Show loader while waiting
                        return const Center(child: CircularProgressIndicator());
                      } else if (asyncSnapshot.hasError) {
                        // Show error message if future fails
                        return Center(
                          child: Text(
                            'Error: ${asyncSnapshot.error}',
                            style: const TextStyle(color: Colors.red),
                          ),
                        );
                      } else if (asyncSnapshot.connectionState ==
                          ConnectionState.done) {
                        return Obx(() {
                          if (!controller.isLoading.value &&
                              controller.items.isEmpty) {
                            return const Center(
                              child: Text("No Property found."),
                            );
                          }

                          return SizedBox(
                            height: 205,
                            child: ClipRRect(
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                separatorBuilder:
                                    (_, __) => const SizedBox(width: 10),
                                itemBuilder: (context, index) {
                                  final property = controller.items[index];
                                  final percentage =
                                      double.tryParse(
                                        propertyPercentage[index],
                                      ) ??
                                      0.0;
                                  final isPositive = percentage >= 10.0;
                                  return TopPropertyByLocation(
                                    property: property,
                                    isPositive: isPositive,
                                    rating: percentage,
                                  );
                                },
                              ),
                            ),
                          );
                        });
                      } else {
                        return const Center(
                          child: Text('No Property Available'),
                        );
                      }
                    },
                  ),

                  /// Filters by cities
                  const SizedBox(height: 12),
                  const TitleWithViewAll(title: "City", showViewAll: true),
                  const SizedBox(height: 12),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,

                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children:
                          cities.map((city) {
                            return CityCard(
                              imageUrl: city["imageUrl"],
                              cityName: city["cityName"],
                              propertyCount: city["propertyCount"],
                            );
                          }).toList(),
                    ),
                  ),

                  // const SizedBox(height: 12),
                  //
                  // const CityFilterList(),
                  const SizedBox(height: 12),
                  const SizedBox(height: 12),
                  const TitleWithViewAll(title: "Residential Properties"),
                  // const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      // Avoid scrolling conflict if inside scrollable
                      crossAxisCount: 2,
                      // Number of columns in the grid
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 170 / 125,
                      // Width / Height
                      children: List.generate(images.length, (index) {
                        return NesticoPeBannerCardWithText(
                          height: 125,
                          width: 170,
                          imageUrl: images[index],
                          title: "Apartment",
                        );
                      }),
                    ),
                  ),

                  const SizedBox(height: 24),

                  const TitleWithViewAll(title: "Explore by furnishing type"),
                  // const SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: List.generate(banners.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: NesticoPeBannerCardWithText(
                              height: 125,
                              width: 250,
                              imageUrl: banners[index],
                              title: "Fully Furnished",
                              description: "Properties with all Essentials",
                            ),
                          );
                        }),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  const TitleWithViewAll(title: "Commercial offering"),
                  // const SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: List.generate(shops.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: NesticoPeBannerCardWithText(
                              height: 125,
                              width: 125,
                              imageUrl: shops[index],
                              title: "Retail Shop",
                            ),
                          );
                        }),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  const TitleWithViewAll(title: "Find BHK?"),
                  // const SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: List.generate(plots.length * 2, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: NesticoPeBannerCardWithText(
                              height: 100,
                              width: 100,
                              imageUrl: bhk[index % 3],
                              title: "1BHK",
                              isCenterText: true,
                            ),
                          );
                        }),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  const TitleWithViewAll(title: "Plots In Surat"),
                  // const SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: List.generate(plots.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: NesticoPeBannerCardWithText(
                              height: 125,
                              width: 200,
                              imageUrl: plots[index],
                              title: "Residential Plot",
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: ReferralCard(referralCode: "089548"),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: CustomerSupport(phoneNumber: "+912345654323"),
              ),
              SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}

class CityDropdown extends StatefulWidget {
  const CityDropdown({super.key});

  @override
  State<CityDropdown> createState() => _CityDropdownState();
}

class _CityDropdownState extends State<CityDropdown> {
  final List<String> cities = [
    'Mumbai',
    'Delhi',
    'Bangalore',
    'Hyderabad',
    'Chennai',
    'Kolkata',
    'Pune',
  ];

  String? selectedCity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            // Remove borders
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          value: selectedCity,
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.grey,
          ),
          // Custom arrow icon
          items:
              cities.map((String city) {
                return DropdownMenuItem<String>(value: city, child: Text(city));
              }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedCity = newValue!;
            });
          },
        ),
      ),

      // child: DropdownButtonFormField<String>(
      //   decoration: InputDecoration(
      //     labelText: 'Select City',
      //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      //   ),
      //   value: selectedCity,
      //   items:
      //       cities.map((String city) {
      //         return DropdownMenuItem<String>(value: city, child: Text(city));
      //       }).toList(),
      //   onChanged: (String? newValue) {
      //     setState(() {
      //       selectedCity = newValue!;
      //     });
      //   },
      // ),
    );
  }
}

List<Items> dummyItems = [
  Items(
    id: "1",
    title: "Luxury Apartment in Vesu",
    type: "Residential",
    listingType: "Sale",
    propertyMedia: PropertyMedia(images: [IMGRes.home1, IMGRes.home2]),
    propertyType: "Apartment",
    propertyDescription: "3 BHK luxury apartment with modern amenities.",
    keywords: ["3BHK", "Luxury", "Apartment"],
    propertyDetails: PropertyDetails(
      bhk: 3,
      balcony: 2,
      bathroom: 3,
      amenities: ["Gym", "Swimming Pool", "Club House"],
      propertyCarpetArea: 1250,
      propertyBuiltUpArea: 1450,
      floorInfo: FloorInfo(floorNumber: 5, totalFloors: 12),
      furnishInfo: FurnishInfo(
        furnishType: "Semi-Furnished",
        furnishDetails: FurnishDetails(
          modularKitchen: true,
          wardrobes: true,
          acInstalled: false,
        ),
      ),
      parkingInfo: ParkingInfo(covered: 1, open: 1),
      financialInfo: FinancialInfo(price: 6500000, maintenance: 2500),
      possessionInfo: PossessionInfo(
        possessionStatus: "Ready to Move",
        possessionDate: "2025-12-01",
      ),
    ),
    address: "Vesu Main Road",
    city: "Surat",
    state: "Gujarat",
    zipCode: "395007",
    location: Location(latitude: 21.1702, longitude: 72.8311),
    nearbyLocations: [
      NearbyLocations(name: "School", distance: 1.2),
      NearbyLocations(name: "Hospital", distance: 2.0),
    ],
    builderName: "ABC Builders",
    projectName: "Skyline Residency",
    ownerName: "Rahul Mehta",
    ownerPhone: "9876543210",
    ownerEmail: "rahul@example.com",
    isVerified: true,
    totalViews: 120,
    totalInquiries: 18,
    totalFavorites: 8,
    totalShares: 2,
    createdAt: "2025-08-01",
    updatedAt: "2025-08-10",
  ),

  Items(
    id: "2",
    title: "Affordable 2BHK in Adajan",
    type: "Residential",
    listingType: "Rent",
    propertyType: "Flat",
    propertyDescription: "Spacious 2BHK at prime location.",
    keywords: ["2BHK", "Affordable", "Rent"],
    propertyMedia: PropertyMedia(images: [IMGRes.home3, IMGRes.home4]),

    propertyDetails: PropertyDetails(
      bhk: 2,
      balcony: 1,
      bathroom: 2,
      amenities: ["Lift", "Security"],
      propertyCarpetArea: 950,
      propertyBuiltUpArea: 1100,
      floorInfo: FloorInfo(floorNumber: 3, totalFloors: 10),
      furnishInfo: FurnishInfo(
        furnishType: "Furnished",
        furnishDetails: FurnishDetails(
          modularKitchen: true,
          wardrobes: true,
          acInstalled: true,
        ),
      ),
      parkingInfo: ParkingInfo(covered: 0, open: 1),
      financialInfo: FinancialInfo(price: 15000, maintenance: 1000),
      possessionInfo: PossessionInfo(
        possessionStatus: "Immediate",
        possessionDate: "2025-09-01",
      ),
    ),
    address: "Adajan Road",
    city: "Surat",
    state: "Gujarat",
    zipCode: "395009",
    location: Location(latitude: 21.2, longitude: 72.85),
    builderName: "XYZ Developers",
    projectName: "Green Residency",
    ownerName: "Priya Shah",
    ownerPhone: "9988776655",
    ownerEmail: "priya@example.com",
    isVerified: true,
    totalViews: 90,
    totalInquiries: 12,
    totalFavorites: 4,
    createdAt: "2025-08-05",
    updatedAt: "2025-08-15",
  ),

  Items(
    id: "3",
    title: "Commercial Shop in Ring Road",
    type: "Commercial",
    listingType: "Sale",
    propertyType: "Shop",
    propertyDescription: "Prime commercial shop ideal for offices/retail.",
    keywords: ["Shop", "Commercial", "Prime Location"],
    propertyMedia: PropertyMedia(images: [IMGRes.banner1, IMGRes.banner2]),

    propertyDetails: PropertyDetails(
      bhk: 0,
      balcony: 0,
      bathroom: 1,
      amenities: ["Power Backup"],
      propertyCarpetArea: 400,
      propertyBuiltUpArea: 450,
      financialInfo: FinancialInfo(price: 3200000, maintenance: 800),
    ),
    address: "Ring Road",
    city: "Surat",
    state: "Gujarat",
    zipCode: "395002",
    builderName: "Surat Developers",
    ownerName: "Ketan Patel",
    ownerPhone: "9123456789",
    isVerified: false,
    totalViews: 60,
    totalInquiries: 8,
  ),

  Items(
    id: "4",
    title: "4BHK Villa in Piplod",
    type: "Residential",
    listingType: "Sale",
    propertyType: "Villa",
    propertyDescription: "Luxurious villa with private garden and parking.",
    keywords: ["Villa", "Luxury", "Garden"],
    propertyMedia: PropertyMedia(images: [IMGRes.plot1, IMGRes.plot2]),

    propertyDetails: PropertyDetails(
      bhk: 4,
      balcony: 3,
      bathroom: 4,
      amenities: ["Garden", "Private Parking", "CCTV"],
      propertyCarpetArea: 2000,
      propertyBuiltUpArea: 2500,
      financialInfo: FinancialInfo(price: 15000000, maintenance: 0),
    ),
    address: "Piplod",
    city: "Surat",
    state: "Gujarat",
    zipCode: "395007",
    builderName: "Elite Builders",
    ownerName: "Sunita Desai",
    ownerPhone: "9898989898",
    isVerified: true,
    totalViews: 220,
    totalInquiries: 30,
    totalFavorites: 15,
  ),

  Items(
    id: "5",
    title: "Office Space in City Light",
    type: "Commercial",
    listingType: "Rent",
    propertyType: "Office",
    propertyDescription: "Fully furnished office space with 20 workstations.",
    keywords: ["Office", "Commercial", "Furnished"],
    propertyMedia: PropertyMedia(images: [IMGRes.home2, IMGRes.home1]),
    propertyDetails: PropertyDetails(
      amenities: ["AC", "Lift", "Security"],
      propertyCarpetArea: 1200,
      financialInfo: FinancialInfo(price: 50000, maintenance: 3000),
    ),
    address: "City Light",
    city: "Surat",
    state: "Gujarat",
    zipCode: "395007",
    builderName: "Smart Developers",
    ownerName: "Amit Jain",
    ownerPhone: "9876001234",
    isVerified: false,
    totalViews: 75,
    totalInquiries: 10,
  ),

  Items(
    id: "6",
    title: "1BHK Studio Apartment",
    type: "Residential",
    listingType: "Rent",
    propertyType: "Studio",
    propertyDescription: "Compact studio perfect for bachelors.",
    keywords: ["Studio", "1BHK", "Affordable"],
    propertyMedia: PropertyMedia(images: [IMGRes.home4, IMGRes.home2]),

    propertyDetails: PropertyDetails(
      bhk: 1,
      bathroom: 1,
      propertyCarpetArea: 450,
      financialInfo: FinancialInfo(price: 8000, maintenance: 500),
    ),
    address: "Pal",
    city: "Surat",
    state: "Gujarat",
    zipCode: "395009",
    ownerName: "Ramesh Gupta",
    ownerPhone: "9825001122",
    isVerified: true,
    totalViews: 40,
    totalInquiries: 5,
  ),

  Items(
    id: "7",
    title: "Warehouse in Kadodara",
    type: "Commercial",
    listingType: "Sale",
    propertyType: "Warehouse",
    propertyDescription: "Spacious warehouse with easy highway access.",
    keywords: ["Warehouse", "Commercial"],
    propertyMedia: PropertyMedia(images: [IMGRes.banner2, IMGRes.home2]),

    propertyDetails: PropertyDetails(
      propertyBuiltUpArea: 5000,
      financialInfo: FinancialInfo(price: 20000000, maintenance: 0),
    ),
    address: "Kadodara",
    city: "Surat",
    state: "Gujarat",
    zipCode: "394325",
    ownerName: "Manoj Yadav",
    ownerPhone: "9812345678",
    isVerified: false,
    totalViews: 30,
    totalInquiries: 3,
  ),

  Items(
    id: "8",
    title: "Plot in Dumas",
    type: "Residential",
    listingType: "Sale",
    propertyType: "Plot",
    propertyDescription: "Open NA plot near beach.",
    keywords: ["Plot", "Residential"],
    propertyMedia: PropertyMedia(images: [IMGRes.home1, IMGRes.home2]),

    propertyDetails: PropertyDetails(
      propertyBuiltUpArea: 1800,
      financialInfo: FinancialInfo(price: 3000000, maintenance: 0),
    ),
    address: "Dumas Road",
    city: "Surat",
    state: "Gujarat",
    zipCode: "394550",
    ownerName: "Vishal Patel",
    ownerPhone: "9876541200",
    isVerified: true,
    totalViews: 100,
    totalInquiries: 14,
  ),

  Items(
    id: "9",
    title: "Penthouse in Vesu",
    type: "Residential",
    listingType: "Sale",
    propertyType: "Penthouse",
    propertyDescription: "5BHK penthouse with terrace & pool.",
    keywords: ["Penthouse", "Luxury", "Terrace"],
    propertyMedia: PropertyMedia(images: [IMGRes.home1, IMGRes.home2]),

    propertyDetails: PropertyDetails(
      bhk: 5,
      balcony: 4,
      bathroom: 5,
      propertyBuiltUpArea: 4000,
      financialInfo: FinancialInfo(price: 30000000, maintenance: 5000),
    ),
    address: "Vesu",
    city: "Surat",
    state: "Gujarat",
    zipCode: "395007",
    ownerName: "Rohit Shah",
    ownerPhone: "9000090000",
    isVerified: true,
    totalViews: 500,
    totalInquiries: 40,
    totalFavorites: 25,
  ),

  Items(
    id: "10",
    title: "Row House in Palanpur",
    type: "Residential",
    listingType: "Sale",
    propertyType: "Row House",
    propertyDescription: "3BHK row house with parking & terrace.",
    keywords: ["Row House", "3BHK"],
    propertyMedia: PropertyMedia(images: [IMGRes.home1, IMGRes.home2]),

    propertyDetails: PropertyDetails(
      bhk: 3,
      balcony: 2,
      bathroom: 3,
      propertyBuiltUpArea: 1600,
      financialInfo: FinancialInfo(price: 8500000, maintenance: 1000),
    ),
    address: "Palanpur",
    city: "Surat",
    state: "Gujarat",
    zipCode: "395005",
    ownerName: "Anjali Verma",
    ownerPhone: "9911223344",
    isVerified: false,
    totalViews: 80,
    totalInquiries: 9,
  ),
];

final List<String> propertyPercentage = [
  "9.6",
  "10.2",
  "7.8",
  "15.4",
  "12.0",
  "8.9",
  "11.5",
  "14.3",
  "9.0",
  "16.8",
];

class ReferralCard extends StatelessWidget {
  final String referralCode;

  const ReferralCard({Key? key, required this.referralCode}) : super(key: key);

  void _shareReferral(BuildContext context) {
    final String shareText =
        "Hey! Use my referral code 👉 $referralCode to sign up and enjoy benefits! \n\nDownload the app here: https://example.com/app";

    Share.share(shareText, subject: "Join with my referral code");
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 6,
        color: ColorRes.primary.withOpacity(0.9),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Refer Friends",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: ColorRes.white,
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Text(
                  "Share app and help your friends discover great real estate options!",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: ColorRes.white,
                  ),
                ),
              ),

              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () => _shareReferral(context),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                ),
                icon: const Icon(Icons.share),
                label: Text(
                  "Share Code",
                  style: TextStyle(color: ColorRes.primary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomerSupport extends StatelessWidget {
  final String phoneNumber;

  const CustomerSupport({Key? key, required this.phoneNumber})
    : super(key: key);

  Future<void> _callSupport() async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);

    if (!await launchUrl(
      launchUri,
      mode: LaunchMode.externalNonBrowserApplication, // 👈 important
    )) {
      throw "Could not launch dialer for $phoneNumber";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 6,
        color: Colors.yellow.shade900,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Customer Support",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: const Text(
                  "Need help? Call our support team for assistance anytime.",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _callSupport,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.yellow.shade900,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                ),
                icon: Icon(Icons.call, color: Colors.yellow.shade900),
                label: Text(
                  "Call Support",
                  style: TextStyle(color: Colors.yellow.shade900),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
