// import 'package:flutter/material.dart';
// import 'package:housing_flutter_app/app/constants/font_res.dart';
//
// class CrmBannerCardWithText extends StatelessWidget {
//   final String imageUrl;
//   final String title;
//   final String? description;
//   final double width;
//   final double height;
//   final double? borderRadius;
//   final EdgeInsetsGeometry? padding;
//   final bool? isCenterText;
//
//   const CrmBannerCardWithText({
//     super.key,
//     required this.imageUrl,
//     required this.title,
//     this.borderRadius = 12.0,
//     this.padding,
//     this.width = 200,
//     this.height = 100,
//     this.description,
//     this.isCenterText,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: height,
//       width: width,
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(borderRadius!),
//         child: Stack(
//           children: [
//             /// Background Image
//             Positioned.fill(child: Image.asset(imageUrl, fit: BoxFit.cover)),
//
//             /// Gradient shadow at bottom
//             Positioned.fill(
//               child: Container(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [Colors.transparent, Colors.black.withOpacity(0.9)],
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                   ),
//                 ),
//               ),
//             ),
//
//             /// Text at the bottom
//             Positioned(
//               left: 0,
//               right: 0,
//               bottom: 0,
//               child: Padding(
//                 padding:
//                     padding ??
//                     const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       title,
//                       style: Theme.of(context).textTheme.titleMedium?.copyWith(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     if (description != null)
//                       Text(
//                         description!,
//                         style: Theme.of(
//                           context,
//                         ).textTheme.labelMedium?.copyWith(
//                           color: Colors.white,
//                           fontFamily: FontRes.nuNunitoSans,
//                           fontWeight: FontWeight.w500,
//                         ),
//                         maxLines: 1,
//                       ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:housing_flutter_app/app/constants/font_res.dart';

class CrmBannerCardWithText extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String? description;
  final double width;
  final double height;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final bool? isCenterText;

  const CrmBannerCardWithText({
    super.key,
    required this.imageUrl,
    required this.title,
    this.description,
    this.borderRadius = 12.0,
    this.padding,
    this.width = 200,
    this.height = 100,
    this.isCenterText = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius!),
        child: Stack(
          children: [
            /// Background Image
            Positioned.fill(child: Image.asset(imageUrl, fit: BoxFit.cover)),

            /// Gradient Shadow Overlay
            isCenterText == true
                ? Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.45),
                          Colors.black.withOpacity(0.65),
                          Colors.black.withOpacity(0.75),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                )
                : Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.85),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),

            /// Text (Bottom or Center based on isCenterText)
            isCenterText == true
                ? Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding:
                          padding ??
                          const EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 8,
                          ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            title,
                            style: Theme.of(
                              context,
                            ).textTheme.titleMedium?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          if (description != null)
                            Text(
                              description!,
                              style: Theme.of(
                                context,
                              ).textTheme.labelMedium?.copyWith(
                                color: Colors.white,

                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                        ],
                      ),
                    ),
                  ),
                )
                : Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Padding(
                    padding:
                        padding ??
                        const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 12,
                        ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          title,
                          style: Theme.of(
                            context,
                          ).textTheme.titleSmall?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (description != null)
                          Text(
                            description!,
                            style: Theme.of(
                              context,
                            ).textTheme.labelSmall?.copyWith(
                              color: Colors.white,

                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                      ],
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
