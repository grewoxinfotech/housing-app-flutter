// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:housing_flutter_app/app/constants/color_res.dart';
// import 'package:housing_flutter_app/app/constants/img_res.dart';
// import 'package:housing_flutter_app/app/constants/size_manager.dart';
// import '../../../../data/network/property/models/property_model.dart';
// import '../property_detail_screen.dart';

// class PropertyCard extends StatefulWidget {
//   final Items property;
//   // final String imageUrl;
//   // final String title;
//   // final String price;
//   // final String location;
//   final bool isRecentlyViewed;

//   const PropertyCard({
//     Key? key,
//     // required this.imageUrl,
//     // required this.title,
//     // required this.price,
//     // required this.location,
//     this.isRecentlyViewed = false,
//     required this.property,
//   }) : super(key: key);

//   @override
//   State<PropertyCard> createState() => _PropertyCardState();
// }

// class _PropertyCardState extends State<PropertyCard> {
//   bool isFavorite = false;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap:
//           () => Get.to(() => PropertyDetailScreen(property: widget.property)),
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 250),
//         curve: Curves.easeInOut,
//         width: 250,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(AppRadius.medium),
//           // boxShadow: [
//           //   BoxShadow(
//           //     color: Color(0x1f939393),
//           //     blurRadius: 6,
//           //     offset: const Offset(0, 0),
//           //   ),
//           // ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // 🔹 Image Section
//             ClipRRect(
//               borderRadius: const BorderRadius.vertical(
//                 top: Radius.circular(16),
//               ),
//               child: Stack(
//                 children: [
//                   widget.property.propertyMedia!.images!.isNotEmpty
//                       ? Image.network(
//                         widget.property.propertyMedia!.images!.first,
//                         height: 150,
//                         width: double.infinity,
//                         fit: BoxFit.cover,
//                       )
//                       : Image.asset(
//                         IMGRes.home1,
//                         height: 150,
//                         width: double.infinity,
//                         fit: BoxFit.cover,
//                       ),
//                   // Overlay gradient
//                   Container(
//                     height: 150,
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: [
//                           Colors.black.withOpacity(0.4),
//                           Colors.transparent,
//                         ],
//                         begin: Alignment.bottomCenter,
//                         end: Alignment.topCenter,
//                       ),
//                     ),
//                   ),

//                   // Rent Tag (top-left)
//                   Positioned(
//                     top: 10,
//                     left: 10,
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(
//                         vertical: 4,
//                         horizontal: 8,
//                       ),
//                       decoration: BoxDecoration(
//                         color: ColorRes.white,
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Text(
//                         widget.property.listingType ?? '-',
//                         style: TextStyle(
//                           color: ColorRes.primary,
//                           fontSize: 12,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                   ),

//                   // Favorite Button (top-right)
//                   Positioned(
//                     top: 10,
//                     right: 10,
//                     child: GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           isFavorite = !isFavorite;
//                         });
//                       },
//                       child: Container(
//                         height: 32,
//                         width: 32,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           shape: BoxShape.circle,
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.1),
//                               blurRadius: 4,
//                             ),
//                           ],
//                         ),
//                         child: Icon(
//                           isFavorite
//                               ? Icons.favorite_rounded
//                               : Icons.favorite_border_rounded,
//                           color: isFavorite ? Colors.red : Colors.grey,
//                           size: 18,
//                         ),
//                       ),
//                     ),
//                   ),

//                   // Recently Viewed Badge (bottom-left)
//                   if (widget.isRecentlyViewed) // only show if true
//                     Positioned(
//                       bottom: 10,
//                       left: 10,
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(
//                           vertical: 4,
//                           horizontal: 8,
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.black.withOpacity(0.7),
//                           borderRadius: BorderRadius.circular(6),
//                         ),
//                         child: const Text(
//                           "Recently Viewed",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 10,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ),
//                     ),
//                 ],
//               ),
//             ),

//             // 🔹 Content Section
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(12),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Title & Price
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: Text(
//                             widget.property.title ?? '-',
//                             style: const TextStyle(
//                               fontWeight: FontWeight.w600,
//                               fontSize: 14,
//                               color: Colors.black87,
//                             ),
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         Text(
//                           "₹ ${widget.property.propertyDetails?.financialInfo?.price ?? '0'}",
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                             color: ColorRes.primary,
//                           ),
//                         ),
//                       ],
//                     ),

//                     const SizedBox(height: 6),

//                     // Property Info
//                     // if (widget.property.propertyDetails?.bhk != null) ...[
//                     //   Text(
//                     //     "${widget.property.propertyDetails!.bhk} BHK · 3000 sqft",
//                     //     style: TextStyle(
//                     //       fontSize: 13,
//                     //       color: Colors.grey.shade700,
//                     //     ),
//                     //   ),
//                     // ],
//                     // Inside your property card
//                     if (widget.property.propertyDetails != null) ...[
//                       Text(
//                         [
//                           if (widget.property.propertyDetails!.bhk != null)
//                             "${widget.property.propertyDetails!.bhk} BHK",
//                           // if (widget.property.propertyDetails!.area != null)
//                           //   "${widget.property.propertyDetails!.area} sqft",
//                           if (widget
//                                   .property
//                                   .propertyDetails
//                                   ?.furnishInfo
//                                   ?.furnishType !=
//                               null)
//                             widget
//                                 .property
//                                 .propertyDetails!
//                                 .furnishInfo!
//                                 .furnishType,
//                           if (widget.property.propertyDetails?.propertyFacing !=
//                               null)
//                             widget.property.propertyDetails!.propertyFacing!,
//                           // if (widget.property.propertyDetails!.bathrooms != null)
//                           //   "${widget.property.propertyDetails!.bathrooms} Bath",
//                         ].join(" · "),
//                         style: TextStyle(
//                           fontSize: 12,
//                           color: Colors.grey.shade800,
//                           fontWeight: FontWeight.w500,
//                         ),
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ],

//                     const SizedBox(height: 4),

//                     Row(
//                       children: [
//                         Transform.translate(
//                           offset: const Offset(-2, 0), // move left by 2px
//                           child: const Icon(
//                             Icons.location_on_rounded,
//                             size: 14,
//                             color: ColorRes.grey,
//                           ),
//                         ),
//                         const SizedBox(width: 3),
//                         Expanded(
//                           child: Text(
//                             widget.property.address ?? '-',
//                             style: TextStyle(
//                               fontSize: 12,
//                               color: Colors.grey.shade600,
//                             ),
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildDetailChip(String text) {
//     return Text(
//       text,
//       style: TextStyle(
//         fontSize: 12,
//         color: Colors.grey.shade800,
//         fontWeight: FontWeight.w500,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housing_flutter_app/app/constants/color_res.dart';
import 'package:housing_flutter_app/app/constants/img_res.dart';
import 'package:housing_flutter_app/app/constants/size_manager.dart';
import 'package:housing_flutter_app/app/utils/formater/formater.dart';
import '../../../../data/network/property/models/property_model.dart';
import '../property_detail_screen.dart';

class PropertyCard extends StatefulWidget {
  final Items property;
  final bool isRecentlyViewed;

  const PropertyCard({
    Key? key,
    required this.property,
    this.isRecentlyViewed = false,
  }) : super(key: key);

  @override
  State<PropertyCard> createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => Get.to(() => PropertyDetailScreen(property: widget.property)),
      child: Container(
        width: 250,
        // margin: const EdgeInsets.only(right: 16, bottom: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppRadius.medium),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Image Section
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: Stack(
                children: [
                  widget.property.propertyMedia?.images?.isNotEmpty == true
                      ? Image.network(
                        widget.property.propertyMedia!.images!.first,
                        height: 160,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                      : Image.asset(
                        IMGRes.home1,
                        height: 160,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),

                  // Dark Gradient
                  Container(
                    height: 160,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.45),
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),

                  // 🔹 Rent Tag
                  Positioned(
                    top: 12,
                    left: 12,
                    child: _buildTag(widget.property.listingType ?? "-"),
                  ),

                  // 🔹 Favorite Button
                  Positioned(
                    top: 12,
                    right: 12,
                    child: GestureDetector(
                      onTap: () {
                        setState(() => isFavorite = !isFavorite);
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 15,

                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.grey,
                          size: 15,
                        ),
                      ),
                    ),
                  ),

                  // 🔹 Recently Viewed Badge
                  if (widget.isRecentlyViewed)
                    Positioned(
                      bottom: 12,
                      left: 12,
                      child: _buildBadge("Recently Viewed"),
                    ),
                ],
              ),
            ),

            // 🔹 Content Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title & Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.property.title ?? "-",
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Colors.black87,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "₹ ${widget.property.propertyDetails?.financialInfo?.price ?? '0'}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: ColorRes.primary,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  // Property Info Chips
                  if (widget.property.propertyDetails != null)
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        // spacing: 6,
                        // runSpacing: -4,
                        children: [
                          if (widget.property.propertyDetails?.bhk != null)
                            _buildChip(
                              "${widget.property.propertyDetails!.bhk} BHK",
                            ),
                          SizedBox(width: 6),
                          if (widget
                                  .property
                                  .propertyDetails
                                  ?.furnishInfo
                                  ?.furnishType !=
                              null)
                            _buildChip(
                              widget
                                      .property
                                      .propertyDetails
                                      ?.furnishInfo
                                      ?.furnishType ??
                                  '',
                            ),
                          SizedBox(width: 6),
                          if (widget.property.propertyDetails?.propertyFacing !=
                              null)
                            _buildChip(
                              widget.property.propertyDetails!.propertyFacing!,
                            ),
                        ],
                      ),
                    ),

                  const SizedBox(height: 8),

                  // Location
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_rounded,
                        size: 11,
                        color: ColorRes.grey,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          widget.property.address ?? "-",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey.shade700,
                          ),
                          maxLines: 1,
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
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: ColorRes.primary,
        ),
      ),
    );
  }

  Widget _buildBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: Colors.grey.shade800,
        ),
      ),
    );
  }
}
