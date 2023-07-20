import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../configuration/constant.dart';
import '../../configuration/style.dart';

class ServicesWidgetMobile extends StatelessWidget {
  const ServicesWidgetMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                  fontSize: SizeConfig.blockX! * 4,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: SizeConfig.blockY! * 15),
            child: Align(
              alignment: Alignment.center,
              child: CarouselSlider(
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  viewportFraction: .8,
                  height: SizeConfig.blockY! * 48,
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
                                height: SizeConfig.blockY! * 15,
                                width: SizeConfig.blockX! * 30,
                                child: Image.asset(kItems['kMainImage'],
                                    fit: BoxFit.fill),
                              ),
                              Text(
                                kItems["kTextTitle"],
                                style: kPoppinBold.copyWith(
                                  color: kWhite,
                                  fontSize: SizeConfig.blockX! * 5,
                                ),
                              ),
                              Text(
                                kItems["kSubTitle"],
                                textAlign: TextAlign.center,
                                style: kPoppinSemiBold.copyWith(
                                  color: kWhite,
                                  fontSize: SizeConfig.blockX! * 3.5,
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
