// navigator item
import 'package:flutter/material.dart';
import 'dart:developer' as dev show log;
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

  onPress({required String type}) {
    switch (type) {
      case 'Home':
        dev.log("on press home");
    }
  }
}
