import 'package:flutter/material.dart';
import 'package:my_profile/configuration/style.dart';

import '../a_desktop/a_home/navigator.dart';

enum NavItemEnum { home, services, works, contact }

String getNavNmae(NavItemEnum item) {
  switch (item) {
    case NavItemEnum.home:
      return 'Home';
    case NavItemEnum.services:
      return 'Services';
    case NavItemEnum.works:
      return 'Project';
    case NavItemEnum.contact:
      return 'Contacts';
  }
}

void onPressedNav(
    {required BuildContext context, required NavItemEnum enumVal}) {
  switch (enumVal) {
    case NavItemEnum.home:
      Navigator.of(context).pop();
      scrollToPosition(0);

      debugPrint("Home");
      break;
    case NavItemEnum.services:
      scrollToPosition(SizeConfig.blockY! * 100);
      Navigator.of(context).pop();

      debugPrint("services");
      break;
    case NavItemEnum.works:
      Navigator.of(context).pop();
      scrollToPosition(SizeConfig.blockY! * 100 * 2);
      debugPrint("works");
      break;
    case NavItemEnum.contact:
      Navigator.of(context).pop();
      scrollToPosition(SizeConfig.blockY! * 100 * 4);
      debugPrint("contact");
      break;
  }
}

enum ColumnType {
  one,
  two,
  three,
}
