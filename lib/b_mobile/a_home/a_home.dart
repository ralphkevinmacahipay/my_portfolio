import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/state_management/state_management.dart';

import '../../configuration/constant.dart';
import '../../configuration/style.dart';

class HomeWidgetClass extends GetView<ServiceOfGetValue> {
  const HomeWidgetClass({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.blockY! * 100,
      width: SizeConfig.blockX! * 100,
      child: Stack(children: [
        Padding(
          padding: EdgeInsets.only(top: SizeConfig.blockY! * 4),
          child: Align(
            alignment: Alignment.topCenter,
            child: AnimatedBuilder(
              animation: controller.getAnimation,
              builder: (context, child) => Stack(
                children: [
                  Positioned(
                    right: controller.getAnimation.value,
                    child: Container(
                      width: SizeConfig.blockX! * 70,
                      height: SizeConfig.blockX! * 70,
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
                        radius: SizeConfig.blockX! * 70,
                        backgroundImage: AssetImage(kProfile),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
