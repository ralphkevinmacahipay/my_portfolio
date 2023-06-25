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
