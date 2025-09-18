import 'package:flutter/material.dart';

import 'package:housing_flutter_app/app/constants/color_res.dart';
import 'package:readmore/readmore.dart';


class ReadMoreClass extends StatelessWidget {
  const ReadMoreClass({
    super.key,
    required this.description,
    required this.trimLines,
    required this.size,
    required this.colorClickableText,
  });

  final String description;
  final int trimLines;
  final double size;
  final Color colorClickableText;

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      description,
      trimLines: trimLines,
      colorClickableText: colorClickableText,

      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w400,
      ),
      trimMode: TrimMode.Line,

      trimCollapsedText: 'Read More',
      trimExpandedText: ' Read Less',
      lessStyle: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w600,
        color: colorClickableText,
      ),

      moreStyle: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: ColorRes.primary,
      ),
    );
  }
}

