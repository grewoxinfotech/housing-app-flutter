import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:housing_flutter_app/app/constants/app_font_sizes.dart';
import 'package:housing_flutter_app/app/constants/color_res.dart';
import 'package:housing_flutter_app/app/constants/img_res.dart';
import 'package:housing_flutter_app/app/constants/size_manager.dart';
import 'package:housing_flutter_app/app/manager/icon_manager.dart';
import 'package:housing_flutter_app/app/manager/string_manager.dart';
import 'package:housing_flutter_app/app/utils/bottom_sheet_form.dart';
import 'package:housing_flutter_app/app/utils/dummy_data.dart';
import 'package:housing_flutter_app/app/utils/formater/formater.dart';
import 'package:housing_flutter_app/app/widgets/video_player/custom_video_player.dart';
import 'package:housing_flutter_app/modules/property/controllers/property_controller.dart';
import 'package:housing_flutter_app/modules/property/views/property_list_screen.dart';
import 'package:housing_flutter_app/modules/property/views/recommended_property.dart';

import 'package:housing_flutter_app/modules/search_property/view/search_screen.dart';
import 'package:housing_flutter_app/widgets/button/button.dart';
import 'package:video_player/video_player.dart';
import '../../../app/manager/property_detail_manager.dart';
import '../../../app/manager/property_highlight_manager.dart';
import '../../../app/widgets/texts/headline_text.dart';
import '../../../data/network/property/models/property_model.dart';
import '../../../utils/common_widget/rera_widget.dart';

class PropertyDetailScreen extends StatelessWidget {
  final Items? property;

  PropertyDetailScreen({super.key, this.property});
  final PropertyController controller = Get.put(PropertyController());

  @override
  Widget build(BuildContext context) {
    print("[DEBUG]=> Property : ${property?.toJson()}");
    print(
      "Proprty Features ${property?.propertyDetails?.amenities}  Property List${property?.propertyDetails}",
    );
    return Scaffold(
      backgroundColor: ColorRes.white,
      extendBody: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: kBottomNavigationBarHeight / 2),

          // prevents overlap
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildMediaBanner(property?.propertyMedia ?? PropertyMedia()),
              _buildTitleSection(property ?? Items()),
              Divider(indent: 18, endIndent: 18, color: Colors.grey.shade300),

              SizedBox(height: 12),
              TitleWithViewAll(title: 'Facilities'),
              SizedBox(height: 0),
              Facilities(property: property ?? Items()),
              SizedBox(height: 0),
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
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(height: 12),
                Divider(indent: 18, endIndent: 18, color: Colors.grey.shade300),
              ],

              SizedBox(height: 12),
              TitleWithViewAll(title: 'Location'),
              SizedBox(height: 12),
              AddressAndMapDetails(property: property!),
              Obx(() {
                if (controller.isDeveloper.value)
                  return SizedBox.shrink(); // hide if not developer

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 12),
                    Divider(
                      indent: 18,
                      endIndent: 18,
                      color: Colors.grey.shade300,
                    ),
                    SizedBox(height: 12),
                    TitleWithViewAll(title: 'Project Specification'),
                    SizedBox(height: 12),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Wrap(
                        spacing: 5,
                        runSpacing: 10,
                        children:
                            stats.map((stat) {
                              return StatCard(
                                title: stat["title"] as String,
                                value: stat["value"] as String,
                                subText: stat["subText"] as String?,
                                icon: stat["icon"] as IconData?,
                                iconColor: stat["iconColor"] as Color?,
                              );
                            }).toList(),
                      ),
                    ),
                    // SizedBox(height: 12),
                    // Divider(
                    //   indent: 18,
                    //   endIndent: 18,
                    //   color: Colors.grey.shade300,
                    // ),
                    SizedBox(height: 12),
                    // TitleWithViewAll(title: 'Premium projects nearby'),
                    // SizedBox(height: 12),
                    // ProjectDetails(
                    //   launchedDate: property?.lastRenewalDate ?? '',
                    //   maxPrice: 3.5,
                    //   minPrice: 1.8,
                    //   nearbyProjects: property?.nearbyLocations ?? [],
                    //   projectArea: 22,
                    //   projectName: "",
                    //   reraId: '322',
                    //   units: 256,
                    // ),
                    // SizedBox(height: 12),
                  ],
                );
              }),
              SizedBox(height: 12),
              Divider(indent: 18, endIndent: 18, color: Colors.grey.shade300),

              SizedBox(height: 8),
              TitleWithViewAll(title: 'Nearby Landmarks'),
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
              OwnerInformation(property: property!, controller: controller),
              SizedBox(height: 12),
              Divider(indent: 18, endIndent: 18, color: Colors.grey.shade300),
              SizedBox(height: 12),
              TitleWithViewAll(title: 'Check availability of Agent'),
              SizedBox(height: 12),
              ContactSellerCard(property: property ?? Items()),

              SizedBox(height: 12),
              Obx(() {
                if (!controller.isDeveloper.value)
                  return SizedBox.shrink(); // hide if not developer

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(
                      indent: 18,
                      endIndent: 18,
                      color: Colors.grey.shade300,
                    ),
                    SizedBox(height: 12),
                    TitleWithViewAll(title: 'Project Brochures'),
                    SizedBox(height: 12),
                    ProjectBrochure(
                      brochureImageUrl:
                          'https://cdn.dribbble.com/userupload/12289156/file/original-1b5719cd15e5e7e54052ebe7ed9ad2a7.jpg?resize=400x0',
                      brochureUrl: "",
                      totalPages: 4,
                    ),
                    SizedBox(height: 12),
                    Divider(
                      indent: 18,
                      endIndent: 18,
                      color: Colors.grey.shade300,
                    ),
                    SizedBox(height: 12),
                    TitleWithViewAll(title: 'Premium projects nearby'),
                    SizedBox(height: 12),
                    ProjectDetails(
                      launchedDate: property?.lastRenewalDate ?? '',
                      maxPrice: 3.5,
                      minPrice: 1.8,
                      nearbyProjects: property?.nearbyLocations ?? [],
                      projectArea: 22,
                      projectName: "",
                      reraId: '322',
                      units: 256,
                    ),
                    SizedBox(height: 12),
                    RecommendedInsights(
                      nearbyLocations: property!.nearbyLocations!,
                    ),
                  ],
                );
              }),
              // PropertyFeedbackComponent(
              //   onSubmit: (rating, feedback) {
              //     print("Rating: $rating, Feedback: $feedback");
              //   },
              // ),
              // SizedBox(height: 12),

              // Divider(indent: 18, endIndent: 18, color: Colors.grey.shade300),
              // SizedBox(height: 12),
              // TitleWithViewAll(title: 'Recommended Project', showViewAll: true),
              // SizedBox(height: 12),
              // RecommendedProperty(),
              Divider(indent: 18, endIndent: 18, color: Colors.grey.shade300),
              SizedBox(height: 12),
              TitleWithViewAll(title: 'Recommended Project', showViewAll: true),
              SizedBox(height: 12),
              RecommendedProperty(),
              SizedBox(height: 12),
              Divider(indent: 18, endIndent: 18, color: Colors.grey.shade300),
              SizedBox(height: 12),
              TitleWithViewAll(
                title: 'Better Price Property',
                showViewAll: true,
              ),
              SizedBox(height: 12),
              RecommendedProperty(),

              //SizedBox(height: 12),
              //const SizedBox(height: 12), // Extra spacing at bottom
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: PropertyBottomBar(
          financialInfo:
              property?.propertyDetails?.financialInfo ?? FinancialInfo(),
          // price: '₹ ${property?.propertyDetails?.financialInfo?.price ?? '0'}',
          onCallOwner: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder:
                  (context) => DraggableScrollableSheet(
                    expand: false,
                    initialChildSize: 0.85, // start with 85% of screen
                    minChildSize: 0.5,
                    maxChildSize: 0.85,
                    builder:
                        (context, scrollController) => SingleChildScrollView(
                          controller: scrollController,
                          child: Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                              left: 16,
                              right: 16,
                              top: 16,
                            ),
                            child: ContactOwnerBottom(
                              property: property ?? Items(),

                              // Optional: Customize texts
                              titleText: "Contact the Owner",
                              chatButtonText: "Chat via WhatsApp",
                              formTitle: "Quick Contact Form",
                              contactButtonText: "Send Request",

                              // Optional: Customize icons
                              nameIcon: Icons.person,
                              phoneIcon: Icons.phone,
                              emailIcon: Icons.email,

                              // Optional: Checkbox initial states
                              allowSellerContact: true,
                              homeLoanInterest: false,

                              // Callbacks
                              onChatPressed: () {
                                print("WhatsApp button clicked!");
                              },
                              onContactPressed: () {
                                // This triggers after validation
                                print("Contact Owner button clicked!");
                                // Access entered values if needed
                                // Example: use controller values
                                // name: widget._nameController.text
                              },
                              onAllowSellerContactChanged: (value) {
                                print("Allow sellers changed: $value");
                              },
                              onHomeLoanInterestChanged: (value) {
                                print("Home loan interest changed: $value");
                              },
                            ),
                          ),
                        ),
                  ),
            );
          },
          onScheduleVisit: () {},
        ),
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
    final videos = media.videos ?? [];
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
              /// Media (Image / Video)
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

              /// Back button
              Positioned(
                top: 16,
                left: 16,
                child: CircularIcon(
                  icon: Icons.arrow_back_rounded,
                  backgroundColor: Colors.white,
                  onPressed: () => Get.back(),
                ),
              ),

              /// Right side icons
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

              /// Page indicator
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

              /// 🔹 RERA Tag (Bottom Left inside image)
              // Positioned(
              //   bottom: 16,
              //   left: 16,
              //   child: Container(
              //     padding: const EdgeInsets.symmetric(
              //       horizontal: 8,
              //       vertical: 4,
              //     ),
              //     decoration: BoxDecoration(
              //       color: ColorRes.green.withOpacity(0.9),
              //       borderRadius: BorderRadius.circular(6),
              //     ),
              //     child: Row(
              //       mainAxisSize: MainAxisSize.min,
              //       children: [
              //         const Icon(Icons.verified, size: 14, color: Colors.white),
              //         const SizedBox(width: 4),
              //         const Text(
              //           "RERA",
              //           style: TextStyle(
              //             fontSize: 12,
              //             fontWeight: FontWeight.w600,
              //             color: Colors.white,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              Obx(() {
                return Positioned(
                  left: 16,
                  bottom: 16,
                  child: ReraComponent(
                    text: (!controller.isDeveloper.value) ? "Verified" : "rera",
                    backgroundColor: ColorRes.black.withOpacity(0.7),
                    textColor: ColorRes.background,
                    fontSize: AppFontSizes.small,

                    borderRadius: AppRadius.small,
                    fontWeight: AppFontWeights.bold,
                    showIcon: true,
                    iconColor: ColorRes.success,
                    iconSize: 14,
                  ),
                );
              }),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTitleSection(Items property) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 RERA Tag + Rating Row
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     // Left: RERA Tag
          //     Container(
          //       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          //       decoration: BoxDecoration(
          //         color: Colors.green.withOpacity(0.1),
          //         borderRadius: BorderRadius.circular(6),
          //         border: Border.all(color: Colors.green.shade400, width: 0.8),
          //       ),
          //       child: Row(
          //         mainAxisSize: MainAxisSize.min,
          //         children: [
          //           Icon(Icons.verified, size: 14, color: Colors.green.shade600),
          //           const SizedBox(width: 4),
          //           Text(
          //             "RERA",
          //             style: TextStyle(
          //               fontSize: 12,
          //               fontWeight: FontWeight.w600,
          //               color: Colors.green.shade700,
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //
          //     // Right: ⭐ Rating
          //     Container(
          //       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          //       // decoration: BoxDecoration(
          //       //   color: Colors.grey[200], // light gray background
          //       //   borderRadius: BorderRadius.circular(6), // rounded corners
          //       // ),
          //       child: Row(
          //         mainAxisSize: MainAxisSize.min,
          //         children:  [
          //           Icon(Icons.star, size: 16, color: Colors.amber),
          //           SizedBox(width: 4),
          //           Text(
          //             "4.5",
          //             style: TextStyle(
          //               fontSize: 14,
          //               fontWeight: FontWeight.w600,
          //               color: Colors.black,
          //             ),
          //           ),
          //           SizedBox(width: 4),
          //           Text(
          //             "(14 reviews)",
          //             style: TextStyle(
          //               fontSize: 11,
          //               fontWeight: FontWeight.w500,
          //               color: Colors.black.withOpacity(0.6),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //
          //
          //
          //   ],
          // ),

          //  const SizedBox(height: 6),

          // 🔹 Title
          Text(
            property.title ?? "-",
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: ColorRes.textPrimary,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 4),

          // 📍 Location Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Icon(
              //   Icons.location_on_rounded,
              //   size: 16,
              //   color: Colors.grey[600],
              // ),
              // const SizedBox(width: 4),
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

          // 🔹 Type + See on Map
          Row(
            children: [
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
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: ColorRes.primary,
                    ),
                  ),
                ),

              const Spacer(),

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
                    children: const [
                      Icon(
                        Icons.location_pin,
                        size: 16,
                        color: ColorRes.primary,
                      ),
                      SizedBox(width: 4),
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

  // Widget _buildTitleSection(Items property) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Row(
  //           crossAxisAlignment: CrossAxisAlignment.baseline,
  //           textBaseline: TextBaseline.alphabetic,
  //           children: [
  //             // Title
  //             Expanded(
  //               child: Text(
  //                 property.title ?? "-",
  //                 style: TextStyle(
  //                   fontSize: 17,
  //                   fontWeight: FontWeight.w600,
  //                   color: ColorRes.textPrimary,
  //                 ),
  //                 maxLines: 2,
  //                 overflow: TextOverflow.ellipsis,
  //               ),
  //             ),

  //             const SizedBox(width: 8),
  //             Row(
  //               children: [
  //                 Icon(Icons.star, size: 16, color: Colors.amber),
  //                 const SizedBox(width: 4),
  //                 Text(
  //                   "4.5",
  //                   style: TextStyle(
  //                     fontSize: 15,
  //                     fontWeight: FontWeight.w600,
  //                     color: Colors.black,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),

  //         const SizedBox(height: 4),
  //         Row(
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             // Icon(Icons.location_on_rounded, size: 16, color: Colors.grey[600]),
  //             // const SizedBox(width: 4),
  //             Expanded(
  //               child: Text(
  //                 '${property.city ?? '-'}, ${property.state ?? "-"}',
  //                 style: TextStyle(fontSize: 13, color: Colors.grey[600]),
  //                 overflow: TextOverflow.ellipsis,
  //               ),
  //             ),
  //           ],
  //         ),

  //         const SizedBox(height: 4),

  //         // Type + See on Map Row
  //         Row(
  //           children: [
  //             // Type Chip
  //             if (property.listingType != null)
  //               Container(
  //                 padding: const EdgeInsets.symmetric(
  //                   horizontal: 10,
  //                   vertical: 4,
  //                 ),
  //                 decoration: BoxDecoration(
  //                   color: ColorRes.primary.withOpacity(0.15),
  //                   borderRadius: BorderRadius.circular(AppRadius.small),
  //                 ),
  //                 child: Text(
  //                   property.listingType!.toUpperCase(),
  //                   style: TextStyle(
  //                     fontSize: 12,
  //                     fontWeight: FontWeight.w600,
  //                     color: ColorRes.primary,
  //                   ),
  //                 ),
  //               ),

  //             const Spacer(),

  //             // See on Map Button
  //             GestureDetector(
  //               onTap: () {
  //                 // TODO: Add map navigation logic
  //               },
  //               child: Container(
  //                 padding: const EdgeInsets.symmetric(
  //                   horizontal: 10,
  //                   vertical: 4,
  //                 ),
  //                 decoration: BoxDecoration(
  //                   color: ColorRes.primary.withOpacity(0.1),
  //                   borderRadius: BorderRadius.circular(AppRadius.small),
  //                 ),
  //                 child: Row(
  //                   mainAxisSize: MainAxisSize.min,
  //                   children: [
  //                     Icon(
  //                       Icons.location_pin,
  //                       size: 16,
  //                       color: ColorRes.primary,
  //                     ),
  //                     const SizedBox(width: 4),
  //                     Text(
  //                       "See on Map",
  //                       style: TextStyle(
  //                         fontSize: 12,
  //                         fontWeight: FontWeight.w600,
  //                         color: ColorRes.primary,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }

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
  final FinancialInfo financialInfo;
  // final String price;
  final VoidCallback onCallOwner;
  final VoidCallback onScheduleVisit;

  const PropertyBottomBar({
    super.key,
    // required this.price,
    required this.onCallOwner,
    required this.onScheduleVisit,
    required this.financialInfo,
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
                Formatter.formatPrice(financialInfo.price),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              GestureDetector(
                onTap: () {
                  Get.bottomSheet(
                    PricingBottomSheet(financialInfo: financialInfo),
                  );
                },
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

class PricingBottomSheet extends StatelessWidget {
  final FinancialInfo? financialInfo;
  const PricingBottomSheet({super.key, required this.financialInfo});

  @override
  Widget build(BuildContext context) {
    if (financialInfo == null) {
      return const SizedBox.shrink(); // nothing if null
    }

    final info = financialInfo!;

    // Build a list of rows dynamically
    final List<Widget> rows = [];

    if (_isValid(info.price)) {
      rows.add(_priceRow("Property Price", info.price.toStringAsFixed(2)));
    }
    if (_isValid(info.maintenance)) {
      rows.add(
        _priceRow(
          "Maintenance (Monthly)",
          info.maintenance!.toStringAsFixed(2),
        ),
      );
    }
    if (_isValid(info.propertyRentPerMonth)) {
      rows.add(
        _priceRow("Rent / Month", info.propertyRentPerMonth.toStringAsFixed(2)),
      );
    }
    if (_isValid(info.pricePerSqft)) {
      rows.add(
        _priceRow("Price per Sqft", info.pricePerSqft.toStringAsFixed(2)),
      );
    }
    if (_isValid(info.brokerCommission)) {
      rows.add(
        _priceRow(
          "Broker Commission",
          info.brokerCommission.toStringAsFixed(2),
        ),
      );
    }
    if (_isValid(info.propertySecurityDeposit)) {
      rows.add(
        _priceRow(
          "Security Deposit",
          _formatCurrency(info.propertySecurityDeposit),
        ),
      );
    }
    if (info.negotiable) {
      rows.add(_priceRow("Negotiable", "Yes"));
    }

    // Calculate total only if there are meaningful values
    final total = _totalPrice(info);
    if (total > 0) {
      rows.add(const Divider(height: 28));
      rows.add(
        _priceRow("Total Price", _formatCurrency(total), isHighlight: true),
      );
    }

    // If no rows, don’t show sheet
    if (rows.isEmpty) {
      return const SizedBox.shrink();
    }

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Drag Handle
            Center(
              child: Container(
                width: 40,
                height: 5,
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const Text(
              "Pricing Details",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: ColorRes.textPrimary,
              ),
            ),
            const SizedBox(height: 16),

            ...rows,

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _priceRow(String label, String value, {bool isHighlight = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isHighlight ? 16 : 14,
              fontWeight: isHighlight ? FontWeight.w600 : FontWeight.normal,
              color: isHighlight ? Colors.black : Colors.grey.shade700,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: isHighlight ? 16 : 14,
              fontWeight: isHighlight ? FontWeight.bold : FontWeight.w500,
              color: isHighlight ? Colors.green : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  bool _isValid(num? value) {
    return value != null && value > 0;
  }

  int _totalPrice(FinancialInfo info) {
    try {
      return (info.price +
              (info.brokerCommission) +
              (info.propertySecurityDeposit))
          .toInt();
    } catch (_) {
      return 0;
    }
  }

  static String _formatCurrency(num? value) {
    if (value == null || value == 0) return "—";
    return "₹${value.toStringAsFixed(0)}";
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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children:
            highlights.map((item) {
              final key = item.keys.first;
              final value = item.values.first;
              final icon = iconMap[key] ?? Icons.info_outline;

              return FacilitiesCard(
                label: "$value",
                icon: icon,
                bgColor: bgColor,
                foreColor: txtColor,
              );
            }).toList(),
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
      constraints: const BoxConstraints(
        minWidth: 80,
      ), // 👈 ensures small labels don't shrink too much
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: ColorRes.primary, width: 1),
        borderRadius: BorderRadius.circular(20), // pill-like
        color: Colors.white,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 16, color: ColorRes.primary),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              label,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis, // prevent overflow
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade800,
              ),
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

// class Details extends StatelessWidget {
//   final Items property;

//   const Details({super.key, required this.property});

//   @override
//   Widget build(BuildContext context) {
//     final manager = PropertyDetailManager(property);
//     final details = manager.getDetails(); // Returns List<Map<String, String>>

//     return ListView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       padding: const EdgeInsets.symmetric(horizontal: 24),
//       itemCount: details.length,
//       itemBuilder: (context, index) {
//         final entry = details[index];
//         final title = entry.keys.first;
//         final value = entry.values.first;

//         return Padding(
//           padding: const EdgeInsets.symmetric(vertical: 4),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 width: MediaQuery.of(context).size.width / 2.2,
//                 child: Text(
//                   title,
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
//                   value,
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
  final PropertyController controller = Get.put(PropertyController());

  Details({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    final manager = PropertyDetailManager(property);
    final details = manager.getDetails();

    return Obx(() {
      final isExpanded = controller.isExpanded.value;
      final visibleDetails = isExpanded ? details : details.take(4).toList();

      return Column(
        children: [
          // 🔹 Details Grid
          Wrap(
            spacing: 20,
            runSpacing: 12,
            children:
                visibleDetails.map((entry) {
                  final title = entry.keys.first;
                  final value = entry.values.first;

                  return SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 26,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[700],
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          value,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
          ),

          if (details.length > 4)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: GestureDetector(
                onTap: controller.lessOrReadMore,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isExpanded ? "Read Less" : "Read More",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue.shade600,
                      ),
                    ),
                    Icon(
                      isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.blue.shade600,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),
        ],
      );
    });
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
                  // color: bgColor,
                  color: ColorRes.overlay.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Icon(IconManager.getIcon(item), size: 16, color: txtColor),
                    // const SizedBox(width: 8),
                    Text(
                      StringManager.formatLabel(item) ?? ' -',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        // color: txtColor,
                        color: ColorRes.textColor,
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
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
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

  const NearbyPropertyDetails({super.key, required this.nearbyLocations});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.medium),
      child: SizedBox(
        height: 75, // slightly taller for balance
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: nearbyLocations.length,
          separatorBuilder: (context, index) => const SizedBox(width: 12),
          itemBuilder: (context, index) {
            final loc = nearbyLocations[index];

            return Container(
              margin: EdgeInsets.symmetric(vertical: AppPadding.small),
              padding: EdgeInsets.symmetric(
                horizontal: AppPadding.small,
                vertical: AppPadding.small,
              ),
              decoration: BoxDecoration(
                color: Colors.white, // ✅ soft background
                borderRadius: BorderRadius.circular(AppRadius.medium),
                border: Border.all(color: Colors.grey.shade300, width: 0.8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildCommonText(
                    loc.name ?? "-",
                    11,
                    AppFontWeights.medium,
                    ColorRes.textColor,
                    1,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 14,
                        color: ColorRes.grey.withOpacity(0.7),
                      ),
                      const SizedBox(width: 4),
                      buildCommonText(
                        (loc.distance != null) ? '${loc.distance}' : "2.5 Km",
                        AppFontSizes.extraSmall,
                        AppFontWeights.semiBold,
                        Colors.grey.shade600,
                        1,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class RecommendedInsights extends StatelessWidget {
  final List<NearbyLocations> nearbyLocations;

  const RecommendedInsights({super.key, required this.nearbyLocations});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.medium),
      child: SizedBox(
        height: 75, // slightly taller for balance
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: nearbyLocations.length,
          separatorBuilder: (context, index) => const SizedBox(width: 12),
          itemBuilder: (context, index) {
            final loc = nearbyLocations[index];

            return Container(
              margin: EdgeInsets.symmetric(vertical: AppPadding.small),
              padding: EdgeInsets.symmetric(
                horizontal: AppPadding.small,
                vertical: AppPadding.small,
              ),
              decoration: BoxDecoration(
                color: Colors.white, // ✅ soft background
                borderRadius: BorderRadius.circular(AppRadius.medium),
                border: Border.all(color: Colors.grey.shade300, width: 0.8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildCommonText(
                    loc.name ?? "-",
                    11,
                    AppFontWeights.medium,
                    ColorRes.textColor,
                    1,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 14,
                        color: ColorRes.grey.withOpacity(0.7),
                      ),
                      const SizedBox(width: 4),
                      buildCommonText(
                        (loc.distance != null) ? '${loc.distance}' : "2.5 Km",
                        AppFontSizes.extraSmall,
                        AppFontWeights.semiBold,
                        Colors.grey.shade600,
                        1,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class OwnerInformation extends StatelessWidget {
  final Items property;
  final PropertyController controller;

  const OwnerInformation({
    super.key,
    required this.property,
    required this.controller,
  });

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
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 18,
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
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 4),
                        if (property.ownerPhone != null)
                          Row(
                            children: [
                              // Icon(
                              //   Icons.phone_outlined,
                              //   size: 12,
                              //   color: Colors.grey,
                              // ),
                              // SizedBox(width: 6),
                              Text(
                                "+91 ${property.ownerPhone ?? '-'} ",
                                style: TextStyle(
                                  color: ColorRes.grey,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        if (property.ownerEmail != null)
                          Row(
                            children: [
                              // Icon(
                              //   Icons.email_outlined,
                              //   size: 12,
                              //   color: Colors.grey,
                              // ),
                              // SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  property.ownerEmail ?? '-',
                                  style: TextStyle(
                                    color: ColorRes.grey,
                                    fontSize: 10,
                                  ),
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
          SizedBox(height: 12),
          Obx(
            () => ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 40),
                backgroundColor:
                    controller.isDeveloper.value ? Colors.white : Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color:
                        controller.isDeveloper.value
                            ? ColorRes.primary
                            : ColorRes.primary,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: controller.checkTheSellerType,
              child: Text(
                controller.isDeveloper.value
                    ? "Chat with Developer"
                    : "Chat with Owner",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color:
                      controller.isDeveloper.value
                          ? ColorRes.primary
                          : ColorRes.primary,
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

// class ContactSellerCard extends StatelessWidget {
//   final Items property;
//   const ContactSellerCard({super.key, required this.property});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 12),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
//               child: Row(
//                 children: [
//                   CircleAvatar(
//                     radius: 18,
//                     backgroundImage: AssetImage(
//                       IMGRes.home2,
//                     ), // Use a real image or placeholder
//                     // backgroundColor: Colors.grey[300], // fallback if no image
//                   ),
//                   const SizedBox(width: 16),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           property.ownerName ?? "-",
//                           style: const TextStyle(
//                             fontSize: 12,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                         SizedBox(height: 4),
//                         if (property.ownerPhone != null)
//                           Row(
//                             children: [
//                               // Icon(
//                               //   Icons.phone_outlined,
//                               //   size: 12,
//                               //   color: Colors.grey,
//                               // ),
//                               // SizedBox(width: 6),
//                               Text(
//                                 "+91 ${property.ownerPhone ?? '-'} ",
//                                 style: TextStyle(
//                                   color: ColorRes.grey,
//                                   fontSize: 10,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         // if (property.ownerEmail != null)
//                         //   Row(
//                         //     children: [
//                         //       // Icon(
//                         //       //   Icons.email_outlined,
//                         //       //   size: 12,
//                         //       //   color: Colors.grey,
//                         //       // ),
//                         //       // SizedBox(width: 6),
//                         //       Expanded(
//                         //         child: Text(
//                         //           property.ownerEmail ?? '-',
//                         //           style: TextStyle(
//                         //             color: ColorRes.grey,
//                         //             fontSize: 10,
//                         //           ),
//                         //           overflow: TextOverflow.ellipsis,
//                         //         ),
//                         //       ),
//                         //     ],
//                         //   ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           // Checkboxes
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Checkbox(
//                     value: true,
//                     side: BorderSide(color: ColorRes.grey, width: 1),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(4),
//                     ),
//                     onChanged: (value) {},
//                     activeColor: ColorRes.primary,
//                   ),
//                   const Expanded(
//                     child: Text(
//                       "Allow sellers to get in touch",
//                       style: TextStyle(fontSize: 11),
//                     ),
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Checkbox(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(4),
//                     ),
//                     value: false,
//                     side: BorderSide(color: ColorRes.grey, width: 1),
//                     onChanged: (value) {},
//                     activeColor: ColorRes.primary,
//                   ),
//                   const Expanded(
//                     child: Text(
//                       "I am interested in Home loans",
//                       style: TextStyle(fontSize: 11),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//
//           const Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(Icons.thumb_up, size: 15, color: Colors.black54),
//               SizedBox(width: 6),
//               Text(
//                 "Perfect Choice! Users like you also liked this",
//                 style: TextStyle(
//                   fontSize: AppFontSizes.extraSmall,
//                   color: Colors.black54,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 12),
//
//           // Button
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               minimumSize: const Size(double.infinity, 40),
//               backgroundColor: ColorRes.primary,
//               padding: const EdgeInsets.symmetric(vertical: 14),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(16),
//               ),
//             ),
//             onPressed: () {},
//             child: Text(
//               "Check availability with seller",
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w600,
//                 color: ColorRes.white,
//               ),
//             ),
//           ),
//           const SizedBox(height: 12),
//         ],
//       ),
//     );
//   }
// }

class ContactSellerCard extends StatelessWidget {
  final Items property;
  final PropertyController controller = Get.put(PropertyController());

  ContactSellerCard({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Owner Info
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage(IMGRes.home2),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          property.ownerName ?? "-",
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        if (property.ownerPhone != null)
                          Text(
                            "+91 ${property.ownerPhone ?? '-'}",
                            style: TextStyle(
                              color: ColorRes.grey,
                              fontSize: 10,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 8),

          // Checkboxes using Obx
          Obx(
            () => Row(
              children: [
                Checkbox(
                  value: controller.allowContact.value,
                  onChanged:
                      (val) => controller.allowContact.value = val ?? false,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  side: BorderSide(color: ColorRes.grey, width: 1),
                  activeColor: ColorRes.primary,
                ),
                const Expanded(
                  child: Text(
                    "Allow sellers to get in touch",
                    style: TextStyle(fontSize: 11),
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () => Row(
              children: [
                Checkbox(
                  value: controller.interestedInHomeLoan.value,
                  onChanged:
                      (val) =>
                          controller.interestedInHomeLoan.value = val ?? false,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  side: BorderSide(color: ColorRes.grey, width: 1),
                  activeColor: ColorRes.primary,
                ),
                const Expanded(
                  child: Text(
                    "I am interested in Home loans",
                    style: TextStyle(fontSize: 11),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // Info Row
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.thumb_up, size: 15, color: Colors.black54),
              SizedBox(width: 6),
              Text(
                "Perfect Choice! Users like you also liked this",
                style: TextStyle(
                  fontSize: AppFontSizes.extraSmall,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 40),
              backgroundColor: ColorRes.primary,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: () {},
            child: const Text(
              "Check availability with seller",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: ColorRes.white,
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

class ProjectBrochure extends StatelessWidget {
  final String brochureImageUrl;
  final String brochureUrl;
  final int totalPages;

  const ProjectBrochure({
    super.key,
    required this.brochureImageUrl,
    required this.brochureUrl,
    this.totalPages = 9,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   "Project Brochure",
          //   style: Theme.of(context).textTheme.titleMedium,
          // ),
          // const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              border: Border.all(
                color: ColorRes.grey.withOpacity(0.6),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: AspectRatio(
                aspectRatio: 16 / 8,
                child: Stack(
                  children: [
                    Center(
                      child: Image.network(
                        brochureImageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        errorBuilder:
                            (context, error, stackTrace) => const Icon(
                              Icons.broken_image,
                              size: 50,
                              color: Colors.grey,
                            ),
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      left: 8,
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
                          "1/$totalPages",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorRes.primary,
                    ), // outline like OutlinedButton
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: InkWell(
                    onTap: () {
                      // Share action
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.share, size: 15, color: ColorRes.primary),
                          SizedBox(width: 8),
                          Text(
                            "Share",
                            style: TextStyle(
                              color: ColorRes.primary,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue, // same as ElevatedButton
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: InkWell(
                    onTap: () {
                      // TODO: Open PDF viewer or download
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.download, size: 15, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            "Download",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProjectDetails extends StatelessWidget {
  final String projectName;
  final double minPrice;
  final double maxPrice;
  final String launchedDate;
  final int units;
  final double projectArea;
  final String reraId;
  final List<NearbyLocations> nearbyProjects;

  const ProjectDetails({
    super.key,
    required this.projectName,
    required this.minPrice,
    required this.maxPrice,
    required this.launchedDate,
    required this.units,
    required this.projectArea,
    required this.reraId,
    required this.nearbyProjects,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 80,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: nearbyProjects.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final project = nearbyProjects[index];
                return Container(
                  margin: EdgeInsets.symmetric(vertical: AppPadding.small),
                  padding: EdgeInsets.symmetric(
                    horizontal: AppPadding.small,
                    vertical: AppPadding.small,
                  ),
                  decoration: BoxDecoration(
                    color: ColorRes.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color:
                          project.name == projectName
                              ? Colors.deepPurple
                              : Colors.grey.shade300,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        project.name!,
                        style: TextStyle(
                          fontSize: 11,
                          color: ColorRes.textColor,
                          fontWeight: AppFontWeights.medium,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        '${project.distance ?? '2.1 Km'}',
                        style: TextStyle(
                          color: ColorRes.grey,
                          fontSize: AppFontSizes.extraSmall,
                          fontWeight: AppFontWeights.semiBold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 16),
          // Additional Details
          Row(
            spacing: 25,
            children: [
              _detailItem("Launched in", 'Jul,2024'),
              _verticalDivider(),
              _detailItem("Units", units.toString()),
              _verticalDivider(),
              _detailItem("Project area", "$projectArea Acres"),
            ],
          ),
          const SizedBox(height: 12),
          // Text(
          //   "RERA ID: $reraId",
          //   style: TextStyle(
          //     color: Colors.black54,
          //     fontSize: AppFontSizes.small,
          //   ),
          // ),
          _detailItem("RERA ID", reraId),
          const SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: ColorRes.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.info_outline,
                  color: ColorRes.primary,
                  size: 18,
                ),
              ),
              SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: ColorRes.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.share,
                  color: ColorRes.primary,
                  size: 18,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: ColorRes.primary,
                    side: const BorderSide(color: ColorRes.primary, width: 1.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const Text(
                    "View More Details",
                    style: TextStyle(
                      fontWeight: AppFontWeights.semiBold,
                      fontSize: AppFontSizes.caption,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _detailItem(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 11, color: Colors.black54),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontWeight: AppFontWeights.semiBold,
            fontSize: AppFontSizes.small,
          ),
        ),
      ],
    );
  }

  Widget _verticalDivider() =>
      Container(height: 20, width: 1, color: Colors.grey);
}

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String? subText;
  final IconData? icon;
  final Color? iconColor;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    this.subText,
    this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 165, // fixed width for balance
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// Title
          buildCommonText(title, 12, FontWeight.w600, ColorRes.textColor, 1),
          SizedBox(height: 4),

          /// Value + optional icon + subtext
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(icon, color: iconColor ?? Colors.black, size: 15),
                SizedBox(width: 4),
              ],
              buildCommonText(
                value,
                11,
                FontWeight.w600,
                iconColor ?? Colors.black,
                1,
              ),
              if (subText != null) ...[
                SizedBox(width: 4),
                buildCommonText(
                  subText ?? '',
                  10,
                  FontWeight.normal,
                  Colors.grey,
                  1,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class PropertyFeedbackComponent extends StatefulWidget {
  final Function(int rating, String feedback) onSubmit;

  const PropertyFeedbackComponent({super.key, required this.onSubmit});

  @override
  State<PropertyFeedbackComponent> createState() =>
      _PropertyFeedbackComponentState();
}

class _PropertyFeedbackComponentState extends State<PropertyFeedbackComponent> {
  int _rating = 0;
  final TextEditingController _feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        padding: const EdgeInsets.all(16),
        // width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400, width: 1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Feedback Property",
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
              "Rating (${_rating}/5)",
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
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
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[100],
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorRes.primary),
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
                child: Text(
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
