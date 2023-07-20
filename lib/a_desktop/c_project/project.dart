import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/configuration/constant.dart';
import 'package:my_profile/my_widget/my_widget.dart';

import '../../configuration/style.dart';
import '../../state_management/put_get.dart';

class Project extends StatelessWidget {
  const Project({
    super.key,
  });

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
        Obx(
          () => ProjectWidgets(
            kColor: kHoverColor.withOpacity(.7),
            kIsHover: controllerGetManager.isHoverProjectOne.value,
            kAlignment: Alignment.center,
            kWidth: SizeConfig.blockX! * 37.36,
            kHeight: SizeConfig.blockY! * 35.58,
          ),
        ),
      ]),
    );
  }
}

class ProjectWidgets extends StatelessWidget {
  final bool kIsHover;
  final Color kColor;
  final AlignmentGeometry kAlignment; // Alignment.center
  final double kWidth; //SizeConfig.blockX! * 37.36
  final double kHeight; //SizeConfig.blockY! * 35.58

  const ProjectWidgets({
    super.key,
    required this.kAlignment,
    required this.kWidth,
    required this.kHeight,
    required this.kIsHover,
    required this.kColor,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: kAlignment,
      child: MouseRegion(
        onEnter: (event) {
          controllerGetManager.isHoverProjectOne.value = true;
          debugPrint("Code is here");
        },
        onExit: (event) {
          controllerGetManager.isHoverProjectOne.value = false;
        },
        child: ColorFiltered(
          colorFilter: controllerGetManager.isHoverProjectOne.value
              ? ColorFilter.mode(kColor, BlendMode.srcATop)
              : const ColorFilter.mode(Colors.transparent, BlendMode.srcATop),
          child: SizedBox(
            width: kWidth,
            height: kHeight,
            child: Image.asset(
              kProjectOne,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
