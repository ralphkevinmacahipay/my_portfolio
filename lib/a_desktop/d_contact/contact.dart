import 'package:flutter/material.dart';

import '../../configuration/constant.dart';
import '../../configuration/style.dart';
import '../../my_widget/my_widget.dart';

class Contact extends StatelessWidget {
  const Contact({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      height: SizeConfig.blockY! * 50,
      width: SizeConfig.blockX! * 100,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: SizeConfig.blockY! * 38.76,
              width: SizeConfig.blockX! * 88.61,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  kBorderRadius,
                ),
                color: kLighDark,
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: SizeConfig.blockY! * 1),
                    child: TextWidget(
                      kTextStyle: kPoppinSemiBold,
                      ktext: kContactTitle,
                      kAlign: Alignment.topCenter,
                      kTextColor: kWhite,
                      kFontSize: SizeConfig.blockX! * 3.51,
                    ),
                  ),
                  SubTitleWidget(
                      kTitle: kContactSubTitle,
                      kColor: kWhite,
                      kFointSize: SizeConfig.blockX! * 1.25),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: EdgeInsets.only(top: SizeConfig.blockY! * 10),
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockX! * 10),
                      child: Divider(
                        color: kWhite,
                        height: 10,
                        thickness: 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: SizeConfig.blockY! * 7),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.blockX! * 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconWidgetContact(kIcon: kInstagram),
                            IconWidgetContact(kIcon: kFaceBook),
                            IconWidgetContact(kImage: kGmail),
                            IconWidgetContact(kIcon: kLinkedIn),
                            IconWidgetContact(kIcon: kGitHub),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: SizeConfig.blockY! * 1),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: RichText(
                text: TextSpan(
                  text: 'Developed by ',
                  style: kPoppinRegular.copyWith(
                    color: kWhite,
                    fontSize: SizeConfig.blockX! * 1,
                  ),
                  children: [
                    TextSpan(
                      text: 'Ralph Kevin Rynard E. Macahipay',
                      style: kPoppinBold.copyWith(
                        color: kWhite,
                        fontSize: SizeConfig.blockX! * 1,
                      ),
                    ),
                    TextSpan(
                      text: ' © 2023',
                      style: kPoppinRegular.copyWith(
                        color: kWhite,
                        fontSize: SizeConfig.blockX! * 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IconWidgetContact extends StatelessWidget {
  final String? kImage;
  final String? kIcon;
  const IconWidgetContact({
    super.key,
    this.kIcon,
    this.kImage,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: SizeConfig.blockX! * 2.5,
      onPressed: () {},
      icon: kImage != null
          ? Image.asset(
              kImage!,
              fit: BoxFit.cover,
            )
          : CircleAvatar(
              backgroundColor: kTransparent,
              backgroundImage: AssetImage(kIcon!)),
    );
  }
}
