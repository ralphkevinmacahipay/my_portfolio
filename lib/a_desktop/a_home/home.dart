import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/configuration/constant.dart';
import 'package:my_profile/configuration/style.dart';
import '../../class_constructor/class_constructor.dart';
import '../../functions/functions_widget.dart';
import '../../state_management/state_management.dart';
import 'package:my_profile/a_desktop/b_services/services.dart';
import 'package:my_profile/a_desktop/c_works/works.dart';
import 'package:my_profile/a_desktop/navigator.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../d_contact/contact.dart';

class HomeDesktop extends StatefulWidget {
  const HomeDesktop({super.key});

  @override
  State<HomeDesktop> createState() => _HomeDesktopState();
}

class _HomeDesktopState extends State<HomeDesktop> {
  final GetManagerController kGetController = Get.put(GetManagerController());
  Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    List<TyperAnimatedText> items = [
      TyperAnimatedText(kTextAnimated_1,
          textStyle: kPoppinBold.copyWith(
              fontSize: SizeConfig.blockX! * 2, color: kWhite),
          speed: const Duration(milliseconds: 100)),
      TyperAnimatedText(kTextAnimated_2,
          textStyle: kPoppinBold.copyWith(
              fontSize: SizeConfig.blockX! * 2, color: kWhite),
          speed: const Duration(milliseconds: 100)),
      TyperAnimatedText(kTextAnimated_3,
          textStyle: kPoppinBold.copyWith(
              fontSize: SizeConfig.blockX! * 2, color: kWhite),
          speed: const Duration(milliseconds: 100)),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: SizeConfig.blockX! * 10.90),
          child: Text(
            "Ralph.dart",
            style: TextStyle(fontSize: SizeConfig.blockX! * 1.77),
          ),
        ),
        backgroundColor: kDarkBlue,
        actions: myNav
            .map((NavigatorItem item) => Container(
                  decoration: BoxDecoration(
                    color: kTransparent,
                    borderRadius: BorderRadius.circular(
                      kBorderRadius,
                    ),
                  ),
                  margin: EdgeInsets.only(right: SizeConfig.blockX! * 1.94),
                  child: TextButton(
                      onPressed: item.onPressed,
                      child: Text(
                        item.kText,
                        style: TextStyle(
                            fontSize: SizeConfig.blockX! * 1.38, color: kWhite),
                      )),
                ))
            .toList(),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              kBackground,
            ),
          ),
        ),
        child: ListView(
          controller: scrollController,
          children: [
            SizedBox(
              height: SizeConfig.blockY! * 100,
              width: SizeConfig.blockX! * 100,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: SizeConfig.blockY! * 30.94,
                        left: SizeConfig.blockX! * 10.97),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: text_1,
                              style: kPoppinSemiBold.copyWith(
                                wordSpacing: SizeConfig.blockX! * 0.2,
                                letterSpacing: SizeConfig.blockX! * 0.2,
                                fontSize: SizeConfig.blockX! * 2.08,
                                color: kWhite,
                              ),
                            ),
                            TextSpan(
                              text: '\n', // Empty TextSpan for spacing
                              style: TextStyle(
                                fontSize: SizeConfig.blockY! * 2.95,
                              ), // Adjust the font size as needed
                            ),
                            TextSpan(
                              text: text_2,
                              style: kPoppinExtraBold.copyWith(
                                letterSpacing: SizeConfig.blockX! * 0.34,
                                height: 1.2,
                                color: kWhite,
                                fontSize: SizeConfig.blockX! * 3,
                              ),
                            ),
                            const TextSpan(
                              text: '\n', // Empty TextSpan for spacing
                              style: TextStyle(
                                fontSize: 16,
                              ), // Adjust the font size as needed
                            ),
                            WidgetSpan(
                              child: Row(
                                children: [
                                  Text(
                                    "A",
                                    style: kPoppinBold.copyWith(
                                      fontSize: SizeConfig.blockX! * 2,
                                      color: kWhite,
                                    ),
                                  ),
                                  SizedBox(
                                    width: SizeConfig.blockX! * 2,
                                  ),
                                  AnimatedTextKit(
                                    animatedTexts: items,
                                    repeatForever: true,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: SizeConfig.blockX! * 10.90,
                      top: SizeConfig.blockY! * 38,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: hoverWidget(
                          getService: kGetController,
                          myWidget: InkWell(
                            onTap: () {},
                            child: Obx(
                              () => Container(
                                decoration: BoxDecoration(
                                  color: kGetController.kColor.value,
                                  borderRadius:
                                      BorderRadius.circular(kBorderRadius),
                                  border: Border.all(color: Colors.white),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 24,
                                ),
                                child: Text(
                                  "DOWNLOAD CV",
                                  style: kPoppinSemiBold.copyWith(
                                    fontSize: SizeConfig.blockX! * 1.5,
                                    color: kWhite,
                                  ),
                                ),
                              ),
                            ),
                          )),
                    ),
                  ),
                  const FloatingAvatar(),
                ],
              ),
            ),
            const ServicesScreen(),
            Works(items: items),
            const Contact(),
          ],
        ),
      ),
    );
  }
}

class FloatingAvatar extends GetView<FloatingAvatarController> {
  const FloatingAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.blockY! * 10.94,
        right: SizeConfig.blockX! * 10.97,
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {}, // Add an empty onPanUpdate handler
          child: AnimatedBuilder(
            animation: controller.getAnimation,
            builder: (context, child) {
              return Stack(
                children: [
                  Positioned(
                    right: controller.getAnimation.value,
                    child: Container(
                      width: SizeConfig.blockX! * 20.88,
                      height: SizeConfig.blockX! * 20.88,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            blurRadius: 10,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: SizeConfig.blockX! * 20.88,
                        backgroundImage: AssetImage(kProfile),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
