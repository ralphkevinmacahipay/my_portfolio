import 'package:flutter/material.dart';

import '../../configuration/constant.dart';
import '../../configuration/style.dart';

class ContactWidgetMobile extends StatelessWidget {
  const ContactWidgetMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> myListIcon = [
      {'icon': kInstagram},
      {'icon': kFaceBook},
      {'icon': kGitHub},
      {'icon': kGmail},
      {'icon': kLinkedIn},
    ];
    return SizedBox(
      height: SizeConfig.blockY! * 100,
      width: SizeConfig.blockX! * 100,
      child: Stack(children: [
        Column(
          children: [
            SizedBox(height: SizeConfig.blockY! * 2),
            Text(
              kContactTitle,
              style: kPoppinBold.copyWith(
                  color: kWhite, fontSize: SizeConfig.blockX! * 7),
            ),
            SizedBox(height: SizeConfig.blockY! * 2),
            Text(
              kContactSubTitle,
              textAlign: TextAlign.center,
              style: kPoppinRegular.copyWith(
                color: kLightGrey,
                fontSize: SizeConfig.blockX! * 4,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: myListIcon.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: kWhite, width: SizeConfig.blockX! * 2),
                        color: kTransparent,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage(
                              myListIcon[index]['icon'],
                            ))),
                    height: SizeConfig.blockX! * 25,
                    child: Image.asset(
                      myListIcon[index]['icon'],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
