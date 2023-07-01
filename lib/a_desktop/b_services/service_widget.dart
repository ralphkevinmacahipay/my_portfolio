import 'package:flutter/material.dart';
import '../../configuration/constant.dart';
import '../../configuration/style.dart';
import '../../my_widget/my_widget.dart';

class RowWidget extends StatelessWidget {
  final String kImage;
  final String kText;
  final double? kSize;
  const RowWidget({
    super.key,
    required this.kImage,
    required this.kText,
    this.kSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: kTransparent,
          radius: SizeConfig.blockX! * .8,
          child: Image.asset(
            kImage,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: SizeConfig.blockX! * .5),
        TextWidgetOne(
          kText: kText,
          kTextStyle: kPoppinSemiBold,
          kFontSize: kSize ?? SizeConfig.blockX! * 1.3,
        )
      ],
    );
  }
}

class ColumnWidget extends StatelessWidget {
  final Alignment kAlignment; // Alignment.centerLeft
  final double? kPaddingL; // SizeConfig.blockX! * 20
  final double? kPaddingT; // SizeConfig.blockY! * 25
  final double? kPaddingR;
  final double? kPaddingB;
  final String? kImageExtra;
  final String? kTextExtra;

  final String kImageOne; // kAndroidImage
  final String kTextOne; // text_6
  final String kTextTwo; // text_7
  final String kImageTwo; // kFlutterImage
  final String kTextThree; // text_8
  final String kImageThree; // kFirebaseImage
  final String kTextFour; // text_9

  const ColumnWidget({
    super.key,
    required this.kAlignment,
    this.kPaddingL,
    this.kPaddingT,
    required this.kImageOne,
    required this.kTextOne,
    required this.kTextTwo,
    required this.kImageTwo,
    required this.kTextThree,
    required this.kImageThree,
    required this.kTextFour,
    this.kPaddingR,
    this.kPaddingB,
    this.kImageExtra,
    this.kTextExtra,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: kPaddingL ?? 0,
        top: kPaddingT ?? 0,
        right: kPaddingR ?? 0,
      ),
      child: Align(
        alignment: kAlignment,
        child: Container(
          height: SizeConfig.blockY! * 54.23,
          width: SizeConfig.blockX! * 18.40,
          decoration: BoxDecoration(
            color: kLighBlue,
            borderRadius: BorderRadius.circular(
              kBorderRadius,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset(
                kImageOne,
                width: SizeConfig.blockX! * 13.94,
                height: SizeConfig.blockY! * 16.76,
              ),
              TextWidgetOne(
                  kFontSize: SizeConfig.blockX! * 1.25,
                  kText: kTextOne,
                  kTextStyle: kPoppinBold),
              TextWidgetOne(
                  kTextALign: TextAlign.center,
                  kFontSize: SizeConfig.blockX! * 1,
                  kText: kTextTwo,
                  kTextStyle: kPoppinSemiBold),
              SizedBox(
                height: SizeConfig.blockY! * 1.5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RowWidget(
                    kImage: kImageTwo,
                    kText: kTextThree,
                  ),
                  SizedBox(width: SizeConfig.blockX! * .5),
                  RowWidget(
                    kImage: kImageThree,
                    kText: kTextFour,
                  ),
                ],
              ),
              (kImageExtra != null && kTextExtra != null)
                  ? RowWidget(
                      kSize: SizeConfig.blockX! * 1,
                      kImage: kImageExtra!,
                      kText: kTextExtra!,
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
