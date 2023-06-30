import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:my_profile/configuration/constant.dart';
import 'package:my_profile/my_widget/my_widget.dart';

import '../../configuration/style.dart';

class Works extends StatelessWidget {
  const Works({
    super.key,
    required this.items,
  });

  final List<TyperAnimatedText> items;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      height: SizeConfig.blockY! * 100,
      width: SizeConfig.blockX! * 100,
      child: Stack(children: [
        TextWidget(
          kTextStyle: kPoppinSemiBold,
          ktext: kProjectTextTitle,
          kAlign: Alignment.topCenter,
          kTextColor: kWhite,
          kFontSize: SizeConfig.blockX! * 3.51,
        ),
        SubTitleWidget(kTitle: kProjectSubTitle),
        Align(
          alignment: Alignment.center,
          child: Image.asset(
            kProjectOne,
            width: SizeConfig.blockX! * 37.36,
            height: SizeConfig.blockY! * 35.58,
          ),
        ),
      ]),
    );
  }
}
