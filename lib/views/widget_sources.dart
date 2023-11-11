import 'package:flutter/material.dart';
import 'package:my_profile/services/general_services.dart';
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
