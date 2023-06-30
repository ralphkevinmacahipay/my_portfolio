import 'package:flutter/material.dart';
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
          Container(
            margin: EdgeInsets.symmetric(horizontal: SizeConfig.blockX! * 5),
            padding: EdgeInsets.only(top: SizeConfig.blockY! * 12.89),
            child: TextWidget(
              kTextAlign: TextAlign.center,
              kTextStyle: kPoppinSemiBold,
              ktext: text_4,
              kAlign: Alignment.topCenter,
              kTextColor: kLightGrey,
              kFontSize: SizeConfig.blockX! * 1.5,
            ),
          )
        ],
      ),
    );
  }
}
