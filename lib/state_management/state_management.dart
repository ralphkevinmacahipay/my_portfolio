import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/configuration/constant.dart';

import '../configuration/enum.dart';

class GetManagerController extends GetxController {
  static GetManagerController get instace => Get.find();
  // init
  Rx<Color> kGlobalColor = Colors.transparent.obs;
  final RxBool _isHoveredDLCV = false.obs;
  final RxBool isMobile = false.obs;

  final RxBool _isHoveredSend = false.obs;
  final RxString kTitle = "Home".obs;

  RxBool isHoverHome = false.obs,
      isHoverServices = false.obs,
      isHoverProject = false.obs,
      isHoverContact = false.obs,
      isHomeTap = false.obs,
      isServiceTap = false.obs,
      isProjectTap = false.obs,
      isContactTap = false.obs,
      isHoverColumnOne = false.obs,
      isHoverColumnTwo = false.obs,
      isHoverColumnThree = false.obs,
      isHoverProjectOne = false.obs;

  Rx<Color> kColorDownloadCV = Colors.transparent.obs,
      kColorHome = kBlue.obs,
      kColorServices = Colors.transparent.obs,
      kColorProject = Colors.transparent.obs,
      kColorContact = Colors.transparent.obs,
      kColorName = kWhite.obs,
      kColorEmail = kWhite.obs,
      kColorSubject = kWhite.obs,
      kColorContent = kWhite.obs;

  late AnimationController kController;
  late Animation<double> kAnimation;

// getter

  bool get getIsHoverDLCB => _isHoveredDLCV.value;
  bool get getIsHoverSend => _isHoveredSend.value;

// setter
  void setIsHoverDLCB(bool isHoverDLCB) {
    _isHoveredDLCV.value = isHoverDLCB;
    debugPrint("Code is here");
    update();
  }

  void setIsHoverSend(bool isHover) {
    _isHoveredSend.value = isHover;
    debugPrint("Code is send");
    update();
  }

  void setHome({bool? home, bool? services}) {
    isHomeTap.value = home ?? false;
    isServiceTap.value = services ?? false;

    debugPrint("Value: ${isHomeTap.value}");
    debugPrint("Value: ${isServiceTap.value}");

    update();
  }
}

class ServiceOfMessage extends GetxController
    with GetSingleTickerProviderStateMixin {
  late BuildContext _buildContext;
  Rx<PlatFormEnumType> kPlatform = PlatFormEnumType.mobile.obs;
  Rx<bool> kIsTap = false.obs;
  Rx<TextEditingController> senderNameController = TextEditingController().obs;
  Rx<TextEditingController> senderEmailController = TextEditingController().obs;

  Rx<TextEditingController> subjectController = TextEditingController().obs;
  Rx<TextEditingController> contentController = TextEditingController().obs;
  late AnimationController kController;
  late Animation<double> _kAnimation;
  BuildContext get getContext => _buildContext;
  Animation<double> get getAnimation => _kAnimation;

  // initialize
  setBuildContext({required BuildContext context}) {
    _buildContext = context;
    update();
  }

  void clearFields() {
    senderNameController.value.clear();
    senderEmailController.value.clear();
    subjectController.value.clear();
    contentController.value.clear();
  }

  @override
  void onInit() {
    debugPrint("this is onInit");
    super.onInit();
    kController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _kAnimation = Tween<double>(begin: 0, end: 50).animate(kController);
  }

  @override
  void onClose() {
    debugPrint("this is onClose");
    senderNameController.value.dispose();
    senderEmailController.value.dispose();
    subjectController.value.dispose();
    contentController.value.dispose();

    kController.dispose();
    super.onClose();
  }
}
