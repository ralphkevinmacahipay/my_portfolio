import 'package:flutter/material.dart';

import '../class_constructor/class_constructor.dart';
import '../configuration/style.dart';

final ScrollController scrollController = ScrollController();
void scrollToPosition(double position) {
  scrollController.animateTo(
    position,
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOut,
  );
}

final List<NavigatorItem> myNav = [
  NavigatorItem(
      kText: "Home",
      onPressed: () {
        scrollToPosition(0);
      }),
  NavigatorItem(
      kText: "Services",
      onPressed: () {
        scrollToPosition(SizeConfig.blockY! * 100);
      }),
  NavigatorItem(
      kText: "Works",
      onPressed: () {
        scrollToPosition(SizeConfig.blockY! * 100 * 2);
      }),
  NavigatorItem(
      kText: "Contact",
      onPressed: () {
        scrollToPosition(SizeConfig.blockY! * 100 * 3);
      }),
];
