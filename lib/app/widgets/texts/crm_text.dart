import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CrmText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextDirection? textDirection;
  final TextWidthBasis? textWidthBasis;
  final Locale? locale;
  final StrutStyle? strutStyle;
  final TextHeightBehavior? textHeightBehavior;
  final bool? softWrap;

  const CrmText(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.textDirection,
    this.textWidthBasis,
    this.locale,
    this.strutStyle,
    this.textHeightBehavior,
    this.softWrap,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      textDirection: textDirection,
      textWidthBasis: textWidthBasis,
      locale: locale,
      strutStyle: strutStyle,
      textHeightBehavior: textHeightBehavior,
      softWrap: softWrap,
    );
  }
}
