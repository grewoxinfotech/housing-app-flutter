import 'package:flutter/material.dart';

class CrmBannerCardWithText extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String? description;
  final double width;
  final double height;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final bool isCenterText;
  final int titleMaxLines;
  final int descriptionMaxLines;

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
    this.titleMaxLines = 1,
    this.descriptionMaxLines = 2,
  });

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

            /// Text Overlay
            isCenterText
                ? Positioned.fill(
              child: Center(
                child: Padding(
                  padding: padding ??
                      const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /// Title
                      Text(
                        title,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: titleMaxLines,
                        overflow: TextOverflow.ellipsis,
                      ),

                      /// Description
                      if (description != null && description!.isNotEmpty)
                        Text(
                          description!,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(
                            color: Colors.white70,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: descriptionMaxLines,
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
                padding: padding ??
                    const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// Title
                    Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: titleMaxLines,
                      overflow: TextOverflow.ellipsis,
                    ),

                    /// Description
                    if (description != null && description!.isNotEmpty)
                      Text(
                        description!,
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall
                            ?.copyWith(
                          color: Colors.white70,
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: descriptionMaxLines,
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