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
      {'image': kAndroidImage},
      {'image': kWebImage},

      {'image': kUiImage},

      // Add more image URLs here
    ];

    return SizedBox(
      height: SizeConfig.blockY! * 100,
      width: SizeConfig.blockX! * 100,
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: SizeConfig.blockY! * 2,
              ),
              Text(
                text_3,
                style: kPoppinBold.copyWith(
                    color: kWhite, fontSize: SizeConfig.blockX! * 7),
              ),
              Text(
                text_4,
                textAlign: TextAlign.center,
                style: kPoppinRegular.copyWith(
                  color: kLightGrey,
                  fontSize: SizeConfig.blockX! * 5,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: SizeConfig.blockY! * 30),
            child: Align(
              alignment: Alignment.center,
              child: CarouselSlider(
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  viewportFraction: .8,
                  height: SizeConfig.blockY! * 40,
                  autoPlay: true,
                ),
                items: imageUrls
                    .map((kImageMap) => Container(
                          padding: EdgeInsets.all(SizeConfig.blockX! * 2),
                          width: SizeConfig.blockX! * 75,
                          decoration: BoxDecoration(
                              color: kLighBlue,
                              borderRadius:
                                  BorderRadius.circular(kBorderRadius)),
                          child: Column(
                            children: [
                              SizedBox(
                                height: SizeConfig.blockY! * 15,
                                width: SizeConfig.blockX! * 30,
                                child: Image.asset(kImageMap['image'],
                                    fit: BoxFit.fill),
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
