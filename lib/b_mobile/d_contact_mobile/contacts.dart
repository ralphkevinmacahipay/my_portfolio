import 'package:flutter/material.dart';

import '../../configuration/constant.dart';
import '../../configuration/style.dart';

class ContactWidgetMobile extends StatelessWidget {
  const ContactWidgetMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.blockY! * 85,
      width: SizeConfig.blockX! * 100,
      child: Stack(
        fit: StackFit.loose,
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              SizedBox(height: SizeConfig.blockY! * 2),
              // Title
              Text(
                kContactTitle,
                style: kPoppinBold.copyWith(
                    color: kWhite, fontSize: SizeConfig.blockX! * 7),
              ),
              SizedBox(height: SizeConfig.blockY! * 2),
              // Sub Title
              Text(
                kContactSubTitle,
                textAlign: TextAlign.center,
                style: kPoppinRegular.copyWith(
                  color: kLightGrey,
                  fontSize: SizeConfig.blockX! * 4,
                ),
              ),
              // Icons
              SizedBox(height: SizeConfig.blockY! * 2),
              Expanded(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: myListIcon.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        IconButton(
                            iconSize: SizeConfig.blockX! * 21,
                            onPressed: () {},
                            icon: Container(
                              decoration: BoxDecoration(
                                color: kLightBlue.withOpacity(.8),
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: kLightBlue.withOpacity(.8),
                                    width: SizeConfig.blockX! * 2),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: kTransparent,
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        fit: BoxFit.contain,
                                        image: AssetImage(
                                          myListIcon[index]['icon'],
                                        ))),
                              ),
                            )),
                        SizedBox(height: SizeConfig.blockY! * .1),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Developed by ',
                    style: kPoppinRegular.copyWith(
                      color: kWhite,
                      fontSize: SizeConfig.blockX! * 3.5,
                    ),
                    children: [
                      TextSpan(
                        text: 'Ralph Kevin Rynard E. Macahipay',
                        style: kPoppinBold.copyWith(
                          color: kWhite,
                          fontSize: SizeConfig.blockX! * 3.5,
                        ),
                      ),
                      TextSpan(
                        text: ' © 2023',
                        style: kPoppinRegular.copyWith(
                          color: kWhite,
                          fontSize: SizeConfig.blockX! * 3.5,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.blockY! * 4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
