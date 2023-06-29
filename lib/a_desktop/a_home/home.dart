import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_profile/a_desktop/navigator.dart';
import 'package:my_profile/configuration/constant.dart';
import 'package:my_profile/configuration/style.dart';
import '../../state_management/state_management.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'body.dart';

class HomeDesktop extends GetView<GetManagerController> {
  const HomeDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    List<TyperAnimatedText> items = [
      TyperAnimatedText(kTextAnimated_1,
          textStyle: kPoppinBold.copyWith(
              fontSize: SizeConfig.blockX! * 2, color: kWhite),
          speed: const Duration(milliseconds: 100)),
      TyperAnimatedText(kTextAnimated_2,
          textStyle: kPoppinBold.copyWith(
              fontSize: SizeConfig.blockX! * 2, color: kWhite),
          speed: const Duration(milliseconds: 100)),
      TyperAnimatedText(kTextAnimated_3,
          textStyle: kPoppinBold.copyWith(
              fontSize: SizeConfig.blockX! * 2, color: kWhite),
          speed: const Duration(milliseconds: 100)),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: SizeConfig.blockX! * 10.90),
          child: Text(
            "Ralph.dart",
            style: TextStyle(fontSize: SizeConfig.blockX! * 1.77),
          ),
        ),
        backgroundColor: kDarkBlue,
        actions: [
          // TODO: clean this code
          Obx(
            () => MouseRegion(
              opaque: false,
              onHover: (event) {
                if (!controller.isHoverHome.value &&
                    !controller.isHomeTap.value) {
                  print("onHover home");
                  controller.kColorHome.value = kBlue;
                  controller.isHoverHome.value = true;
                }
              },
              onExit: (event) {
                if (!controller.isHomeTap.value) {
                  controller.isHoverHome.value = false;
                  controller.kColorHome.value = kTransparent;
                }
              },
              child: Container(
                height: SizeConfig.blockY! * 1.95,
                width: SizeConfig.blockX! * 7,
                margin: EdgeInsets.symmetric(vertical: SizeConfig.blockX! * .9),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kBorderRadius),
                  color: controller.kColorHome.value,
                ),
                child: TextButton(
                  onPressed: () {
                    controller.isHomeTap.value = true;
                    controller.isServiceTap.value = false;
                    controller.isWorksTap.value = false;
                    controller.isContactTap.value = false;
                    controller.kColorHome.value = kBlue;
                    controller.kColorServices.value = kTransparent;
                    controller.kColorWorks.value = kTransparent;
                    controller.kColorContact.value = kTransparent;
                    scrollToPosition(0);
                  },
                  child: Text(
                    "Home",
                    style: TextStyle(
                        fontSize: SizeConfig.blockX! * 1.38, color: kWhite),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: SizeConfig.blockX! * 2.5),
          Obx(
            () => MouseRegion(
              opaque: false,
              onHover: (event) {
                if (!controller.isHoverServices.value &&
                    !controller.isServiceTap.value) {
                  print("onHover Services");
                  controller.kColorServices.value = kBlue;
                  controller.isHoverServices.value = true;
                }
              },
              onExit: (event) {
                if (!controller.isServiceTap.value) {
                  controller.isHoverServices.value = false;
                  controller.kColorServices.value = kTransparent;
                }
              },
              child: Container(
                height: SizeConfig.blockY! * 1.95,
                width: SizeConfig.blockX! * 7,
                margin: EdgeInsets.symmetric(vertical: SizeConfig.blockX! * .9),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kBorderRadius),
                  color: controller.kColorServices.value,
                ),
                child: TextButton(
                  onPressed: () {
                    controller.isHomeTap.value = false;
                    controller.isServiceTap.value = true;
                    controller.isWorksTap.value = false;
                    controller.isContactTap.value = false;
                    controller.kColorHome.value = kTransparent;
                    controller.kColorServices.value = kBlue;
                    controller.kColorWorks.value = kTransparent;
                    controller.kColorContact.value = kTransparent;
                    scrollToPosition(SizeConfig.blockY! * 100);
                  },
                  child: Text(
                    "Services",
                    style: TextStyle(
                        fontSize: SizeConfig.blockX! * 1.38, color: kWhite),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: SizeConfig.blockX! * 2.5),
          Obx(
            () => MouseRegion(
              opaque: false,
              onHover: (event) {
                if (!controller.isHoverHome.value) {
                  print("onHover Work");
                  controller.isHoverHome.value = true;
                  controller.kColorWorks.value = kBlue;
                }
              },
              onExit: (event) {
                if (!controller.isWorksTap.value) {
                  print("onExit Work");
                  controller.isHoverHome.value = false;
                  controller.kColorWorks.value = kTransparent;
                }
              },
              child: Container(
                height: SizeConfig.blockY! * 1.95,
                width: SizeConfig.blockX! * 7,
                margin: EdgeInsets.symmetric(vertical: SizeConfig.blockX! * .9),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kBorderRadius),
                  color: controller.kColorWorks.value,
                ),
                child: TextButton(
                  onPressed: () {
                    controller.isHomeTap.value = false;
                    controller.isServiceTap.value = false;
                    controller.isWorksTap.value = true;
                    controller.isContactTap.value = false;
                    controller.kColorHome.value = kTransparent;
                    controller.kColorServices.value = kTransparent;
                    controller.kColorWorks.value = kBlue;
                    controller.kColorContact.value = kTransparent;
                    scrollToPosition(SizeConfig.blockY! * 100 * 2);
                  },
                  child: Text(
                    "Work",
                    style: TextStyle(
                        fontSize: SizeConfig.blockX! * 1.38, color: kWhite),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: SizeConfig.blockX! * 2.5),
          Obx(
            () => MouseRegion(
              opaque: false,
              onHover: (event) {
                if (!controller.isHoverContact.value) {
                  controller.isHoverContact.value = true;
                  print("onHover Contact");
                  controller.kColorContact.value = kBlue;
                }
              },
              onExit: (event) {
                if (!controller.isContactTap.value) {
                  print("onExit Contact");
                  controller.isHoverContact.value = false;
                  controller.kColorContact.value = kTransparent;
                }
              },
              child: Container(
                height: SizeConfig.blockY! * 1.95,
                width: SizeConfig.blockX! * 7,
                margin: EdgeInsets.symmetric(vertical: SizeConfig.blockX! * .9),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kBorderRadius),
                  color: controller.kColorContact.value,
                ),
                child: TextButton(
                  onPressed: () {
                    controller.isHomeTap.value = false;
                    controller.isServiceTap.value = false;
                    controller.isWorksTap.value = false;
                    controller.isContactTap.value = true;
                    controller.kColorHome.value = kTransparent;
                    controller.kColorServices.value = kTransparent;
                    controller.kColorWorks.value = kTransparent;
                    controller.kColorContact.value = kBlue;
                    scrollToPosition(SizeConfig.blockY! * 100 * 3);
                  },
                  child: Text(
                    "Contact",
                    style: TextStyle(
                        fontSize: SizeConfig.blockX! * 1.38, color: kWhite),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: SizeConfig.blockX! * 10)
        ],
      ),
      body: BodyHome(items: items, controller: controller),
    );
  }
}
