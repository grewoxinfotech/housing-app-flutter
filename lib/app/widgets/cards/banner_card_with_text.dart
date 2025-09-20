import 'dart:math';
import 'package:flutter/material.dart';
import 'package:housing_flutter_app/app/constants/color_res.dart';

class NesticoPeBannerCardWithText extends StatelessWidget {
  final String imageUrl;
  final String price;
  final String location;
  final String propertySize;
  final double width;
  final double height;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final bool isCenterText;
  final int titleMaxLines;
  final int descriptionMaxLines;
  final String developersName;

  const NesticoPeBannerCardWithText({
    super.key,
    required this.imageUrl,
    required this.price,
    required this.location,
    required this.propertySize,
    this.borderRadius = 12.0,
    this.padding,
    this.width = 200,
    this.height = 100,
    this.isCenterText = false,
    this.titleMaxLines = 1,
    this.descriptionMaxLines = 2,
    this.developersName = "Grewox Developers",
  });

  /// 🔹 Pick random color from 5 predefined colors
  Color getRandomAvatarColor() {
    final colors = [
      ColorRes.primary,
      Colors.redAccent,
      Colors.green,
      Colors.orange,
      Colors.purple,
    ];
    return colors[Random().nextInt(colors.length)];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Stack(
          children: [
            /// Background Image
            Positioned.fill(child: Image.asset(imageUrl, fit: BoxFit.cover)),

            /// Gradient Overlay
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors:
                        isCenterText
                            ? [
                              Colors.black.withOpacity(0.45),
                              Colors.black.withOpacity(0.65),
                              Colors.black.withOpacity(0.75),
                            ]
                            : [
                              Colors.transparent,
                              Colors.black.withOpacity(0.85),
                            ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),

            /// 🔹 Profile with name at the top
            Positioned(
              top: 8,
              left: 8,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: getRandomAvatarColor(), // random color
                    child: Text(
                      developersName
                          .substring(0, 1)
                          .toUpperCase(), // First letter
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    developersName,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            /// 🔹 Bottom Info Section
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Padding(
                padding:
                    padding ??
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// Title
                    // Text(
                    //   title,
                    //   style: Theme.of(context)
                    //       .textTheme
                    //       .titleSmall
                    //       ?.copyWith(
                    //     color: Colors.white,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    //   maxLines: titleMaxLines,
                    //   overflow: TextOverflow.ellipsis,
                    // ),
                    //
                    // /// Description (optional)
                    // if (description != null && description!.isNotEmpty)
                    //   Text(
                    //     description!,
                    //     style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    //       color: Colors.white70,
                    //       fontWeight: FontWeight.w400,
                    //     ),
                    //     maxLines: descriptionMaxLines,
                    //     overflow: TextOverflow.ellipsis,
                    //   ),
                    const SizedBox(height: 4),

                    /// 🔹 Price (bold)
                    Text(
                      price,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    /// 🔹 Location
                    Text(
                      location,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white70,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),

                    /// 🔹 Size (BHK)
                    Text(
                      propertySize,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ColorRes.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        overflow: TextOverflow.ellipsis,
                      ),
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

// class NesticoPeCardWithText extends StatelessWidget {
//   final String imageUrl;
//   final String title;
//   final double height;
//   final double width;
//   // final Color opacity;
//
//   const NesticoPeCardWithText({
//     super.key,
//     required this.imageUrl,
//     required this.title,
//     this.height = 180, // default height
//     this.width = 160,
//     // required this.opacity, // default width
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: height,
//       width: width,
//       clipBehavior: Clip.antiAlias,
//       decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
//       child: Stack(
//         children: [
//           // Background image
//           Positioned.fill(child: Image.asset(imageUrl, fit: BoxFit.cover)),
//
//           // Gradient overlay (top area only)
//           Positioned.fill(
//             child: Container(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Colors.black.withOpacity(0.7), Colors.transparent],
//                   // colors: [Colors.black.withOpacity(0.7), Colors.transparent],
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                 ),
//               ),
//             ),
//           ),
//
//           // Title at top
//           Positioned(
//             top: 10,
//             left: 10,
//             // right: 8,
//             child: Text(
//               title,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 14,
//                 fontWeight: FontWeight.w500,
//               ),
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class NesticoPeCardWithText extends StatelessWidget {
//   final String imageUrl;
//   final String title;
//   final double height;
//   final double width;
//   final Color opacity;
//
//   const NesticoPeCardWithText({
//     super.key,
//     required this.imageUrl,
//     required this.title,
//     this.height = 200,
//     this.width = 160,
//     required this.opacity,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: height,
//       width: width,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         color: opacity, // background color
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 6,
//             offset: const Offset(2, 4),
//           ),
//         ],
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(16),
//         child: Stack(
//           children: [
//             // Background color
//             Container(height: height / 3, color: opacity),
//
//             // Image with soft fade on top edge
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: ShaderMask(
//                 shaderCallback: (rect) {
//                   return const LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [
//                       Colors.transparent, // fades into background
//                       Colors.black, // keeps image visible
//                     ],
//                   ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
//                 },
//                 blendMode: BlendMode.dstIn,
//                 child: Image.asset(
//                   imageUrl,
//                   height: height * 0.55,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//
//             // Title
//             Positioned(
//               top: 16,
//               left: 20,
//               // right: 12,
//               child: SizedBox(
//                 width: width - 20,
//                 child: Text(
//                   title,
//
//                   style: const TextStyle(
//                     color: Color(0xFF1A1A1A),
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class NesticoPeCardWithText extends StatelessWidget {
//   final String? imageUrl; // optional
//   final String title;
//   final double height;
//   final double width;
//   final Color opacity;
//
//   const NesticoPeCardWithText({
//     super.key,
//     this.imageUrl,
//     required this.title,
//     this.height = 200,
//     this.width = 160,
//     required this.opacity,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final hasImage = imageUrl != null && imageUrl!.isNotEmpty;
//
//     return Container(
//       height: height,
//       width: width,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         color: opacity, // fallback background color
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 6,
//             offset: const Offset(2, 4),
//           ),
//         ],
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(16),
//         child: Stack(
//           children: [
//             // ✅ Background: image if available, else just color
//             if (hasImage)
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: ShaderMask(
//                   shaderCallback: (rect) {
//                     return const LinearGradient(
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                       colors: [Colors.transparent, Colors.black],
//                     ).createShader(
//                       Rect.fromLTRB(0, 0, rect.width, rect.height),
//                     );
//                   },
//                   blendMode: BlendMode.dstIn,
//                   child: Image.asset(
//                     imageUrl!,
//                     height: height * 0.7,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               )
//             else
//               Container(color: opacity),
//
//             // ✅ Title placement
//             if (hasImage)
//               Positioned(
//                 top: 16,
//                 left: 20,
//                 child: SizedBox(
//                   width: width - 20,
//                   child: Text(
//                     title,
//                     style: const TextStyle(
//                       color: Color(0xFF1A1A1A),
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//               )
//             else
//               Center(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8),
//                   child: Text(
//                     title,
//                     textAlign: TextAlign.center,
//                     style: const TextStyle(
//                       color: Color(0xFF1A1A1A),
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class NesticoPeCardWithText extends StatelessWidget {
//   final String? imageUrl; // optional
//   final String title;
//   final double height;
//   final double width;
//   final Color opacity;
//
//   const NesticoPeCardWithText({
//     super.key,
//     this.imageUrl,
//     required this.title,
//     this.height = 200,
//     this.width = 160,
//     required this.opacity,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final hasImage = imageUrl != null && imageUrl!.isNotEmpty;
//
//     return Container(
//       height: height,
//       width: width,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         color: opacity, // fallback background color
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 6,
//             offset: const Offset(2, 4),
//           ),
//         ],
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(16),
//         child: Stack(
//           children: [
//             // 1️⃣ Image or fallback color
//             if (hasImage)
//               Image.asset(
//                 imageUrl!,
//                 height: height,
//                 width: width,
//                 fit: BoxFit.cover,
//               )
//             else
//               Container(color: opacity),
//
//             // 2️⃣ Top color overlay with smooth fade into image
//             if (hasImage)
//               Container(
//                 height: height,
//                 width: width,
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     stops: [0.2, 0.3, 0.4, 0.5, 0.7, 0.9, 1.0],
//                     colors: [
//                       opacity, // full color at very top
//                       opacity.withOpacity(0.9),
//                       opacity.withOpacity(0.7),
//                       opacity.withOpacity(0.5),
//                       opacity.withOpacity(0.3),
//                       opacity.withOpacity(0.1),
//                       Colors.transparent, // fully transparent at bottom
//                     ],
//                   ),
//                 ),
//               ),
//
//             // 3️⃣ Title placement
//             if (hasImage)
//               Positioned(
//                 top: 16,
//                 left: 20,
//                 child: SizedBox(
//                   width: width - 20,
//                   child: Text(
//                     title,
//                     style: const TextStyle(
//                       color: Color(0xFF1A1A1A),
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//               )
//             else
//               Center(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8),
//                   child: Text(
//                     title,
//                     textAlign: TextAlign.center,
//                     style: const TextStyle(
//                       color: Color(0xFF1A1A1A),
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class NesticoPeCardWithText extends StatelessWidget {
//   final String? imageUrl; // optional
//   final String title;
//   final double height;
//   final double width;
//   final Color opacity;
//
//   const NesticoPeCardWithText({
//     super.key,
//     this.imageUrl,
//     required this.title,
//     this.height = 200,
//     this.width = 160,
//     required this.opacity,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final textColor = getTextColor(opacity);
//
//     return Container(
//       height: height,
//       width: width,
//       decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(16),
//         child: Stack(
//           children: [
//             // Image or fallback color
//             Image.asset(
//               imageUrl!,
//               height: height,
//               width: width,
//               fit: BoxFit.cover,
//             ),
//
//             // Top color overlay with smooth fade into image
//             Container(
//               height: height,
//               width: width,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   stops: [0.3, 0.4, 0.5, 0.6, 0.7, 0.9, 1.0],
//                   colors: [
//                     opacity,
//                     opacity.withOpacity(0.9),
//                     opacity.withOpacity(0.7),
//                     opacity.withOpacity(0.5),
//                     opacity.withOpacity(0.3),
//                     opacity.withOpacity(0.1),
//                     Colors.transparent,
//                   ],
//                 ),
//               ),
//             ),
//
//             // Title placement
//             Positioned(
//               top: 16,
//               left: 20,
//               child: SizedBox(
//                 width: width - 20,
//                 child: Text(
//                   title,
//                   style: TextStyle(
//                     color: textColor,
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Helper to determine text color based on background brightness
//   Color getTextColor(Color background) {
//     return background.computeLuminance() > 0.5 ? Colors.black : Colors.white;
//   }
// }

class NesticoPeCardWithText extends StatelessWidget {
  final String? imageUrl; // optional
  final String title;
  final double height;
  final double width;
  final Color opacity;

  const NesticoPeCardWithText({
    super.key,
    this.imageUrl,
    required this.title,
    this.height = 200,
    this.width = 160,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = getTextColor(opacity);

    // Determine if background color is dark
    final isDark = opacity.computeLuminance() < 0.2;

    // Adaptive gradient
    final gradientColors =
        isDark
            ? [
              Colors.black.withOpacity(0.7),
              Colors.black.withOpacity(0.5),
              Colors.black.withOpacity(0.3),
              Colors.black.withOpacity(0.1),
              Colors.transparent,
            ]
            : [
              opacity,
              opacity.withOpacity(0.9),
              opacity.withOpacity(0.7),
              opacity.withOpacity(0.5),
              Colors.transparent,
            ];

    final gradientStops =
        isDark ? [0.2, 0.4, 0.6, 0.8, 1.0] : [0.3, 0.4, 0.5, 0.6, 1.0];

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            // Image or fallback color
            if (imageUrl != null && imageUrl!.isNotEmpty)
              Image.asset(
                imageUrl!,
                height: height,
                width: width,
                fit: BoxFit.cover,
              )
            else
              Container(color: opacity),

            // Top color overlay with adaptive gradient
            Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: gradientStops,
                  colors: gradientColors,
                ),
              ),
            ),

            // Title placement
            Positioned(
              top: 16,
              left: 20,
              child: SizedBox(
                width: width - 20,
                child: Text(
                  title,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper to determine text color based on background brightness
  Color getTextColor(Color background) {
    return background.computeLuminance() > 0.5 ? Colors.black : Colors.white;
  }
}
