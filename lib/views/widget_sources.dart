import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/services/general_services.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:velocity_x/velocity_x.dart';

import '../configuration/constant.dart';

class ElevatedWidget extends StatelessWidget {
  final double h;
  final double w;
  final double s;

  final String ktitle;
  final void Function()? onPress;

  const ElevatedWidget({
    super.key,
    required this.ktitle,
    required this.onPress,
    required this.h,
    required this.w,
    required this.s,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          fixedSize: MaterialStatePropertyAll(
              Size(context.percentWidth * 8, context.percentWidth * 2.5)),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              side: BorderSide(width: 1.5, color: kWhite),
              borderRadius: BorderRadius.circular(kBorderRadius))),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.hovered)) {
              return Colors.blue;
            }
            return kTransparent;
          })),
      onPressed: onPress,
      child: Text(
        ktitle,
        style: kPoppinSemiBold.copyWith(fontSize: context.percentWidth * 1.4),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  final String kTitle;
  final String servicesDesc;
  const TitleWidget(
      {super.key, required this.servicesDesc, required this.kTitle});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpoints.of(context).isMobile
        ? Align(
            alignment: Alignment.topCenter,
            child: Text(
              servicesDesc,
              textAlign: TextAlign.center,
              style: kPoppinSemiBold.copyWith(
                  color: kLightGrey, fontSize: context.percentWidth * 3.5),
            ),
          ).marginAll(context.percentHeight * 2.5)
        : Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Text(
                  kTitle,
                  style: kPoppinBold.copyWith(
                      color: kWhite,
                      fontSize: ResponsiveBreakpoints.of(context).isDesktop
                          ? context.percentWidth * 3
                          : ResponsiveBreakpoints.of(context).isTablet
                              ? context.percentWidth * 5
                              : 0),
                ),
                Text(
                  servicesDesc,
                  textAlign: TextAlign.center,
                  style: kPoppinSemiBold.copyWith(
                      color: kLightGrey,
                      fontSize: ResponsiveBreakpoints.of(context).isDesktop
                          ? context.percentWidth * 1.5
                          : context.percentWidth * 2.5),
                ).paddingSymmetric(
                    horizontal: 50,
                    vertical:
                        ResponsiveBreakpoints.of(context).isTablet ? 50 : 0),
              ],
            )).marginOnly(top: context.percentHeight * 0);
  }
}
