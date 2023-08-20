import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../configuration/constant.dart';
import '../../configuration/enum.dart';
import '../../configuration/style.dart';
import '../../state_management/state_management.dart';

class ServicesWidgetMobile extends GetView<ServiceOfMessage> {
  const ServicesWidgetMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      height: SizeConfig.blockY! * 100,
      width: SizeConfig.blockX! * 100,
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: SizeConfig.blockY! * 2),
              Text(
                text_3,
                style: kPoppinBold.copyWith(
                    color: kWhite, fontSize: SizeConfig.blockX! * 7),
              ),
              SizedBox(height: SizeConfig.blockY! * 2),
              Text(
                text_4,
                textAlign: TextAlign.center,
                style: kPoppinRegular.copyWith(
                  color: kLightGrey,
                  fontSize: getSizeDynamic(
                      context: context,
                      kPlatform: controller.kPlatform.value,
                      sizeType: SizeTypeEnum.width,
                      kWidthMobile: 4,
                      kWidthTablet: 3.5,
                      kWidthWeb: 4),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: getSizeDynamic(
                  context: context,
                  kPlatform: controller.kPlatform.value,
                  sizeType: SizeTypeEnum.width,
                  kWidthMobile: 30,
                  kWidthTablet: 38,
                  kWidthWeb: 15),
            ),
            child: Align(
              alignment: Alignment.center,
              child: CarouselSlider(
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  viewportFraction: .8,
                  height: getSizeDynamic(
                    context: context,
                    kHeigthMobile: 48,
                    kHeigthTablet: 47,
                    kHeigtWeb: 48,
                    kPlatform: controller.kPlatform.value,
                    sizeType: SizeTypeEnum.height,
                  ),
                  autoPlay: true,
                ),
                items: listItemCorouselServices
                    .map((kItems) => Container(
                          margin: EdgeInsets.all(SizeConfig.blockX! * 2),
                          width: SizeConfig.blockX! * 75,
                          decoration: BoxDecoration(
                              color: kLighBlue,
                              borderRadius:
                                  BorderRadius.circular(kBorderRadius)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: getSizeDynamic(
                                    context: context,
                                    kPlatform: controller.kPlatform.value,
                                    sizeType: SizeTypeEnum.width,
                                    kWidthMobile: 20,
                                    kWidthTablet: 10,
                                    kWidthWeb: 15),
                                width: getSizeDynamic(
                                    context: context,
                                    kPlatform: controller.kPlatform.value,
                                    sizeType: SizeTypeEnum.width,
                                    kWidthMobile: 30,
                                    kWidthTablet: 15,
                                    kWidthWeb: 30),
                                child: Image.asset(kItems['kMainImage'],
                                    fit: BoxFit.fill),
                              ),
                              Text(
                                kItems["kTextTitle"],
                                style: kPoppinBold.copyWith(
                                  color: kWhite,
                                  fontSize: getSizeDynamic(
                                      context: context,
                                      kPlatform: controller.kPlatform.value,
                                      sizeType: SizeTypeEnum.width,
                                      kWidthMobile: 5,
                                      kWidthTablet: 4,
                                      kWidthWeb: 5),
                                ),
                              ),
                              Text(
                                kItems["kSubTitle"],
                                textAlign: TextAlign.center,
                                style: kPoppinSemiBold.copyWith(
                                  color: kWhite,
                                  fontSize: getSizeDynamic(
                                      context: context,
                                      kPlatform: controller.kPlatform.value,
                                      sizeType: SizeTypeEnum.width,
                                      kWidthMobile: 3.5,
                                      kWidthTablet: 3,
                                      kWidthWeb: 3.5),
                                ),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    height: SizeConfig.blockY! * 5,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Image.asset(
                                                kItems['kImageOne'],
                                                height: SizeConfig.blockY! * 8,
                                                width: SizeConfig.blockX! * 8,
                                              ),
                                              // SizedBox(
                                              //   width: SizeConfig.blockX! * 2,
                                              // ),
                                              Text(
                                                kItems['kTextTwo'],
                                                style: kPoppinSemiBold.copyWith(
                                                  color: kWhite,
                                                  fontSize:
                                                      SizeConfig.blockX! * 4,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Image.asset(
                                                kItems['kImageTwo'],
                                                height: SizeConfig.blockY! * 6,
                                                width: SizeConfig.blockX! * 6,
                                              ),
                                              Text(
                                                kItems['kTextOne'],
                                                style: kPoppinSemiBold.copyWith(
                                                  color: kWhite,
                                                  fontSize:
                                                      SizeConfig.blockX! * 4,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  kItems["kImageThree"] != null
                                      ? SizedBox(
                                          height: SizeConfig.blockY! * 5,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Image.asset(
                                                kItems['kImageThree'],
                                                height: SizeConfig.blockY! * 8,
                                                width: SizeConfig.blockX! * 8,
                                              ),
                                              // SizedBox(
                                              //   width: SizeConfig.blockX! * 2,
                                              // ),
                                              Text(
                                                kItems['kTextThree'],
                                                style: kPoppinSemiBold.copyWith(
                                                  color: kWhite,
                                                  fontSize:
                                                      SizeConfig.blockX! * 4,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : const SizedBox.shrink(),
                                ],
                              ),
                            ],
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
