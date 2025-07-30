import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CrmIc extends StatelessWidget {
  final String iconPath;
  final GestureTapCallback? onTap;
  final double? width;
  final double? height;
  final Color? color;

  const CrmIc({
    super.key,
    required this.iconPath,
    this.onTap,
    this.width = 24,
    this.height,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    print('[DEBUG] CrmIc -> path: $iconPath | color: $color | width: $width | height: $height');

    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        iconPath,
        width: width,
         height: height,
        color: color,
        // colorFilter: color != null
        //     ? ColorFilter.mode(color!, BlendMode.srcIn)
        //     : null,
        alignment: Alignment.center,
      ),
    );
  }
}
