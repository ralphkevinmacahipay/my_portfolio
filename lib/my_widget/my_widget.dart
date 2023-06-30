import 'package:flutter/material.dart';

import '../configuration/constant.dart';
import '../configuration/style.dart';

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

class TextWidgetOne extends StatelessWidget {
  final TextAlign? kTextALign;
  final String kText;
  final TextStyle kTextStyle;

  final double kFontSize;
  const TextWidgetOne({
    super.key,
    required this.kText,
    required this.kTextStyle,
    required this.kFontSize,
    this.kTextALign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: kTextALign,
      kText,
      style: kTextStyle.copyWith(
        fontSize: kFontSize,
        color: kWhite,
      ),
    );
  }
}

class SubTitleWidget extends StatelessWidget {
  final String kTitle; // text_4
  const SubTitleWidget({
    super.key,
    required this.kTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: SizeConfig.blockX! * 10),
      padding: EdgeInsets.only(top: SizeConfig.blockY! * 12.89),
      child: TextWidget(
        kTextAlign: TextAlign.center,
        kTextStyle: kPoppinSemiBold,
        ktext: kTitle,
        kAlign: Alignment.topCenter,
        kTextColor: kLightGrey,
        kFontSize: SizeConfig.blockX! * 1.5,
      ),
    );
  }
}
