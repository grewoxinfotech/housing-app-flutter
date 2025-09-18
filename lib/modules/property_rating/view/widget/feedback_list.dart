import 'package:flutter/material.dart';

import 'package:housing_flutter_app/app/constants/color_res.dart';
import 'package:housing_flutter_app/modules/search_property/view/search_screen.dart';

List<Widget> buildFeedback(List<String> goodThings) {
  return List.generate(4, (index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),

      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400, width: 0.5),
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: buildCommonText(
        goodThings[index],
        10,
        FontWeight.w500,
        ColorRes.textPrimary.withOpacity(0.7),
        1,
      ),
    );
  });
}
