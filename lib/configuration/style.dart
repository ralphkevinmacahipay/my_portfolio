import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? height;
  static double? width;
  static double? blockX;
  static double? blockY;
  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    height = _mediaQueryData!.size.height;
    width = _mediaQueryData!.size.width;
    blockX = width! / 100;
    blockY = height! / 100;
  }
}
