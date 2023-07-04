import 'package:flutter/material.dart';

import 'package:my_profile/configuration/constant.dart';
import 'package:my_profile/configuration/style.dart';
import '../../state_management/state_management.dart';

import '../../configuration/enum.dart';

// scroll animation
final ScrollController scrollController = ScrollController();
void scrollToPosition(double position) {
  scrollController.animateTo(
    position,
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOut,
  );
}

// navItems
class NavItem extends StatelessWidget {
  final NavItemEnum navItem;
  final GetManagerController controller;
  final Color kColor;

  const NavItem({
    super.key,
    required this.controller,
    required this.kColor,
    required this.navItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.blockY! * 1.95,
      width: SizeConfig.blockX! * 7,
      margin: EdgeInsets.symmetric(vertical: SizeConfig.blockY! * 1.7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kBorderRadius),
        color: kColor,
      ),
      child: TextButton(
        onPressed: () {
          switch (navItem) {
            case NavItemEnum.home:
              chageColor(controller: controller, kColorHome: kBlue);
              scrollToPosition(0);
              break;
            case NavItemEnum.services:
              chageColor(controller: controller, kColorServices: kBlue);
              scrollToPosition(SizeConfig.blockY! * 100);
              break;
            case NavItemEnum.works:
              chageColor(controller: controller, kColorWorks: kBlue);

              scrollToPosition(SizeConfig.blockY! * 100 * 2);
              break;
            case NavItemEnum.contact:
              chageColor(controller: controller, kColorContacts: kBlue);

              scrollToPosition(SizeConfig.blockY! * 100 * 4);
              break;
          }
        },
        child: Text(
          getNavNmae(navItem),
          style: TextStyle(fontSize: SizeConfig.blockX! * 1.3, color: kWhite),
        ),
      ),
    );
  }
}

void chageColor({
  required GetManagerController controller,
  Color? kColorHome,
  Color? kColorServices,
  Color? kColorWorks,
  Color? kColorContacts,
}) {
  controller.kColorHome.value = kColorHome ?? kTransparent;
  controller.kColorServices.value = kColorServices ?? kTransparent;
  controller.kColorWorks.value = kColorWorks ?? kTransparent;
  controller.kColorContact.value = kColorContacts ?? kTransparent;
}
