// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:housing_flutter_app/app/constants/app_font_sizes.dart';
import 'package:housing_flutter_app/app/constants/color_res.dart';
import 'package:housing_flutter_app/app/constants/size_manager.dart';
import 'package:housing_flutter_app/utils/common_widget/rera_widget.dart';

class PropertyCardWidget extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String location;
  final String price;
  final String ownerName;
  final List<String> images;
  final String ownerAvatar;
  final String role;
  final String beds;

  final List<Map<String, dynamic>> apartments;
  final List<String> features;

  const PropertyCardWidget({
    super.key,
    required this.imageUrl,
    required this.features,
    required this.images,
    required this.apartments,
    required this.title,
    required this.location,
    required this.price,
    required this.ownerName,
    required this.ownerAvatar,
    required this.role,
    required this.beds,
  });

  @override
  State<PropertyCardWidget> createState() => _PropertyCardWidgetState();
}

class _PropertyCardWidgetState extends State<PropertyCardWidget> {
  int _currentImageIndex = 0;
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    print('Building PropertyCardWidget for ${widget.role}');
    return Card(
      color: ColorRes.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.medium),
        // ignore: deprecated_member_use
        // side: BorderSide(color: ColorRes.grey.withOpacity(0.4), width: 1),
      ),
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: AppPadding.small),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Stack(
          //   children: [
          //     ClipRRect(
          //       borderRadius: const BorderRadius.vertical(
          //         top: Radius.circular(12),
          //       ),

          //       child: CarouselSlider(
          //         items:
          //             widget.images.map((image) {
          //               return Builder(
          //                 builder: (BuildContext context) {
          //                   return Container(
          //                     width: double.infinity,
          //                     // margin: EdgeInsets.symmetric(horizontal: 5.0),
          //                     decoration: BoxDecoration(
          //                       color: Colors.grey.shade200,
          //                       borderRadius: BorderRadius.circular(12),
          //                       image: DecorationImage(
          //                         image: NetworkImage(image),
          //                         fit: BoxFit.cover,
          //                       ),
          //                     ),
          //                   );
          //                 },
          //               );
          //             }).toList(),

          //         options: CarouselOptions(
          //           autoPlay: false,
          //           enlargeCenterPage: true,
          //           viewportFraction: 1.0,
          //           aspectRatio: 2.2,
          //           initialPage: 2,
          //           onPageChanged: (index, reason) {
          //             setState(() {
          //               _currentImageIndex = index;
          //             });
          //           },
          //         ),
          //       ),
          //     ),
          //     if (widget.images.length > 1)
          //       Positioned(
          //         bottom: 8,
          //         right: 12,
          //         child: Container(
          //           padding: const EdgeInsets.symmetric(
          //             horizontal: AppPadding.small,
          //             vertical: 4,
          //           ),
          //           decoration: BoxDecoration(
          //             // ignore: deprecated_member_use
          //             color: Colors.black.withOpacity(0.8),
          //             borderRadius: BorderRadius.circular(AppRadius.small),
          //           ),
          //           child: Text(
          //             '${_currentImageIndex + 1}/${widget.images.length}',
          //             style: const TextStyle(
          //               color: Colors.white,
          //               fontSize: AppFontSizes.extraSmall,
          //               fontWeight: AppFontWeights.semiBold,
          //             ),
          //           ),
          //         ),
          //       ),

          //     Positioned(
          //       left: 12,
          //       bottom: 8,
          //       child: ReraComponent(
          //         text:
          //             (widget.role.trim().toLowerCase() == 'owner')
          //                 ? "Verified"
          //                 : "RERA",
          //         // ignore: deprecated_member_use
          //         backgroundColor: ColorRes.black.withOpacity(0.8),
          //         textColor: ColorRes.background,
          //         fontSize: AppFontSizes.extraSmall,
          //         borderRadius: AppRadius.small,
          //         fontWeight: AppFontWeights.bold,
          //         showIcon: true,
          //         iconColor: ColorRes.success,
          //         iconSize: 13,
          //       ),
          //     ),
          //     const Positioned(
          //       top: 12,
          //       right: 12,
          //       child: CircleAvatar(
          //         radius: AppRadius.mediumLarge,
          //         backgroundColor: Colors.white,
          //         child: Icon(
          //           Icons.favorite_border,
          //           color: ColorRes.primary,
          //           size: 20,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          Stack(
            children: [
              SizedBox(
                height: 138, // adjust height as needed
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(
                    horizontal: AppPadding.small,
                    vertical: AppPadding.small,
                  ),
                  itemCount: widget.images.length,
                  separatorBuilder:
                      (context, index) =>
                          const SizedBox(width: 6), // gap between images
                  itemBuilder: (context, index) {
                    return Container(
                      width:
                          MediaQuery.of(context).size.width / 2 -
                          2, // show 2 images
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: NetworkImage(widget.images[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),

              // if (widget.images.length > 1)
              //   Positioned(
              //     bottom: 8,
              //     right: 12,
              //     child: Container(
              //       padding: const EdgeInsets.symmetric(
              //         horizontal: AppPadding.small,
              //         vertical: 4,
              //       ),
              //       decoration: BoxDecoration(
              //         color: Colors.black.withOpacity(0.8),
              //         borderRadius: BorderRadius.circular(AppRadius.small),
              //       ),
              //       child: Text(
              //         '${_currentImageIndex + 1}/${widget.images.length}',
              //         style: const TextStyle(
              //           color: Colors.white,
              //           fontSize: AppFontSizes.extraSmall,
              //           fontWeight: AppFontWeights.semiBold,
              //         ),
              //       ),
              //     ),
              //   ),
              Positioned(
                left: 14,
                bottom: 14,
                child: ReraComponent(
                  text:
                      (widget.role.trim().toLowerCase() == 'owner')
                          ? "Verified"
                          : "rera",
                  backgroundColor: ColorRes.black.withOpacity(0.5),
                  textColor: ColorRes.background,
                  fontSize: AppFontSizes.extraSmall,

                  borderRadius: AppRadius.small,
                  fontWeight: AppFontWeights.bold,
                  showIcon: true,
                  iconColor: ColorRes.success,
                  iconSize: 13,
                ),
              ),

              Positioned(
                top: 16,
                right: 16,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: Colors.white,
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: ColorRes.primary,
                      size: 17,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // SizedBox(height: AppSpacing.small),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.small),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: AppFontSizes.medium,
                      fontWeight: AppFontWeights.semiBold,
                      color: ColorRes.textColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.small),
            child: Row(
              children: [
                // const Icon(Icons.location_on, size: 16, color: Colors.grey),
                Expanded(
                  child: Text(
                    widget.location,
                    style: const TextStyle(
                      color: ColorRes.grey,
                      fontSize: AppFontSizes.extraSmall,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: AppSpacing.small),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.small),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // const SizedBox(width: 13),
                  ...List.generate(
                    widget.apartments.length,
                    (index) => Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              widget.apartments[index]['bhk'],
                              style: const TextStyle(
                                fontSize: AppFontSizes.caption,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              widget.apartments[index]['priceRange'],
                              style: TextStyle(
                                fontSize:
                                    (widget.role.trim().toLowerCase() ==
                                            'owner')
                                        ? AppFontSizes.body
                                        : AppFontSizes.caption,
                                fontWeight:
                                    (widget.role.trim().toLowerCase() ==
                                            'owner')
                                        ? AppFontWeights.bold
                                        : AppFontWeights.semiBold,
                                color: ColorRes.textColor,
                              ),
                            ),
                          ],
                        ),
                        if (index != widget.apartments.length - 1) ...[
                          const SizedBox(width: 12),
                          Container(
                            height: 25,
                            width: 1,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(width: 12),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.small),
            child: SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: widget.features.length,
                itemBuilder: (context, index) {
                  final feature = widget.features[index];
                  return Container(
                    margin: const EdgeInsets.only(top: 8, bottom: 8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.small,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(AppRadius.small),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          feature,
                          style: const TextStyle(
                            fontSize: AppFontSizes.extraSmall,
                            color: ColorRes.textDisabled,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 8),
              ),
            ),
          ),

          Divider(
            height: 15,
            color: Colors.grey.shade300,
            indent: 12,
            endIndent: 12,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.small),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorRes.primary, width: 2),
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(widget.ownerAvatar),
                    radius: 13,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.ownerName,
                        style: const TextStyle(
                          fontSize: AppFontSizes.small,
                          fontWeight: FontWeight.w500,
                          color: ColorRes.textColor,
                        ),
                      ),
                      Text(
                        widget.role,
                        style: const TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w400,
                          color: ColorRes.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.small,
                    vertical: AppPadding.small,
                  ),
                  decoration: BoxDecoration(
                    color: ColorRes.primary,
                    borderRadius: BorderRadius.circular(AppRadius.small),
                  ),
                  child: const Icon(
                    Icons.call,
                    color: ColorRes.background,
                    size: AppFontSizes.medium,
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.small,
                    vertical: AppPadding.small,
                  ),
                  decoration: BoxDecoration(
                    // color: ColorRes.primary,
                    border: Border.all(color: ColorRes.primary, width: 1.5),
                    borderRadius: BorderRadius.circular(AppRadius.small),
                  ),
                  child: const Text(
                    "View Details",
                    style: TextStyle(
                      color: ColorRes.primary,
                      fontSize: AppFontSizes.extraSmall,
                      fontWeight: AppFontWeights.semiBold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.small),
        ],
      ),
    );
  }
}
