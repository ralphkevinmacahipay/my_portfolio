import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/configuration/constant.dart';
import 'package:my_profile/services/general_services.dart';
import 'package:velocity_x/velocity_x.dart';

String contactDesc =
    "Let’s transform your idea into reality, if you have any needs when it comes to programming or UI/UX design, please contact me.";

class Contacts extends StatelessWidget {
  const Contacts({super.key});

  @override
  Widget build(BuildContext context) {
    print("h: ${context.percentHeight * 100}");

    return SizedBox(
      height: context.percentHeight * 92,
      width: context.percentWidth * 100,
      child: Stack(children: [
        Align(
            alignment: Alignment.topCenter,
            child: Text(
              "Contacts",
              style: kPoppinBold.copyWith(
                  color: kWhite, fontSize: context.percentWidth * 3),
            )).marginOnly(top: context.percentHeight * 2),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
                color: kLighDark, borderRadius: BorderRadius.circular(15)),
            width: context.percentWidth * 88.61,
            height: context.percentHeight * 40.76,
            child: Column(children: [
              Text("Stay Connected",
                  style: kPoppinSemiBold.copyWith(
                      color: kWhite, fontSize: context.percentWidth * 4.513)),
              Text(contactDesc,
                  textAlign: TextAlign.center,
                  style: kPoppinRegular.copyWith(
                    color: kWhite,
                    fontSize: context.percentWidth * 1.3888,
                  )).marginSymmetric(horizontal: context.percentWidth * 5),
              Divider(
                thickness: 2,
                color: kWhite,
                height: 10,
              ).marginSymmetric(horizontal: context.percentWidth * 5),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconWidgetProvider(kIcon: kFaceBook, link: kMyFaceBook),
                  IconWidgetProvider(kIcon: kInstagram, link: kMyInstagram),
                  IconWidgetProvider(kIcon: kGitHub, link: kMyGitHub),
                  IconWidgetProvider(kIcon: kLinkedIn, link: kMyLinkedIn),
                ],
              ).marginOnly(bottom: context.percentHeight * 5)
            ]),
          ),
        ).marginOnly(bottom: context.percentHeight * 10),
        Align(
          alignment: Alignment.bottomCenter,
          child: RichText(
            text: TextSpan(
              text: 'Developed by ',
              style: kPoppinRegular.copyWith(
                color: kWhite,
                fontSize: context.percentWidth * 1,
              ),
              children: [
                TextSpan(
                  text: 'Ralph Kevin Rynard E. Macahipay',
                  style: kPoppinBold.copyWith(
                    color: kWhite,
                    fontSize: context.percentWidth * 1,
                  ),
                ),
                TextSpan(
                  text: ' © 2023',
                  style: kPoppinRegular.copyWith(
                    color: kWhite,
                    fontSize: context.percentWidth * 1,
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}

class IconWidgetProvider extends StatelessWidget {
  final String kIcon; //kFaceBook

  final String link;
  const IconWidgetProvider({
    super.key,
    required this.kIcon,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: context.percentWidth * 2.472,
      onPressed: () =>
          GeneralServices().openURL(uri: GeneralServices().parseURL(url: link)),
      icon: Image.asset(kIcon, fit: BoxFit.cover),
    );
  }
}
