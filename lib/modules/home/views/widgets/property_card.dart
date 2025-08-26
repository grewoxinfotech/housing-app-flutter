// import 'package:flutter/material.dart';
//
// import '../../../../app/constants/font_res.dart';
// import '../../../../widgets/display/crm_card.dart';
//
// class PropertyCard extends StatelessWidget {
//   final String imageUrl;
//   final String title;
//   final String price;
//   final String location;
//
//   const PropertyCard({
//     Key? key,
//     required this.imageUrl,
//     required this.title,
//     required this.price,
//     required this.location,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 200,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         color: Colors.white,
//         boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Property Image
//           Stack(
//             children: [
//               ClipRRect(
//                 borderRadius: const BorderRadius.vertical(
//                   top: Radius.circular(12),
//                 ),
//                 child: Image.asset(
//                   imageUrl,
//                   height: 120,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Positioned(
//                 left: 10,
//                 top: 10,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(6),
//                     color: Colors.white,
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 6,
//                       vertical: 3,
//                     ),
//                     child: Text(
//                       "Rent",
//                       style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               const Positioned(
//                 right: 10,
//                 top: 10,
//                 child: Icon(Icons.favorite_border, color: Colors.white),
//               ),
//             ],
//           ),
//
//           // Content Section
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 /// Title
//                 Text(
//                   title,
//                   style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 // const SizedBox(height: 6),
//
//                 /// Price & BHK
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Text(
//                         "₹ $price",
//                         style: TextStyle(
//                           color: Colors.green,
//
//                           fontWeight: FontWeight.w600,
//                         ),
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                     const SizedBox(width: 4),
//                     const Icon(Icons.hotel, size: 14, color: Colors.black54),
//                     const SizedBox(width: 4),
//                     Text(
//                       "4 BHK",
//                       style: TextStyle(fontWeight: FontWeight.w600),
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ],
//                 ),
//
//                 // const SizedBox(height: 6),
//
//                 /// Location
//                 Row(
//                   children: [
//                     const Icon(Icons.location_on, size: 14, color: Colors.grey),
//                     const SizedBox(width: 4),
//                     Expanded(
//                       child: Text(
//                         location,
//                         style: const TextStyle(
//                           color: Colors.grey,
//                           fontSize: 12,
//                         ),
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                   ],
//                 ),
//
//                 // const SizedBox(height: 6),
//
//                 /// Area
//                 Row(
//                   children: [
//                     const Icon(
//                       Icons.square_foot,
//                       size: 14,
//                       color: Colors.black54,
//                     ),
//                     const SizedBox(width: 4),
//                     Expanded(
//                       child: Text(
//                         "3000 sqft",
//                         style: TextStyle(overflow: TextOverflow.ellipsis),
//                         maxLines: 1,
//                       ),
//                     ),
//                   ],
//                 ),
//
//                 // const SizedBox(height: 6),
//
//                 /// Status
//                 Row(
//                   children: [
//                     const Icon(
//                       Icons.home_work,
//                       size: 14,
//                       color: Colors.black54,
//                     ),
//                     const SizedBox(width: 4),
//                     Expanded(
//                       child: Text(
//                         "Ready to Move",
//                         style: TextStyle(overflow: TextOverflow.ellipsis),
//                         maxLines: 1,
//                       ),
//                     ),
//                   ],
//                 ),
//
//                 const SizedBox(height: 10),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housing_flutter_app/app/constants/color_res.dart';
import 'package:housing_flutter_app/app/constants/size_manager.dart';
import 'package:housing_flutter_app/modules/home/views/property_detail_screen.dart';
import '../../../../app/constants/font_res.dart';

// class PropertyCard extends StatefulWidget {
//   final String imageUrl;
//   final String title;
//   final String price;
//   final String location;
//
//   PropertyCard({
//     Key? key,
//     required this.imageUrl,
//     required this.title,
//     required this.price,
//     required this.location,
//   }) : super(key: key);
//
//   @override
//   State<PropertyCard> createState() => _PropertyCardState();
// }
//
// class _PropertyCardState extends State<PropertyCard> {
//   bool isFavorite = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => Get.to(PropertyDetailScreen()),
//       child: Container(
//         width: double.infinity,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12),
//           boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // --- Image Section ---
//             Stack(
//               children: [
//                 ClipRRect(
//                   borderRadius: const BorderRadius.vertical(
//                     top: Radius.circular(12),
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(AppRadius.medium),
//                     child: Image.asset(
//                       widget.imageUrl,
//                       height: 120,
//                       width: double.infinity,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 //   Positioned(
//                 //     left: 10,
//                 //     top: 10,
//                 //     child: Container(
//                 //       padding: const EdgeInsets.symmetric(
//                 //         horizontal: 6,
//                 //         vertical: 3,
//                 //       ),
//                 //       decoration: BoxDecoration(
//                 //         color: Colors.white,
//                 //         borderRadius: BorderRadius.circular(6),
//                 //       ),
//                 //       child: const Text(
//                 //         "Rent",
//                 //         style: TextStyle(
//                 //           fontWeight: FontWeight.w500,
//                 //           fontSize: 12,
//                 //           color: Colors.black,
//                 //         ),
//                 //       ),
//                 //     ),
//                 //   ),
//                 //   const Positioned(
//                 //     right: 10,
//                 //     top: 10,
//                 //     child: Icon(Icons.favorite_border, color: Colors.white),
//                 //   ),
//               ],
//             ),
//
//             // --- Content Section ---
//             Padding(
//               padding: const EdgeInsets.all(12),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   /// Title
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Flexible(
//                         child: Text(
//                           widget.title,
//
//                           style: TextStyle(
//                             fontFamily: FontRes.poppins,
//                             fontWeight: FontWeight.w500,
//                             fontSize: 14,
//                             color: ColorRes.textPrimary,
//                           ),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                       SizedBox(width: 12),
//                       Container(
//                         padding: EdgeInsets.symmetric(
//                           vertical: 2,
//                           horizontal: 6,
//                         ),
//                         decoration: BoxDecoration(
//                           color: ColorRes.primary,
//                           borderRadius: BorderRadius.circular(AppRadius.small),
//                         ),
//                         child: Text(
//                           'Rent',
//                           style: Theme.of(context).textTheme.labelLarge!
//                               .copyWith(color: ColorRes.white),
//                         ),
//                       ),
//                     ],
//                   ),
//
//                   // const SizedBox(height: 6),
//
//                   /// Price & BHK
//                   Text(
//                     "4 BHK · ${widget.location} · 3000 sqft",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w400,
//                       fontSize: 12,
//                       color: ColorRes.textSecondary,
//                     ),
//                     overflow: TextOverflow.ellipsis,
//                   ),
//
//                   const SizedBox(height: 6),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Flexible(
//                         child: Text(
//                           "₹ ${widget.price}",
//
//                           style: const TextStyle(
//                             fontWeight: FontWeight.w600,
//                             color: Colors.green,
//                             fontSize: 18,
//                           ),
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                       SizedBox(width: 12),
//                       GestureDetector(
//                         child: Icon(
//                           isFavorite
//                               ? Icons.favorite_rounded
//                               : Icons.favorite_border_rounded,
//                           color: isFavorite ? Colors.red : Colors.grey,
//                         ),
//                         onTap: () {
//                           setState(() {
//                             isFavorite = !isFavorite;
//                           });
//                         },
//                       ),
//                     ],
//                   ),
//
//                   // /// Area
//                   // Row(
//                   //   children: [
//                   //     const Icon(
//                   //       Icons.square_foot,
//                   //       size: 14,
//                   //       color: Colors.black54,
//                   //     ),
//                   //     const SizedBox(width: 4),
//                   //     const Expanded(
//                   //       child: Text(
//                   //         "3000 sqft",
//                   //         maxLines: 1,
//                   //         overflow: TextOverflow.ellipsis,
//                   //         style: TextStyle(fontSize: 12),
//                   //       ),
//                   //     ),
//                   //   ],
//                   // ),
//                   //
//                   // const SizedBox(height: 6),
//                   //
//                   // /// Status
//                   // Row(
//                   //   children: [
//                   //     const Icon(
//                   //       Icons.home_work,
//                   //       size: 14,
//                   //       color: Colors.black54,
//                   //     ),
//                   //     const SizedBox(width: 4),
//                   //     const Expanded(
//                   //       child: Text(
//                   //         "Ready to Move",
//                   //         maxLines: 1,
//                   //         overflow: TextOverflow.ellipsis,
//                   //         style: TextStyle(fontSize: 12),
//                   //       ),
//                   //     ),
//                   //   ],
//                   // ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
class PropertyCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String price;
  final String location;

  PropertyCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.location,
  }) : super(key: key);

  @override
  State<PropertyCard> createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(PropertyDetailScreen()),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Image Section ---
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppRadius.medium),
                    child: Image.asset(
                      widget.imageUrl,
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                //   Positioned(
                //     left: 10,
                //     top: 10,
                //     child: Container(
                //       padding: const EdgeInsets.symmetric(
                //         horizontal: 6,
                //         vertical: 3,
                //       ),
                //       decoration: BoxDecoration(
                //         color: Colors.white,
                //         borderRadius: BorderRadius.circular(6),
                //       ),
                //       child: const Text(
                //         "Rent",
                //         style: TextStyle(
                //           fontWeight: FontWeight.w500,
                //           fontSize: 12,
                //           color: Colors.black,
                //         ),
                //       ),
                //     ),
                //   ),
                //   const Positioned(
                //     right: 10,
                //     top: 10,
                //     child: Icon(Icons.favorite_border, color: Colors.white),
                //   ),
                // Positioned(
                //   top: 10,
                //   right: 10,
                //   child: GestureDetector(
                //     child: Container(
                //       height: 30,
                //       width: 30,
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(
                //           AppRadius.extraLarge,
                //         ),
                //         color: Colors.white,
                //       ),
                //       child: Center(
                //         child: Icon(
                //           isFavorite
                //               ? Icons.favorite_rounded
                //               : Icons.favorite_border_rounded,
                //           color: isFavorite ? Colors.red : Colors.grey,
                //         ),
                //       ),
                //     ),
                //     onTap: () {
                //       setState(() {
                //         isFavorite = !isFavorite;
                //       });
                //     },
                //   ),
                // ),
                Positioned(
                  top: 5,
                  left: 5,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade800.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(AppRadius.small),
                    ),
                    child: Text(
                      'Rent',
                      style: Theme.of(
                        context,
                      ).textTheme.labelLarge!.copyWith(color: ColorRes.white),
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          AppRadius.extraLarge,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Icon(
                          isFavorite
                              ? Icons.favorite_rounded
                              : Icons.favorite_border_rounded,
                          color: isFavorite ? Colors.red : Colors.grey,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // --- Content Section ---
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          widget.title,

                          style: TextStyle(
                            fontFamily: FontRes.poppins,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: ColorRes.textPrimary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 12),
                      // Container(
                      //   padding: EdgeInsets.symmetric(
                      //     vertical: 2,
                      //     horizontal: 6,
                      //   ),
                      //   decoration: BoxDecoration(
                      //     color: ColorRes.primary,
                      //     borderRadius: BorderRadius.circular(AppRadius.small),
                      //   ),
                      //   child: Text(
                      //     'Rent',
                      //     style: Theme.of(context).textTheme.labelLarge!
                      //         .copyWith(color: ColorRes.white),
                      //   ),
                      // ),
                    ],
                  ),

                  // const SizedBox(height: 6),

                  /// Price & BHK
                  // Text(
                  //   "4 BHK · ${widget.location} · 3000 sqft",
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.w400,
                  //     fontSize: 12,
                  //     color: ColorRes.textSecondary,
                  //   ),
                  //   overflow: TextOverflow.ellipsis,
                  // ),
                  Text(
                    "4 BHK · 3000 sqft",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: ColorRes.textSecondary,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "${widget.location}",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: ColorRes.textSecondary,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          "₹ ${widget.price}",

                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.green,
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 12),
                    ],
                  ),

                  // /// Area
                  // Row(
                  //   children: [
                  //     const Icon(
                  //       Icons.square_foot,
                  //       size: 14,
                  //       color: Colors.black54,
                  //     ),
                  //     const SizedBox(width: 4),
                  //     const Expanded(
                  //       child: Text(
                  //         "3000 sqft",
                  //         maxLines: 1,
                  //         overflow: TextOverflow.ellipsis,
                  //         style: TextStyle(fontSize: 12),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  //
                  // const SizedBox(height: 6),
                  //
                  // /// Status
                  // Row(
                  //   children: [
                  //     const Icon(
                  //       Icons.home_work,
                  //       size: 14,
                  //       color: Colors.black54,
                  //     ),
                  //     const SizedBox(width: 4),
                  //     const Expanded(
                  //       child: Text(
                  //         "Ready to Move",
                  //         maxLines: 1,
                  //         overflow: TextOverflow.ellipsis,
                  //         style: TextStyle(fontSize: 12),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
