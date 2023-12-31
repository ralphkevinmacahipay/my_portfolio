import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/configuration/constant.dart';
import 'package:my_profile/configuration/style.dart';
import '../../state_management/state_management.dart';

class FloatingAvatar extends GetView<ServiceOfMessage> {
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
