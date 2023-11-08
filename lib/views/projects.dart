import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../configuration/constant.dart';

String servicesDesc =
    "Throughout my career as a designer and developer, I have crafted digital products catering to both commercial and individual needs.";

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.percentHeight * 92,
      width: context.percentWidth * 100,
      decoration: const BoxDecoration(),
      child: Stack(children: [
        Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Text(
                  "Projects",
                  style: kPoppinBold.copyWith(
                      color: kWhite, fontSize: context.percentWidth * 3),
                ),
                Text(
                  servicesDesc,
                  textAlign: TextAlign.center,
                  style: kPoppinSemiBold.copyWith(
                      color: kLightGrey, fontSize: context.percentWidth * 1.5),
                ).paddingSymmetric(horizontal: 50),
              ],
            )).marginOnly(top: context.percentHeight * 5),
      ]),
    );
  }
}
