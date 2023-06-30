import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final TextAlign? kTextAlign;
  final double kFontSize;
  final double? kFontSpace;
  final Color kTextColor;
  final Alignment kAlign;
  final String ktext;
  final TextStyle kTextStyle;
  const TextWidget({
    super.key,
    required this.kTextStyle,
    required this.ktext,
    required this.kAlign,
    required this.kTextColor,
    required this.kFontSize,
    this.kFontSpace,
    this.kTextAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: kAlign,
      child: Text(
        textAlign: kTextAlign,
        ktext,
        style: kTextStyle.copyWith(
            letterSpacing: kFontSpace, fontSize: kFontSize, color: kTextColor),
      ),
    );
  }
}
