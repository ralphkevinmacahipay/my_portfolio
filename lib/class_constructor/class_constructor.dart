import 'package:flutter/material.dart';

class NavigatorItem {
  final VoidCallback onPressed;
  final String kText;

  NavigatorItem({required this.onPressed, required this.kText});
}
