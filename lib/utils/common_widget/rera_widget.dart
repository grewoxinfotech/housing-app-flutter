import 'package:flutter/material.dart';

class ReraComponent extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final double borderRadius;
  final bool showIcon;
  final IconData icon;
  final Color iconColor;
  final double iconSize;

  const ReraComponent({
    super.key,
    this.text = "Rera",
    this.backgroundColor = Colors.green,
    this.textColor = Colors.white,
    this.fontSize = 12,
    this.fontWeight = FontWeight.w600,
    this.borderRadius = 8,
    this.showIcon = true,
    this.icon = Icons.verified, // Default icon
    this.iconColor = Colors.white,
    this.iconSize = 14,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: backgroundColor,
        // border: Border.all(
        //   color: ColorRes.textColor.withOpacity(0.6),
        //   width: 1,
        // ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showIcon) ...[Icon(icon, color: iconColor, size: iconSize)],
          const SizedBox(width: 4),
          Text(
            text.toUpperCase(),
            style: TextStyle(
              color: textColor,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
          ),
        ],
      ),
    );
  }
}
