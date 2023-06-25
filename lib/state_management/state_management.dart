import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer' as devtools show log;

class GetManagerController extends GetxController {
  Rx<Color> kColor = Colors.transparent.obs;
  late AnimationController kController;
  late Animation<double> kAnimation;
}

class FloatingAvatarController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController kController;
  late Animation<double> _kAnimation;

  Animation<double> get getAnimation => _kAnimation;

  @override
  void onInit() {
    super.onInit();
    kController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _kAnimation = Tween<double>(begin: 0, end: 50).animate(kController);
    devtools.log("GOT PRINTED");
  }

  @override
  void onClose() {
    kController.dispose();
    super.onClose();
    devtools.log("GOT PRINTED 2");
  }
}
