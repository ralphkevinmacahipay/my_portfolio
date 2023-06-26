import 'package:flutter/material.dart';
import 'package:my_profile/state_management/state_management.dart';

MouseRegion hoverWidget(
    {required GetManagerController getService, required Widget myWidget}) {
  return MouseRegion(
    opaque: false,
    onHover: (event) {
      print("onHover");
      getService.kColorDownloadCV.value =
          Colors.blue; // Replace with your desired hover color
    },
    onExit: (event) {
      // Revert back to the original color when not hovering
      getService.kColorDownloadCV.value =
          Colors.transparent; // Replace with the original color
    },
    child: myWidget,
  );
}

void isTap({
  required GetManagerController controller,
  required bool isHomeTap,
  required bool isServiceTap,
  required bool isWorksTap,
  required bool isContactTap,
  required Color kColorHome,
  required Color kColorServices,
  required Color kColorWorks,
  required Color kColorContact,
  required bool isHoverHome,
  required bool isHoverServices,
}) {
  // is Tapped
  controller.isHomeTap.value = isHomeTap;
  controller.isServiceTap.value = isServiceTap;
  controller.isWorksTap.value = isWorksTap;
  controller.isContactTap.value = isContactTap;
  // color
  controller.kColorHome.value = kColorHome;
  controller.kColorServices.value = kColorServices;
  controller.kColorWorks.value = kColorWorks;
  controller.kColorContact.value = kColorContact;
  // hover
  controller.isHoverHome.value = isHoverHome;
  controller.isHoverServices.value = isHoverServices;
}
