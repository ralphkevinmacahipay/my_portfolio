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
    final CarouselController controllerCarousel = CarouselController();

    final List<Map<String, dynamic>> imageUrls = [
      {
        'kMainImage': kAndroidImage,
        "kTextTitle": text_6,
        "kSubTitle": text_7,
        "kTextOne": text_8,
        "kTextTwo": text_9,
        "kTextThree": text_16,
        "kImageOne": kFirebaseImage,
        "kImageTwo": kFlutterImage,
        "kImageThree": kGoogleCP,
      },
      {
        'kMainImage': kWebImage,
        "kTextTitle": text_14,
        "kSubTitle": text_15,
        "kTextOne": text_8,
        "kTextTwo": text_9,
        "kTextThree": text_16,
        "kImageOne": kFirebaseImage,
        "kImageTwo": kFlutterImage,
        "kImageThree": kGoogleCP,
      },

      {
        'kMainImage': kUiImage,
        "kTextTitle": text_10,
        "kSubTitle": text_11,
        "kTextOne": text_8,
        "kTextTwo": text_13,
        "kTextThree": text_16,
        "kImageOne": kFigmaImage,
        "kImageTwo": kFlatIconImage,
      },

      // Add more image URLs here
    ];

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
                  height: SizeConfig.blockY! * 50,
                  autoPlay: true,
                ),
                items: imageUrls
                    .map((kItems) => Container(
                          margin: EdgeInsets.all(SizeConfig.blockX! * 2),
                          width: SizeConfig.blockX! * 75,
                          decoration: BoxDecoration(
                              color: kLighBlue,
                              borderRadius:
                                  BorderRadius.circular(kBorderRadius)),
                          child: Column(
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
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
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
                                  kItems["kImageThree"] != null
                                      ? Row(
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
                                        )
                                      : const SizedBox.shrink(),
                                  SizedBox(
                                    height: SizeConfig.blockY! * 2,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ))
                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
