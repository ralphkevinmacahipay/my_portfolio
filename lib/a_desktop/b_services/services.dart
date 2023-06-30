import 'package:flutter/material.dart';
import '../../configuration/constant.dart';
import '../../configuration/style.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      height: SizeConfig.blockY! * 100,
      width: SizeConfig.blockX! * 100,
      child: Stack(
        children: [
          TextWidget(
            kTextStyle: kPoppinSemiBold,
            ktext: text_3,
            kAlign: Alignment.topCenter,
            kTextColor: kWhite,
            kFontSize: SizeConfig.blockX! * 3.51,
            kFontSpace: SizeConfig.blockX! * .2,
          ),
          TextWidget(
            kTextStyle: kPoppinSemiBold,
            ktext: text_4,
            kAlign: Alignment.topCenter,
            kTextColor: kLightGrey,
            kFontSize: SizeConfig.blockX! * 1.875,
          )
        ],
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
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
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: kAlign,
      child: Text(
        ktext,
        style: kTextStyle.copyWith(
            letterSpacing: kFontSpace, fontSize: kFontSize, color: kTextColor),
      ),
    );
  }
}
