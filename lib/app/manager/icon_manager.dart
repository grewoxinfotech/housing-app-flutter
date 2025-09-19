import 'package:flutter/material.dart';
import 'package:housing_flutter_app/app/constants/svg_res.dart';

class IconItem {
  final String key; // e.g. AppSvgRes.office
  final String title; // e.g. "Office"
  final IconData icon; // fallback Material Icon

  IconItem({required this.key, required this.title, required this.icon});
}

class IconManager {
  IconManager._();

  static final List<IconItem> items = [
    IconItem(key: AppSvgRes.area, title: "Area", icon: Icons.square_foot),
    IconItem(
      key: AppSvgRes.circleDots,
      title: "Other",
      icon: Icons.blur_circular,
    ),
    IconItem(key: AppSvgRes.office, title: "Office", icon: Icons.business),
    IconItem(
      key: AppSvgRes.showroom,
      title: "Showroom",
      icon: Icons.storefront,
    ),
    IconItem(key: AppSvgRes.shop, title: "Shop", icon: Icons.shopping_bag),
    IconItem(
      key: AppSvgRes.warehouse,
      title: "Warehouse",
      icon: Icons.warehouse,
    ),
  ];

  /// 🔹 Return `IconData` (Material icon) for fallback UI
  static IconData getIcon(String key) {
    debugPrint('[DEBUG]=> icons : $key');
    return items
        .firstWhere(
          (item) => item.key == key,
          orElse:
              () => IconItem(
                key: "unknown",
                title: "Unknown",
                icon: Icons.help_outline,
              ),
        )
        .icon;
  }

  /// 🔹 Return the SVG key (e.g. AppSvgRes.office)
  static String getSvgKey(String title) {
    return items
        .firstWhere(
          (item) => item.title == title,
          orElse:
              () => IconItem(
                key: "unknown",
                title: "Unknown",
                icon: Icons.help_outline,
              ),
        )
        .key;
  }

  /// 🔹 Return full item (title + key + icon)
  static IconItem getItem(String key) {
    return items.firstWhere(
      (item) => item.key == key,
      orElse:
          () => IconItem(
            key: "unknown",
            title: "Unknown",
            icon: Icons.help_outline,
          ),
    );
  }
}
