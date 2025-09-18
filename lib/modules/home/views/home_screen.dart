import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housing_flutter_app/app/constants/app_font_sizes.dart';

import 'package:housing_flutter_app/app/constants/img_res.dart';
import 'package:housing_flutter_app/app/utils/formater/formater.dart';
import 'package:housing_flutter_app/app/widgets/cards/banner_card_with_text.dart';
import 'package:housing_flutter_app/app/widgets/texts/headline_text.dart';
import 'package:housing_flutter_app/app/widgets/texts/title_with_disc.dart';
import 'package:housing_flutter_app/data/network/property/models/property_model.dart';
import 'package:housing_flutter_app/modules/home/widgets/city_card.dart';
import 'package:housing_flutter_app/modules/home/widgets/home_header.dart';
import 'package:housing_flutter_app/modules/home/widgets/top_locations.dart';
import 'package:housing_flutter_app/modules/new_project/view/latest_project.dart';
import 'package:housing_flutter_app/modules/propert_detail/view/property_details.dart';
import 'package:housing_flutter_app/modules/property/controllers/property_controller.dart';
import 'package:housing_flutter_app/modules/property/views/property_list_screen.dart';
// import 'package:housing_flutter_app/modules/property/views/recommended.dart';
import 'package:housing_flutter_app/modules/property/views/widgets/property_card.dart';
import 'package:housing_flutter_app/modules/property_rating/view/top_rated_property.dart';
import 'package:housing_flutter_app/modules/search_property/view/search_screen.dart';
import 'package:housing_flutter_app/modules/seller/view/seller_profile.dart';
import 'package:housing_flutter_app/modules/seller/view/widget/seller_list.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app/constants/color_res.dart';

class HomeScreen extends StatefulWidget {
  final List<Map<String, String>> propertyTypes;
  const HomeScreen({
    super.key,
    this.propertyTypes = const [
      {
        "title": "Villa",
        "image":
            "https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=600&q=80",
      },
      {
        "title": "Plot",
        "image":
            "https://images.unsplash.com/photo-1580587771525-78b9dba3b914?auto=format&fit=crop&w=600&q=80",
      },

      {
        "title": "PG",
        "image":
            "https://pgproperty.sg/wp-content/uploads/2022/11/the-crest-488x326.jpg",
      },
      {
        "title": "Shop",
        "image":
            "https://5.imimg.com/data5/XH/NE/SW/SELLER-48886426/shop-for-sale-in-jaipur-commercial.jpg",
      },
      {
        "title": "Office",
        "image":
            "https://img.etimg.com/thumb/width-1200,height-1200,imgsize-76402,resizemode-75,msid-111456711/industry/services/property-/-cstruction/india-office-property-market-surges-with-record-gross-leasing-in-2024-first-half.jpg",
      },
      {
        "title": "Studio",
        "image":
            "https://homebazaar-blog.s3.ap-south-1.amazonaws.com/knowledge/wp-content/uploads/2022/10/24122439/FeatureImage_Overview-Of-A-Studio-Apartment.webp",
      },
      {
        "title": "Warehouse",
        "image":
            "https://3.imimg.com/data3/SR/MV/MY-12088584/warehouses-for-sale-500x500.jpg",
      },
      {
        "title": "Apartment",
        "image":
            "https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?auto=format&fit=crop&w=600&q=80",
      },
      {
        "title": "Commercial",
        "image":
            "https://www.ashwinshethgroup.com/wp-content/uploads/2022/11/Commercial-property-buying-guidelines-1400x700-1.webp",
      },
    ],
  });

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
    IMGRes.shop1,
    IMGRes.shop2,
    IMGRes.shop3,
    IMGRes.shop4,
  ];
  static final List<String> shops = [
    IMGRes.shop1,
    IMGRes.shop2,
    IMGRes.shop3,
    IMGRes.shop4,
  ];
  static final List<String> plots = [IMGRes.plot1, IMGRes.plot2, IMGRes.plot3];
  static final List<String> bhk = [IMGRes.bhk1, IMGRes.bhk2, IMGRes.bhk3];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PropertyController controller = Get.put(PropertyController());

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
  final List<Map<String, dynamic>> dummySellerList = [
    {
      "seller": {
        "name": "Ramprasad Padhi",
        "image":
            "https://images.unsplash.com/photo-1607746882042-944635dfe10e?auto=format&fit=crop&w=600&q=80",
        "experience": 31,
        "location": "Borivali West",
        "properties_count": 55,
      },
    },
    {
      "seller": {
        "name": "Meena Properties",
        "image":
            "https://images.unsplash.com/photo-1521791136064-7986c2920216?auto=format&fit=crop&w=600&q=80",
        "experience": 6,
        "location": "Virar West",
        "properties_count": 54,
      },
    },
    {
      "seller": {
        "name": "Dhanraj Choudhary",
        "image":
            "https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=600&q=80",
        "experience": 13,
        "location": "Powai",
        "properties_count": 41,
      },
    },
    {
      "seller": {
        "name": "Mahavastu Realty",
        "image":
            "https://images.unsplash.com/photo-1600566752355-35792bedcfea?auto=format&fit=crop&w=600&q=80",
        "experience": 8,
        "location": "Mira Road East",
        "properties_count": 15,
      },
    },
    {
      "seller": {
        "name": "Kohinoor Realtors",
        "image":
            "https://images.unsplash.com/photo-1522202176988-66273c2fd55f?auto=format&fit=crop&w=600&q=80",
        "experience": 10,
        "location": "Andheri East",
        "properties_count": 29,
      },
    },
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Get.lazyPut(() => PropertyController());
    // final PropertyController controller = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const HomeHeader(),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(height: 15),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(
                      // horizontal: 12,
                      vertical: 4,
                    ),
                    child: Row(
                      children: List.generate(widget.propertyTypes.length, (
                        index,
                      ) {
                        final type = widget.propertyTypes[index];
                        final isSelected = selectedIndex == index;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                            print("Selected: ${type['title']}");
                          },
                          child: IntrinsicWidth(
                            child: Container(
                              margin: EdgeInsets.only(
                                left: index == 0 ? 8 : 2,
                                right:
                                    index == widget.propertyTypes.length - 1
                                        ? 8
                                        : 0,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color:
                                            isSelected
                                                ? ColorRes.primary
                                                : Colors.grey.shade300,
                                        width: 2,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: ClipOval(
                                        child: FadeInImage.assetNetwork(
                                          placeholder: 'assets/logo/Avant.jpg',
                                          image: type['image'] ?? '',
                                          fit: BoxFit.cover,
                                          imageErrorBuilder:
                                              (context, error, stackTrace) =>
                                                  Icon(
                                                    Icons.home_work_rounded,
                                                    color: Colors.grey.shade400,
                                                    size: 32,
                                                  ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    type['title'] ?? '',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: AppFontSizes.caption,
                                      fontWeight:
                                          isSelected
                                              ? FontWeight.w600
                                              : FontWeight.w500,
                                      color:
                                          isSelected
                                              ? ColorRes.primary
                                              : ColorRes.black,
                                      letterSpacing: 0.4,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),

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
                      Obx(() {
                        if (controller.isLoading.value &&
                            controller.items.isEmpty) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (!controller.isLoading.value &&
                            controller.items.isEmpty) {
                          return const Center(
                            child: Text("No Property found."),
                          );
                        }

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: NotificationListener<ScrollNotification>(
                            onNotification: (scrollEnd) {
                              final metrics = scrollEnd.metrics;
                              if (metrics.atEdge && metrics.pixels != 0) {
                                controller.loadMore();
                              }
                              return false;
                            },
                            child: SizedBox(
                              height: 325,
                              child: ClipRRect(
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.items.length,
                                  separatorBuilder:
                                      (_, __) => const SizedBox(width: 12),
                                  itemBuilder: (context, index) {
                                    if (index >= controller.items.length) {
                                      return const SizedBox();
                                    }
                                    final data = controller.items[index];
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8.0,
                                      ),
                                      child: MediaQuery(
                                        data: MediaQuery.of(context).copyWith(
                                          textScaler: const TextScaler.linear(
                                            1.0,
                                          ),
                                        ),
                                        child: PropertyCard(property: data),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
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
                      padding: const EdgeInsets.only(left: 12),
                      child: Row(
                        children: List.generate(HomeScreen.banners.length, (
                          index,
                        ) {
                          return GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: NesticoPeBannerCardWithText(
                                height: 230, // ✅ reduced for balanced look
                                width: 220,
                                imageUrl: HomeScreen.banners[index],
                                price: "₹1.25Cr",
                                location: "Mota varacha, Surat",
                                propertySize:
                                    "3 / 4 BHK, 1250 sqft, Semi-Furnished",
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  const TitleWithViewAll(title: "Trending Areas", showViewAll: true),

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
                            height: 225,
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
                  const SizedBox(height: 20),

                  const TitleWithViewAll(
                    title: "Top Rated Localities",
                    showViewAll: true,
                  ),

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
                            height: 100,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.items.length,
                              padding: const EdgeInsets.only(left: 10),
                              itemBuilder: (context, index) {
                                final property = controller.items[index];
                                return Padding(
                                  padding: const EdgeInsets.only(right: 10), //
                                  child: PropertyHorizontalCard(
                                    imageHeight: double.infinity,
                                    titleFontWeight: FontWeight.w600,

                                    buttonText: 'View More',
                                    locationFontSize: AppFontSizes.caption,
                                    maxLineTitle: 1,
                                    buttonFontWeight: AppFontWeights.semiBold,
                                    buttonFontSize: 10,
                                    buttonTextColor: ColorRes.primary,
                                    maxLine: 1,
                                    title: '${property.title}',
                                    imagePath:
                                        (property.propertyMedia?.images !=
                                                    null &&
                                                property
                                                    .propertyMedia!
                                                    .images!
                                                    .isNotEmpty)
                                            ? property
                                                .propertyMedia!
                                                .images!
                                                .first
                                            : 'https://images.pexels.com/photos/186077/pexels-photo-186077.jpeg?cs=srgb&dl=pexels-binyaminmellish-186077.jpg&fm=jpg',

                                    location:
                                        'Location : ${property.address ?? 'N/A'}',
                                    rating:
                                        property.totalViews != null
                                            ? property.totalViews?.toDouble()
                                            : 0.0,
                                    price:
                                        '${property.propertyDetails?.financialInfo?.price ?? 'N/A'}',
                                    priceFontSize: AppFontSizes.caption,
                                    priceFontWeight: FontWeight.w600,
                                    ratingColor: ColorRes.primary,
                                    accentColor: ColorRes.primary,
                                    onTap: () {
                                      Get.to(
                                        () => RatingDetail(property: property),
                                      );
                                    },
                                  ),
                                );
                              },
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
                  const SizedBox(height: 20),
                  TitleWithViewAll(
                    title: "City",
                    showViewAll: true,
                    onViewAll: () {
                      Get.to(() => const MumbaiProjectsScreen());
                    },
                  ),
                  const SizedBox(height: 12),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,

                    padding: const EdgeInsets.only(left: 12.0),
                    child: Row(
                      children:
                          cities.map((city) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(
                                  () => AgentProfilePage(
                                    agent: AgentProfile(
                                      name: "Houselink Properties",
                                      logoUrl:
                                          "https://img.freepik.com/premium-vector/man-avatar-profile-picture-isolated-background-avatar-profile-picture-man_1293239-4866.jpg",
                                      badgeText: "HOUSING EXPERT PRO",
                                      buyersServed: "600+ Buyers Served",
                                      listings: "Owner Verified",
                                      description:
                                          "Deal with ready-to-move & under-construction Residential or Commercial.",
                                      infoTiles: [
                                        InfoTileData(
                                          title: "Leads",
                                          value: "120",
                                        ),
                                        InfoTileData(
                                          title: "Visiters",
                                          value: "54",
                                        ),
                                        InfoTileData(
                                          title: 'Impression',
                                          value: '258',
                                        ),
                                      ],
                                      areas: [
                                        "Ghatkopar East",
                                        "Vikhroli East",
                                      ],
                                      categories: [
                                        {'type': 'Buy', 'number': 17},
                                        {'type': 'Rent', 'number': 17},
                                        {'type': 'PG', 'number': 17},
                                        {'type': 'Commercial', 'number': 17},
                                      ],
                                      tags: [
                                        AgentTagData(
                                          icon: Icons.location_on,
                                          text: "Ghatkopar East",
                                          color: Colors.green,
                                        ),
                                      ],
                                      showTags: true,
                                      showAreas: false,
                                      isOwner: true,
                                      showActiveProperties: true,
                                      showSellerPropertyList: true,
                                    ),
                                  ),
                                );
                              },
                              child: CityCard(
                                imageUrl: city["imageUrl"],
                                cityName: city["cityName"],
                                propertyCount: city["propertyCount"],
                              ),
                            );
                          }).toList(),
                    ),
                  ),

                  // const SizedBox(height: 12),
                  //

                  // const CityFilterList(),
                  // const SizedBox(height: 12),
                  const SizedBox(height: 20),
                  const TitleWithViewAll(title: "Residential Properties"),
                  // const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      // Avoid scrolling conflict if inside scrollable
                      crossAxisCount: 2,
                      // Number of columns in the grid
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 170 / 125,
                      // Width / Height
                      // children: List.generate(images.length, (index) {
                      //   return NesticoPeBannerCardWithText(
                      //     height: 125,
                      //     width: 170,
                      //     imageUrl: images[index],
                      //     title: "Apartment",
                      //   );
                      // }),
                    ),
                  ),

                  const SizedBox(height: 20),

                  const TitleWithViewAll(title: "Explore by furnishing type"),
                  // const SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: List.generate(HomeScreen.banners.length, (
                          index,
                        ) {
                          return const Padding(
                            padding: EdgeInsets.only(right: 12),
                          );
                        }),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  const TitleWithViewAll(title: "Commercial offering"),
                  const SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: List.generate(HomeScreen.shops.length, (
                          index,
                        ) {
                          return const Padding(
                            padding: EdgeInsets.only(right: 12),
                            // child: NesticoPeBannerCardWithText(
                            //   height: 125,
                            //   width: 125,
                            //   imageUrl: shops[index],
                            //   title: "Retail Shop",
                            // ),
                          );
                        }),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  const TitleWithViewAll(title: "Find BHK?"),
                  const SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: List.generate(HomeScreen.plots.length * 2, (
                          index,
                        ) {
                          return const Padding(
                            padding: EdgeInsets.only(right: 12),
                            // child: NesticoPeBannerCardWithText(
                            //   height: 100,
                            //   width: 100,
                            //   imageUrl: bhk[index % 3],
                            //   title: "1BHK",
                            //   isCenterText: true,
                            // ),
                          );
                        }),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  const TitleWithViewAll(title: "Plots In Surat"),
                  const SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: List.generate(HomeScreen.plots.length, (
                          index,
                        ) {
                          return const Padding(
                            padding: EdgeInsets.only(right: 12),
                            // child: NesticoPeBannerCardWithText(
                            //   height: 125,
                            //   width: 200,
                            //   imageUrl: plots[index],
                            //   title: "Residential Plot",
                            // ),
                          );
                        }),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const TitleWithViewAll(
                    title: "Recommended Sellers",
                    showViewAll: true,
                  ),
                  const SizedBox(height: 12),

                  SellerListWidget(propertyList: dummySellerList),
                ],
              ),

              const SizedBox(height: 12),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: ReferralCard(referralCode: "089548"),
              ),
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: CustomerSupport(phoneNumber: "+912345654323"),
              ),
              const SizedBox(height: 8),
              // AgentCardGrid(),
              // FeedbackComponent(
              //   onSubmit: (rating, feedback) {
              //     print("Rating: $rating, Feedback: $feedback");
              //   },
              // ),
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
          initialValue: selectedCity,
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
              const Text(
                "Refer Friends",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: ColorRes.white,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: const Text(
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
                label: const Text(
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

class FeedbackComponent extends StatefulWidget {
  final Function(int rating, String feedback) onSubmit;

  const FeedbackComponent({super.key, required this.onSubmit});

  @override
  State<FeedbackComponent> createState() => _FeedbackComponentState();
}

class _FeedbackComponentState extends State<FeedbackComponent> {
  int _rating = 0;
  final TextEditingController _feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400, width: 1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Rate Our App",
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: ColorRes.primary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              "Rating ($_rating/5)",
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  onPressed: () {
                    setState(() {
                      _rating = index + 1;
                    });
                  },
                  icon: Icon(
                    Icons.star,
                    size: 32,
                    color:
                        index < _rating
                            ? ColorRes.primary
                            : Colors.grey.shade400,
                  ),
                );
              }),
            ),
            // Text(
            //   _rating == 0
            //       ? "Tap stars to rate"
            //       : "You rated $_rating star${_rating > 1 ? 's' : ''}",
            //   style: TextStyle(
            //     color: Colors.grey[800],
            //     fontSize: 13,
            //     fontWeight: FontWeight.w400,
            //   ),
            // ),
            const SizedBox(height: 10),

            TextField(
              controller: _feedbackController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Write your feedback...",
                hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[100],
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: ColorRes.primary),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_rating != 0 ||
                      _feedbackController.text.trim().isNotEmpty) {
                    widget.onSubmit(_rating, _feedbackController.text.trim());
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Feedback Submitted'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please add rating & feedback'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                    // toastification.show(
                    //   context: context,
                    //   title: Text('Please add rating & feedback'),
                    //   type: ToastificationType.error,
                    //   style: ToastificationStyle.flat,
                    //   autoCloseDuration: Duration(seconds: 2),
                    //   alignment: Alignment.topRight,
                    //   direction: TextDirection.ltr,
                    // );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorRes.primary,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Submit",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class LocationCard extends StatelessWidget {
//   final String title;
//   final double rating;
//   final int reviews;
//   final String price;
//   final String imageUrl;

//   const LocationCard({
//     super.key,
//     required this.title,
//     required this.rating,
//     required this.reviews,
//     required this.price,
//     required this.imageUrl,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.15),
//             blurRadius: 6,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(12),
//             child: Image.network(
//               imageUrl.isNotEmpty
//                   ? imageUrl
//                   : 'https://via.placeholder.com/150',
//               width: 80,
//               height: 80,
//               fit: BoxFit.cover,
//               errorBuilder:
//                   (context, error, stackTrace) => const Icon(
//                     Icons.broken_image,
//                     size: 50,
//                     color: Colors.grey,
//                   ),
//             ),
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 6),
//                 Row(
//                   children: [
//                     Icon(Icons.star, color: Colors.green[700], size: 18),
//                     const SizedBox(width: 4),
//                     Text(
//                       "$rating",
//                       style: const TextStyle(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 14,
//                       ),
//                     ),
//                     Text(
//                       " ($reviews reviews)",
//                       style: const TextStyle(color: Colors.grey, fontSize: 12),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 6),
//                 Text(
//                   price,
//                   style: const TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.deepPurple,
//                   ),
//                 ),
//                 const SizedBox(height: 6),
//                 GestureDetector(
//                   onTap: () {},
//                   child: const Text(
//                     "See all reviews",
//                     style: TextStyle(
//                       fontSize: 13,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.blue,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class PropertyHorizontalCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String location;
  final String price;

  // ✅ Font Weights
  final FontWeight priceFontWeight;
  final FontWeight locationWeight;
  final FontWeight titleFontWeight;

  // ✅ Layout
  final int maxLineTitle;
  final int maxLineSubtitle;
  final int maxLine;

  // ✅ Styling properties
  final Color borderColor;
  final Color textColor;
  final Color accentColor;
  final Color titleColor;
  final Color dividerColor;
  final Color locationColor;

  // ✅ Layout properties
  final double width;
  final double imageHeight;
  final double imageWidth;

  // ✅ Font sizes
  final double titleFontSize;
  final double locationFontSize;
  final double priceFontSize;

  // ✅ Rating
  final double? rating;
  final IconData ratingIcon;
  final Color ratingColor;

  // ✅ Button Row
  final String buttonText;
  final Color buttonTextColor;
  final double buttonFontSize;
  final FontWeight buttonFontWeight;
  final Color priceColor;
  final double ratingFont;
  final FontWeight ratingFontWeight;
  final IconData actionIcon;
  final Color iconColor;

  final bool showRowLayout;

  final VoidCallback? onTap;

  const PropertyHorizontalCard({
    super.key,
    required this.title,
    this.ratingFont = 11,
    this.ratingFontWeight = FontWeight.w600,
    this.locationColor = Colors.black54,
    required this.imagePath,
    required this.location,
    this.price = '2020',
    this.priceColor = Colors.black87,
    this.priceFontWeight = FontWeight.w700,
    this.locationWeight = FontWeight.w400,
    this.titleFontWeight = FontWeight.w600,
    this.maxLine = 2,
    this.maxLineTitle = 1,
    this.maxLineSubtitle = 1,

    // styling
    this.borderColor = Colors.grey,
    this.textColor = Colors.black,
    this.accentColor = Colors.blue,
    this.titleColor = Colors.black,
    this.dividerColor = Colors.grey,

    // layout (smaller container)
    this.width = 250,
    this.imageHeight = 60,
    this.imageWidth = 70,

    // font sizes (slightly smaller)
    this.titleFontSize = 12,
    this.locationFontSize = 9,
    this.priceFontSize = 12,

    // rating
    this.rating,
    this.ratingIcon = Icons.star,
    this.ratingColor = Colors.amber,

    // button row
    this.buttonText = "View",
    this.buttonTextColor = Colors.indigo,
    this.buttonFontSize = 11,
    this.buttonFontWeight = FontWeight.w500,
    this.actionIcon = Icons.arrow_forward_ios,
    this.iconColor = Colors.indigo,

    this.showRowLayout = true,

    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor.withOpacity(0.25), width: 0.7),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imagePath,
                height: imageHeight,
                width: imageWidth,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildCommonText(
                    title,
                    titleFontSize,
                    titleFontWeight,
                    textColor,
                    maxLineTitle,
                  ),
                  const SizedBox(height: 2),
                  buildCommonText(
                    location,
                    locationFontSize,
                    locationWeight,
                    locationColor,
                    maxLineSubtitle,
                  ),
                  const SizedBox(height: 4),
                  if (showRowLayout) ...[
                    Row(
                      children: [
                        buildCommonText(
                          Formatter.formatPrice(
                            double.tryParse(
                                  price.replaceAll(RegExp(r'[^\d.]'), ''),
                                )?.toInt() ??
                                0,
                          ),
                          priceFontSize,
                          priceFontWeight,
                          priceColor,
                          1,
                        ),
                        const Spacer(),
                        if (rating != null) ...[
                          Icon(ratingIcon, color: ratingColor, size: 14),
                          const SizedBox(width: 3),
                          buildCommonText(
                            rating.toString(),
                            ratingFont,
                            ratingFontWeight,
                            titleColor,
                            maxLine,
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 4),
                    Divider(
                      color: dividerColor.withOpacity(0.35),
                      thickness: 0.5,
                      height: 6,
                    ),
                    const SizedBox(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildCommonText(
                          buttonText,
                          buttonFontSize,
                          buttonFontWeight,
                          buttonTextColor,
                          1,
                        ),
                        const SizedBox(width: 3),
                        Icon(actionIcon, color: iconColor, size: 12),
                      ],
                    ),
                  ] else ...[
                    buildCommonText(
                      Formatter.formatPrice(
                        double.tryParse(
                              price.replaceAll(RegExp(r'[^\d.]'), ''),
                            )?.toInt() ??
                            0,
                      ),
                      priceFontSize,
                      priceFontWeight,
                      priceColor,
                      1,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewHighlights extends StatefulWidget {
  final List<String> goodThings;
  final List<String> improvements;

  const ReviewHighlights({
    super.key,
    required this.goodThings,
    required this.improvements,
  });

  @override
  State<ReviewHighlights> createState() => _ReviewHighlightsState();
}

class _ReviewHighlightsState extends State<ReviewHighlights> {
  bool showAllGood = false;
  bool showAllImprovements = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.goodThings.isNotEmpty)
            _buildTagSection(
              "Good Things",
              widget.goodThings,
              showAllGood,
              (value) => setState(() => showAllGood = value),
            ),
          if (widget.goodThings.isNotEmpty && widget.improvements.isNotEmpty)
            const SizedBox(height: 16),
          if (widget.improvements.isNotEmpty)
            _buildTagSection(
              "Need to Improve",
              widget.improvements,
              showAllImprovements,
              (value) => setState(() => showAllImprovements = value),
            ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _buildTagSection(
    String title,
    List<String> items,
    bool expanded,
    Function(bool) toggleExpand,
  ) {
    // show first 4 items unless expanded
    final displayItems = expanded ? items : items.take(3).toList();
    final remainingCount = items.length - displayItems.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
            color: ColorRes.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            ...displayItems.map(
              (e) => Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: ColorRes.grey.withOpacity(0.090),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  e,
                  style: const TextStyle(
                    fontSize: AppFontSizes.caption,
                    fontWeight: FontWeight.w500,
                    color: ColorRes.grey,
                  ),
                ),
              ),
            ),
            if (!expanded && remainingCount > 0)
              GestureDetector(
                onTap: () => toggleExpand(true),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "+$remainingCount more",
                    style: const TextStyle(
                      fontSize: AppFontSizes.caption,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget buildHeading(BuildContext context, String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}
