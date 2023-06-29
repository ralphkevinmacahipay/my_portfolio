import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/configuration/constant.dart';

class GetManagerController extends GetxController {
  Rx<Color> kGlobalColor = Colors.transparent.obs;
  RxBool isHovered = false.obs;
  RxBool isTapped = false.obs;

  RxBool isHoverHome = false.obs,
      isHoverServices = false.obs,
      isHoverWorks = false.obs,
      isHoverContact = false.obs,
      isHomeTap = true.obs,
      isServiceTap = false.obs,
      isWorksTap = false.obs,
      isContactTap = false.obs;

  Rx<Color> kColorDownloadCV = Colors.transparent.obs,
      kColorHome = kBlue.obs,
      kColorServices = Colors.transparent.obs,
      kColorWorks = Colors.transparent.obs,
      kColorContact = Colors.transparent.obs;

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
  }

  @override
  void onClose() {
    kController.dispose();
    super.onClose();
  }
}
