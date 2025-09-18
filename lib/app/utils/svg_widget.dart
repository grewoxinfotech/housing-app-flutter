import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSvgIcon extends StatelessWidget {
  final String assetName;
  final double size;


  const AppSvgIcon({
    Key? key,
    required this.assetName,
    this.size = 24,
 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/$assetName.svg',
      width: size,
      height: size,
    );
  }
}
