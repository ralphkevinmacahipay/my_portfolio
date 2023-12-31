import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/state_management/state_management.dart';

import '../../configuration/constant.dart';
import '../../configuration/enum.dart';
import '../../configuration/style.dart';

class HomeWidgetMobile extends GetView<ServiceOfMessage> {
  const HomeWidgetMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    List<TyperAnimatedText> itemsAnimatedTextMobile = [
      TyperAnimatedText(kTextAnimated_1,
          textStyle: kPoppinBold.copyWith(
              fontSize: SizeConfig.blockX! * 5, color: kWhite),
          speed: const Duration(milliseconds: 100)),
      TyperAnimatedText(kTextAnimated_2,
          textStyle: kPoppinBold.copyWith(
              fontSize: SizeConfig.blockX! * 5, color: kWhite),
          speed: const Duration(milliseconds: 100)),
      TyperAnimatedText(kTextAnimated_3,
          textStyle: kPoppinBold.copyWith(
              fontSize: SizeConfig.blockX! * 5, color: kWhite),
          speed: const Duration(milliseconds: 100)),
    ];

    return SizedBox(
      height: SizeConfig.blockY! * 100,
      width: SizeConfig.blockX! * 100,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: SizeConfig.blockY! * 4),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: getSizeDynamic(
                    context: context,
                    kPlatform: controller.kPlatform.value,
                    sizeType: SizeTypeEnum.width,
                    kWidthMobile: 70,
                    kWidthTablet: 40,
                    kWidthWeb: 70),
                height: getSizeDynamic(
                    context: context,
                    kPlatform: controller.kPlatform.value,
                    sizeType: SizeTypeEnum.width,
                    kWidthMobile: 70,
                    kWidthTablet: 40,
                    kWidthWeb: 70),
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
                  backgroundImage: AssetImage(kProfile),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: SizeConfig.blockX! * 10),
            child: Align(
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: text_1,
                      style: kPoppinSemiBold.copyWith(
                        fontSize: getSizeDynamic(
                            context: context,
                            kPlatform: controller.kPlatform.value,
                            sizeType: SizeTypeEnum.width,
                            kWidthMobile: 5,
                            kWidthTablet: 4,
                            kWidthWeb: 5),
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
                        fontSize: getSizeDynamic(
                            context: context,
                            kPlatform: controller.kPlatform.value,
                            sizeType: SizeTypeEnum.width,
                            kWidthMobile: 10,
                            kWidthTablet: 8,
                            kWidthWeb: 10),
                      ),
                    ),
                    const TextSpan(
                      text: '\n', // Empty TextSpan for spacing
                      style: TextStyle(
                        fontSize: 16,
                      ), // Adjust the font size as needed
                    ),
                    WidgetSpan(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "A",
                                style: kPoppinSemiBold.copyWith(
                                  fontSize: getSizeDynamic(
                                      context: context,
                                      kPlatform: controller.kPlatform.value,
                                      sizeType: SizeTypeEnum.width,
                                      kWidthMobile: 5,
                                      kWidthTablet: 4,
                                      kWidthWeb: 5),
                                  color: kWhite,
                                ),
                              ),
                              SizedBox(
                                width: SizeConfig.blockX! * 2,
                              ),
                              AnimatedTextKit(
                                animatedTexts: itemsAnimatedTextMobile,
                                repeatForever: true,
                              ),
                            ],
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
                left: SizeConfig.blockX! * 10, top: SizeConfig.blockY! * 40),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                textHome,
                style: kPoppinRegular.copyWith(
                  color: kLightGrey,
                  fontSize: getSizeDynamic(
                      context: context,
                      kPlatform: controller.kPlatform.value,
                      sizeType: SizeTypeEnum.width,
                      kWidthMobile: 6,
                      kWidthTablet: 3,
                      kWidthWeb: 6),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
