import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/configuration/constant.dart';
import 'package:my_profile/services/general_services.dart';
import 'package:my_profile/views/widget_sources.dart';

import 'package:responsive_framework/responsive_framework.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.percentHeight * 92,
      width: context.percentWidth * 100,
      child: ResponsiveBreakpoints.of(context).isDesktop
          ? const DesktopHome()
          : ResponsiveBreakpoints.of(context).isTablet
              ? const TabletHome()
              : const MobileHome(),
    );
  }
}

//desktop
class DesktopHome extends StatelessWidget {
  const DesktopHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<TyperAnimatedText> itemsAnimatedText = [
      TyperAnimatedText(kTextAnimated_1,
          textStyle: kPoppinSemiBold.copyWith(
              color: kWhite, fontSize: context.percentWidth * 2),
          speed: const Duration(milliseconds: 100)),
      TyperAnimatedText(kTextAnimated_2,
          textStyle: kPoppinSemiBold.copyWith(
              color: kWhite, fontSize: context.percentWidth * 2),
          speed: const Duration(milliseconds: 100)),
      TyperAnimatedText(kTextAnimated_3,
          textStyle: kPoppinSemiBold.copyWith(
              color: kWhite, fontSize: context.percentWidth * 2),
          speed: const Duration(milliseconds: 100)),
    ];
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: 'Hi, Welcome to my space\n\n',
                    style: kPoppinSemiBold.copyWith(
                        color: kWhite, fontSize: context.percentWidth * 2)),
                TextSpan(
                    text: 'I\'m Ralph\n',
                    style: kPoppinBold.copyWith(
                        color: kWhite, fontSize: context.percentWidth * 4)),
                WidgetSpan(
                  child: AnimatedTextKit(
                    animatedTexts: itemsAnimatedText,
                    repeatForever: true,
                  ),
                ),
              ],
            ),
          ),
        ).paddingOnly(
            bottom: context.percentWidth * 10, left: context.percentWidth * 10),
        Align(
          alignment: Alignment.centerRight,
          child: CircleAvatar(
            radius: context.percentWidth * 10.88,
            child: Image.asset(kProfile),
          ).paddingOnly(
              bottom: context.percentWidth * 10,
              right: context.percentWidth * 10),
        ),
        Align(
                alignment: Alignment.bottomLeft,
                child: ElevatedButton(
                  style: ButtonStyle(
                      fixedSize: MaterialStatePropertyAll(Size(
                          context.percentWidth * 15.8,
                          context.percentWidth * 3.5)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          side: BorderSide(width: 1.5, color: kWhite),
                          borderRadius: BorderRadius.circular(kBorderRadius))),
                      backgroundColor:
                          MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.hovered)) {
                          return Colors.blue;
                        }
                        return kTransparent;
                      })),
                  child: Text(
                    'Download CV',
                    style: kPoppinSemiBold.copyWith(
                        fontSize: context.percentWidth * 1.5),
                  ),
                  onPressed: () => _voidOpenLink(),
                ))
            .paddingOnly(
                bottom: context.percentHeight * 10,
                left: context.percentWidth * 15),
      ],
    );
  }

  _voidOpenLink() {
    print("code is here");
    GeneralServices().openURL(
        uri: GeneralServices().parseURL(
            url:
                "https://drive.google.com/file/d/1ob8jN81m0zj2SYRl5Ctl-RkBX01P8aES/view?usp=drivesdk"));
  }
}

//tablet
class TabletHome extends StatelessWidget {
  const TabletHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<TyperAnimatedText> itemsAnimatedText = [
      TyperAnimatedText(kTextAnimated_1,
          textStyle: kPoppinSemiBold.copyWith(
              color: kWhite, fontSize: context.percentWidth * 3.5),
          speed: const Duration(milliseconds: 100)),
      TyperAnimatedText(kTextAnimated_2,
          textStyle: kPoppinSemiBold.copyWith(
              color: kWhite, fontSize: context.percentWidth * 3.5),
          speed: const Duration(milliseconds: 100)),
      TyperAnimatedText(kTextAnimated_3,
          textStyle: kPoppinSemiBold.copyWith(
              color: kWhite, fontSize: context.percentWidth * 3.5),
          speed: const Duration(milliseconds: 100)),
    ];
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: CircleAvatar(
            radius: context.percentWidth * 13,
            child: Image.asset(kProfile),
          ).marginOnly(top: context.percentHeight * 10),
        ),
        Align(
          alignment: Alignment.center,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: 'Hi, Welcome to my space\n',
                    style: kPoppinSemiBold.copyWith(
                        color: kWhite, fontSize: context.percentWidth * 4)),
                TextSpan(
                    text: 'I\'m Ralph\n',
                    style: kPoppinBold.copyWith(
                        color: kWhite, fontSize: context.percentWidth * 6)),
                WidgetSpan(
                  child: AnimatedTextKit(
                    animatedTexts: itemsAnimatedText,
                    repeatForever: true,
                  ),
                ),
              ],
            ),
          ),
        ).marginOnly(top: context.percentHeight * 15),
        Align(
          alignment: Alignment.bottomCenter,
          child: ElevatedWidget(
            h: 6,
            w: 30,
            ktitle: "Download CV",
            onPress: () => _voidOpenLink(),
          ),
        ).marginOnly(bottom: context.percentHeight * 10)
      ],
    );
  }

  _voidOpenLink() {
    print("code is here");
    GeneralServices().openURL(
        uri: GeneralServices().parseURL(
            url:
                "https://drive.google.com/file/d/1ob8jN81m0zj2SYRl5Ctl-RkBX01P8aES/view?usp=drivesdk"));
  }
}

//Mobile
class MobileHome extends StatelessWidget {
  const MobileHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<TyperAnimatedText> itemsAnimatedText = [
      TyperAnimatedText(kTextAnimated_1,
          textStyle: kPoppinSemiBold.copyWith(
              color: kWhite, fontSize: context.percentWidth * 5),
          speed: const Duration(milliseconds: 100)),
      TyperAnimatedText(kTextAnimated_2,
          textStyle: kPoppinSemiBold.copyWith(
              color: kWhite, fontSize: context.percentWidth * 5),
          speed: const Duration(milliseconds: 100)),
      TyperAnimatedText(kTextAnimated_3,
          textStyle: kPoppinSemiBold.copyWith(
              color: kWhite, fontSize: context.percentWidth * 5),
          speed: const Duration(milliseconds: 100)),
    ];
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: CircleAvatar(
            radius: context.percentWidth * 30,
            child: Image.asset(kProfile),
          ).marginOnly(top: context.percentHeight * 7),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: 'Hi, Welcome to my space\n\n',
                    style: kPoppinSemiBold.copyWith(
                        color: kWhite, fontSize: context.percentWidth * 5)),
                TextSpan(
                    text: 'I\'m Ralph\n',
                    style: kPoppinBold.copyWith(
                        color: kWhite, fontSize: context.percentWidth * 10)),
                WidgetSpan(
                  child: AnimatedTextKit(
                    animatedTexts: itemsAnimatedText,
                    repeatForever: true,
                  ),
                ),
                const TextSpan(text: '\n\n'),
                TextSpan(
                    text: textHome,
                    style: kPoppinSemiBold.copyWith(
                        color: kLightGrey, fontSize: context.percentWidth * 6)),
              ],
            ),
          ),
        ).marginOnly(
            bottom: context.percentHeight * 10, left: context.percentWidth * 5),
        // Align(
        //   alignment: Alignment.bottomCenter,
        //   child: ElevatedButton(
        //     style: ButtonStyle(
        //         fixedSize: MaterialStatePropertyAll(
        //             Size(context.percentWidth * 30, context.percentWidth * 6)),
        //         shape: MaterialStatePropertyAll(RoundedRectangleBorder(
        //             side: BorderSide(width: 1.5, color: kWhite),
        //             borderRadius: BorderRadius.circular(kBorderRadius))),
        //         backgroundColor: MaterialStateProperty.resolveWith((states) {
        //           if (states.contains(MaterialState.hovered) ||
        //               states.contains(MaterialState.pressed)) {
        //             return Colors.blue;
        //           }
        //           return kTransparent;
        //         })),
        //     child: Text(
        //       'Download CV',
        //       style:
        //           kPoppinSemiBold.copyWith(fontSize: context.percentWidth * 2),
        //     ),
        //     onPressed: () {},
        //   ),
        // ).marginOnly(bottom: context.percentHeight * 10)
      ],
    );
  }
}
