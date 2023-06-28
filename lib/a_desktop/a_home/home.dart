import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_profile/a_desktop/a_home/navigator_item.dart';
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
          Obx(
            () => NavItem(
                isTapped: controller.isTapped.value,
                isHovered: controller.isHovered.value,
                navItem: NavItemEnum.home,
                controller: controller,
                kColor: controller.kColorHome.value,
                kOnPressed: () {
                  scrollToPosition(0);
                },
                kTitle: "Home"),
          ),
          SizedBox(width: SizeConfig.blockX! * 2.5),
          Obx(
            () => NavItem(
                isTapped: controller.isTapped.value,
                isHovered: controller.isHovered.value,
                navItem: NavItemEnum.services,
                controller: controller,
                kColor: controller.kColorServices.value,
                kOnPressed: () {
                  scrollToPosition(SizeConfig.blockY! * 100);
                },
                kTitle: "Serivices"),
          ),
          SizedBox(width: SizeConfig.blockX! * 2.5),
          Obx(
            () => NavItem(
                isTapped: controller.isTapped.value,
                isHovered: controller.isHovered.value,
                navItem: NavItemEnum.works,
                controller: controller,
                kColor: controller.kColorWorks.value,
                kOnPressed: () {
                  scrollToPosition(SizeConfig.blockY! * 100 * 2);
                },
                kTitle: "Works"),
          ),
          SizedBox(width: SizeConfig.blockX! * 2.5),
          Obx(
            () => NavItem(
                isTapped: controller.isTapped.value,
                isHovered: controller.isHovered.value,
                navItem: NavItemEnum.contact,
                controller: controller,
                kColor: controller.kColorContact.value,
                kOnPressed: () {
                  scrollToPosition(SizeConfig.blockY! * 100 * 3);
                },
                kTitle: "Contact"),
          ),
          SizedBox(width: SizeConfig.blockX! * 10)
        ],
      ),
      body: BodyHome(items: items, controller: controller),
    );
  }
}



          /**
           * 
          NavItem(
              kOnExit: () {},
              onHover: (event) {
                print("Home is hover");
              },
              controller: controller,
              kColor: controller.kColorHome.value,
              kOnPressed: () {},
              kTitle: "Home"),
          SizedBox(width: SizeConfig.blockX! * 2.5),
          MouseRegion(
            opaque: false,
            onHover: (event) {},
            onExit: (event) {},
            child: Obx(() => Container(
                  height: SizeConfig.blockY! * 1.95,
                  width: SizeConfig.blockX! * 7,
                  margin:
                      EdgeInsets.symmetric(vertical: SizeConfig.blockX! * .9),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                    color: controller.kColorServices.value,
                  ),
                  child: TextButton(
                    onPressed: () {
                      scrollToPosition(SizeConfig.blockY! * 100);
                    },
                    child: Text(
                      "Services",
                      style: TextStyle(
                          fontSize: SizeConfig.blockX! * 1.38, color: kWhite),
                    ),
                  ),
                )),
          ),
          SizedBox(width: SizeConfig.blockX! * 2.5),
          MouseRegion(
            opaque: false,
            onHover: (event) {},
            onExit: (event) {},
            child: Obx(() => Container(
                  height: SizeConfig.blockY! * 1.95,
                  width: SizeConfig.blockX! * 7,
                  margin:
                      EdgeInsets.symmetric(vertical: SizeConfig.blockX! * .9),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                    color: controller.kColorWorks.value,
                  ),
                  child: TextButton(
                    onPressed: () {
                      scrollToPosition(SizeConfig.blockY! * 100 * 2);
                    },
                    child: Text(
                      "Work",
                      style: TextStyle(
                          fontSize: SizeConfig.blockX! * 1.38, color: kWhite),
                    ),
                  ),
                )),
          ),
          SizedBox(width: SizeConfig.blockX! * 2.5),
          MouseRegion(
            opaque: false,
            onHover: (event) {},
            onExit: (event) {},
            child: Obx(() => Container(
                  height: SizeConfig.blockY! * 1.95,
                  width: SizeConfig.blockX! * 7,
                  margin:
                      EdgeInsets.symmetric(vertical: SizeConfig.blockX! * .9),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                    color: controller.kColorContact.value,
                  ),
                  child: TextButton(
                    onPressed: () {
                      scrollToPosition(SizeConfig.blockY! * 100 * 3);
                    },
                    child: Text(
                      "Contact",
                      style: TextStyle(
                          fontSize: SizeConfig.blockX! * 1.38, color: kWhite),
                    ),
                  ),
                )),
          ),
          SizedBox(width: SizeConfig.blockX! * 10)
           */