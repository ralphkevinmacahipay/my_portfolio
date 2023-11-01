// navigator item
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:developer' as dev show log;
import '../a_desktop/a_home/navigator.dart';
import '../configuration/constant.dart';

class ViewsControll {
  final List<Map<String, dynamic>> kNavigator = [
    {
      "title": 'Home',
      "icon": Icon(Icons.home_filled, color: kWhite),
    },
    {
      "title": 'Services',
      "icon": Icon(Icons.work_history, color: kWhite),
    },
    {
      "title": 'Projects',
      "icon": Icon(Icons.auto_awesome_motion_rounded, color: kWhite),
    },
    {
      "title": 'Contacts',
      "icon": Icon(Icons.contact_phone_outlined, color: kWhite),
    }
  ];

  onPress({required BuildContext context, required String type}) {
    switch (type) {
      case 'Home':
        scrollToPosition(0);

      case 'Services':
        scrollToPosition(context.percentHeight * 92);

      case 'Projects':
        scrollToPosition(context.percentHeight * 92 * 2);

      case 'Contacts':
        scrollToPosition(context.percentHeight * 92 * 4);
    }
  }
}
