import 'package:flutter/material.dart';

import 'package:my_profile/configuration/constant.dart';
import 'package:my_profile/configuration/style.dart';
import '../../state_management/state_management.dart';

class NavItem extends StatelessWidget {
  final bool isTapped;
  final bool isHovered;
  final NavItemEnum navItem;
  final String kTitle;
  final VoidCallback kOnPressed;
  final GetManagerController controller;
  final Color kColor;

  const NavItem({
    super.key,
    required this.controller,
    required this.kTitle,
    required this.kOnPressed,
    required this.kColor,
    required this.navItem,
    required this.isHovered,
    required this.isTapped,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      opaque: false,
      onHover: (event) {
        controller.isHovered.value = true;
        switch (navItem) {
          case NavItemEnum.home:
            if (!isHovered) {
              print("is hover ");
              controller.kColorHome.value = kBlue;
            }
            break;

          case NavItemEnum.works:
            if (!isHovered) {
              print("is hover ");

              controller.kColorWorks.value = kBlue;
            }
            break;

          case NavItemEnum.services:
            if (!isHovered) {
              print("is hover ");

              controller.kColorServices.value = kBlue;
            }
            break;

          case NavItemEnum.contact:
            if (!isHovered) {
              print("is hover ");

              controller.kColorContact.value = kBlue;
            }
            break;
        }
      },
      onExit: (event) {
        controller.isHovered.value = false;
        switch (navItem) {
          case NavItemEnum.home:
            if (!controller.isTapped.value) {
              controller.kColorHome.value = kTransparent;
            }

            print(" Home is onExit");
          case NavItemEnum.works:
            controller.kColorWorks.value = kTransparent;

          case NavItemEnum.services:
            controller.kColorServices.value = kTransparent;
          case NavItemEnum.contact:
            controller.kColorContact.value = kTransparent;
        }
      },
      child: Container(
        height: SizeConfig.blockY! * 1.95,
        width: SizeConfig.blockX! * 7,
        margin: EdgeInsets.symmetric(vertical: SizeConfig.blockX! * .9),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kBorderRadius),
          color: kColor,
        ),
        child: TextButton(
          onPressed: () {
            switch (navItem) {
              case NavItemEnum.home:
                if (!controller.isTapped.value) {
                  controller.isTapped.value = true;
                }
                break;
              case NavItemEnum.services:
                break;

              case NavItemEnum.works:
                break;

              case NavItemEnum.contact:
                break;
            }
          },
          /**
           * 
           * {
            scrollToPosition(0); 
          },
           */

          child: Text(
            kTitle,
            style:
                TextStyle(fontSize: SizeConfig.blockX! * 1.38, color: kWhite),
          ),
        ),
      ),
    );
  }
}

enum NavItemEnum { home, services, works, contact }
