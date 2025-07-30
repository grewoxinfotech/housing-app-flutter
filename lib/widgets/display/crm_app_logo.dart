import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../app/constants/ic_res.dart';

class CrmAppLogo extends StatelessWidget {
  final double? width;
  final GestureTapCallback? onTap;
  final String? heroTag;

  const CrmAppLogo({super.key, this.width, this.onTap, this.heroTag});

  @override
  Widget build(BuildContext context) {
    final logo = Image.asset(ICRes.appLogoPNG, width: width ?? 40);

    SvgPicture.asset(
      ICRes.member,
      width: 24,
      height: 24,
      color: Colors.black, // Optional color tint
    );

    return GestureDetector(
      onTap: onTap,
      child: heroTag != null
          ? Hero(
        tag: heroTag!,
        child: logo,
      )
          : logo,
    );
  }
}
