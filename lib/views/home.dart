import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/configuration/constant.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<TyperAnimatedText> itemsAnimatedText = [
      TyperAnimatedText(kTextAnimated_1,
          textStyle: kPoppinSemiBold.copyWith(
              color: kWhite, fontSize: context.percentWidth * 2.5),
          speed: const Duration(milliseconds: 100)),
      TyperAnimatedText(kTextAnimated_2,
          textStyle: kPoppinSemiBold.copyWith(
              color: kWhite, fontSize: context.percentWidth * 2.5),
          speed: const Duration(milliseconds: 100)),
      TyperAnimatedText(kTextAnimated_3,
          textStyle: kPoppinSemiBold.copyWith(
              color: kWhite, fontSize: context.percentWidth * 2.5),
          speed: const Duration(milliseconds: 100)),
    ];
    return SizedBox(
      height: context.percentHeight * 92,
      width: context.percentWidth * 100,
      child: ResponsiveBreakpoints.of(context).isDesktop
          ? DesktopHome(itemsAnimatedText: itemsAnimatedText)
          : TabletHome(itemsAnimatedText: itemsAnimatedText),
    );
  }
}

//desktop
class DesktopHome extends StatelessWidget {
  const DesktopHome({
    super.key,
    required this.itemsAnimatedText,
  });

  final List<TyperAnimatedText> itemsAnimatedText;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: 'Hi, Welcome to my space\n',
                        style: kPoppinSemiBold.copyWith(
                            color: kWhite, fontSize: context.percentWidth * 3)),
                    TextSpan(
                        text: 'I\'m Ralph\n',
                        style: kPoppinBold.copyWith(
                            color: kWhite, fontSize: context.percentWidth * 4)),
                    WidgetSpan(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "A",
                            style: kPoppinSemiBold.copyWith(
                                color: kWhite,
                                fontSize: context.percentWidth * 2.5),
                          ).marginOnly(right: 10),
                          AnimatedTextKit(
                            animatedTexts: itemsAnimatedText,
                            repeatForever: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              CircleAvatar(
                radius: context.percentWidth * 13.88,
                child: Image.asset(kProfile),
              )
            ],
          ).paddingSymmetric(
              horizontal: context.percentHeight * 10,
              vertical: context.percentWidth * 5),
        ),
        Align(
            alignment: Alignment.bottomLeft,
            child: ElevatedButton(
              child: const Text('Download CV'),
              onPressed: () {},
            )).paddingOnly(bottom: context.percentHeight * 10),
      ],
    );
  }
}

//tablet
class TabletHome extends StatelessWidget {
  const TabletHome({
    super.key,
    required this.itemsAnimatedText,
  });

  final List<TyperAnimatedText> itemsAnimatedText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: 'Hi, Welcome to my space\n',
                  style: kPoppinSemiBold.copyWith(
                      color: kWhite, fontSize: context.percentWidth * 3)),
              TextSpan(
                  text: 'I\'m Ralph\n',
                  style: kPoppinBold.copyWith(
                      color: kWhite, fontSize: context.percentWidth * 4)),
              WidgetSpan(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "A",
                      style: kPoppinSemiBold.copyWith(
                          color: kWhite, fontSize: context.percentWidth * 2.5),
                    ).marginOnly(right: 10),
                    AnimatedTextKit(
                      animatedTexts: itemsAnimatedText,
                      repeatForever: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        CircleAvatar(
          radius: context.percentWidth * 13.88,
          child: Image.asset(kProfile),
        )
      ],
    );
  }
}
