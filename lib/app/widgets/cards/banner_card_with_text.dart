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
                    colors: isCenterText
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
                    radius: 14,
                    backgroundColor: getRandomAvatarColor(), // random color
                    child: Text(
                      developersName.substring(0, 1).toUpperCase(), // First letter
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
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
                padding: padding ??
                    const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 10,
                    ),
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
                        overflow: TextOverflow.ellipsis
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