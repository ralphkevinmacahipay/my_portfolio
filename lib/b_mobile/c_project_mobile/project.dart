import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../configuration/constant.dart';
import '../../configuration/style.dart';

class WordsWidgetMobile extends StatelessWidget {
  const WordsWidgetMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      height: SizeConfig.blockY! * 100,
      width: SizeConfig.blockX! * 100,
      child: Stack(children: [
        Column(
          children: [
            SizedBox(height: SizeConfig.blockY! * 2),
            Text(
              kProjectTextTitle,
              style: kPoppinBold.copyWith(
                  color: kWhite, fontSize: SizeConfig.blockX! * 7),
            ),
            SizedBox(height: SizeConfig.blockY! * 2),
            Text(
              kProjectSubTitle,
              textAlign: TextAlign.center,
              style: kPoppinRegular.copyWith(
                color: kLightGrey,
                fontSize: SizeConfig.blockX! * 4,
              ),
            ),
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: SizeConfig.blockY! * 15),
                  child: Align(
                    alignment: Alignment.center,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        enlargeCenterPage: true,
                        viewportFraction: .8,
                        height: SizeConfig.blockY! * 39,
                        autoPlay: true,
                      ),
                      items: listItemCorouselWork
                          .map((kItems) => Container(
                                padding: EdgeInsets.all(SizeConfig.blockX! * 2),
                                width: SizeConfig.blockX! * 80,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                          kItems['image'],
                                        )),
                                    borderRadius:
                                        BorderRadius.circular(kBorderRadius)),
                              ))
                          .toList(),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ]),
    );
  }
}
