import 'package:flutter/material.dart';
import 'package:my_profile/configuration/constant.dart';
import 'package:my_profile/configuration/style.dart';

import '../a_desktop/a_home/navigator.dart';
import '../functions/functions_widget.dart';
import '../state_management/put_get.dart';

enum NavItemEnum { home, services, project, contact }

String getNavNmae(NavItemEnum item) {
  switch (item) {
    case NavItemEnum.home:
      return 'Home';
    case NavItemEnum.services:
      return 'Services';
    case NavItemEnum.project:
      return 'Project';
    case NavItemEnum.contact:
      return 'Contacts';
  }
}

void onPressedNav(
    {required BuildContext context, required NavItemEnum enumVal}) {
  switch (enumVal) {
    case NavItemEnum.home:
      controllerGetManager.kTitle.value = getNavNmae(NavItemEnum.home);
      Navigator.of(context).pop();
      scrollToPosition(0);

      debugPrint("Home");
      break;
    case NavItemEnum.services:
      controllerGetManager.kTitle.value = getNavNmae(NavItemEnum.services);
      scrollToPosition(SizeConfig.blockY! * 100);
      Navigator.of(context).pop();

      debugPrint("services");
      break;
    case NavItemEnum.project:
      controllerGetManager.kTitle.value = getNavNmae(NavItemEnum.project);
      Navigator.of(context).pop();
      scrollToPosition(SizeConfig.blockY! * 100 * 2);
      debugPrint("Project");
      break;
    case NavItemEnum.contact:
      controllerGetManager.kTitle.value = getNavNmae(NavItemEnum.contact);
      Navigator.of(context).pop();
      scrollToPosition(SizeConfig.blockY! * 100 * 3);
      debugPrint("contact");
      break;
  }
}

enum ColumnType {
  one,
  two,
  three,
}

enum ContactEnum {
  instagram,
  facebook,
  gihub,

  linkedin,
}

void onPressContact({required ContactEnum contactEnum}) {
  switch (contactEnum) {
    case ContactEnum.instagram:
      openURL(uri: parseURL(url: kMyInstagram));
      break;
    case ContactEnum.facebook:
      openURL(uri: parseURL(url: kMyFaceBook));

      break;

    case ContactEnum.gihub:
      openURL(uri: parseURL(url: kMyGitHub));

      break;

    case ContactEnum.linkedin:
      openURL(uri: parseURL(url: kMyLinkedIn));

      break;
  }
}
