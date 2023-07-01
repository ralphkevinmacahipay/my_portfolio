import 'package:flutter/material.dart';
import 'package:my_profile/a_desktop/b_services/service_widget.dart';
import '../../configuration/constant.dart';
import '../../configuration/style.dart';
import '../../my_widget/my_widget.dart';

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
          SubTitleWidget(kTitle: text_4),
          ColumnWidget(
              kAlignment: Alignment.centerLeft,
              kPaddingL: SizeConfig.blockX! * 20,
              kPaddingT: SizeConfig.blockY! * 25,
              kImageOne: kAndroidImage,
              kTextOne: text_6,
              kTextTwo: text_7,
              kImageTwo: kFlutterImage,
              kTextThree: text_8,
              kImageThree: kFirebaseImage,
              kTextFour: text_9),
          ColumnWidget(
              kAlignment: Alignment.centerRight,
              kPaddingT: SizeConfig.blockY! * 25,
              kPaddingR: SizeConfig.blockX! * 20,
              kImageOne: kUiImage,
              kTextOne: text_10,
              kTextTwo: text_11,
              kImageTwo: kFigmaImage,
              kTextThree: text_12,
              kImageThree: kFlatIconImage,
              kTextFour: text_13),
          ColumnWidget(
              kAlignment: Alignment.center,
              kPaddingT: SizeConfig.blockY! * 25,
              kImageOne: kWebImage,
              kTextOne: text_14,
              kTextTwo: text_15,
              kImageTwo: kFlutterImage,
              kTextThree: text_8,
              kImageThree: kFirebaseImage,
              kTextFour: text_9),
        ],
      ),
    );
  }
}
