import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housing_flutter_app/app/constants/size_manager.dart';
import 'package:housing_flutter_app/widgets/display/card.dart';


class CustomButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String title;
  final double? width;
  final double? height;
  final TextStyle? titleTextStyle;
  final Color? backgroundColor;
  final List<BoxShadow>? boxShadow;
  final BorderRadiusGeometry? borderRadius;
  final String? heroTag;

  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    this.width,
    this.height,
    this.titleTextStyle,
    this.backgroundColor,
    this.borderRadius,
    this.boxShadow,
    this.heroTag,
  }) ;

  @override
  Widget build(BuildContext context) {
    final button = NesticoPeCard(
      width: width ?? 150,
      height: height ?? 48,
      color: backgroundColor ?? Get.theme.colorScheme.primary,
      borderRadius: borderRadius ?? BorderRadius.circular(AppRadius.medium),
      boxShadow: boxShadow,
      child: Center(
        child: Text(
          title,
          style:
          titleTextStyle ??
              TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Get.theme.colorScheme.surface,
              ),
        ),
      ),
    );

    return GestureDetector(
      onTap: onTap,
      child: heroTag != null
          ? Hero(
        tag: heroTag!,
        child: Material(color: Colors.transparent, child: button),
      )
          : Material(color: Colors.transparent, child: button),
    );
  }
} 