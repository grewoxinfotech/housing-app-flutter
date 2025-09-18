import 'package:flutter/material.dart';

import 'package:housing_flutter_app/app/constants/color_res.dart';
import 'package:housing_flutter_app/modules/search_property/view/search_screen.dart';

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
      padding: const EdgeInsets.all(10),
      width: 170, // fixed width for balance
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// Title
          buildCommonText(title, 12, FontWeight.w600, ColorRes.textColor, 1),
          const SizedBox(height: 4),

          /// Value + optional icon + subtext
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(icon, color: iconColor ?? Colors.black, size: 15),
                const SizedBox(width: 4),
              ],
              buildCommonText(
                value,
                11,
                FontWeight.w600,
                iconColor ?? Colors.black,
                1,
              ),
              if (subText != null) ...[
                const SizedBox(width: 4),
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
