import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/configuration/constant.dart';
import 'package:velocity_x/velocity_x.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.percentHeight * 92,
      width: context.percentWidth * 100,
      child: Stack(
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: Text(
                "What can I do?",
                style: kPoppinBold.copyWith(
                    color: kWhite, fontSize: context.percentWidth * 3),
              )).marginOnly(top: context.percentHeight * 5),
          Align(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                  color: kLighBlue,
                  borderRadius: BorderRadius.circular(kBorderRadius)),
              height: 312,
              width: 237,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      kAndroidImage,
                      height: 100,
                      width: 100,
                    ),
                    Text("A Mobile App Developer",
                        style: kPoppinExtraBold.copyWith(
                            fontSize: 15, color: kWhite)),
                    Text(
                        "Let’s turn your idea into a working mobile application.",
                        textAlign: TextAlign.center,
                        style: kPoppinSemiBold.copyWith(
                            fontSize: 12, color: kWhite)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RowWidget(icon: kFlutterImage, title: "Flutter"),
                        RowWidget(icon: kFirebaseImage, title: "Firebase"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RowWidget(
                            icon: kGoogleCP, title: "Google Cloud Platform"),
                      ],
                    ),

                    // ListTileWidget(icon: kFirebaseImage, kTitle: "Firebase"),
                    // ListTileWidget(icon: kFlutterImage, kTitle: "Flutter"),

                    // Row(
                    //   children: [
                    //     ListTileWidget(icon: kFlatIconImage, kTitle: "Flutter"),
                    //     ListTileWidget(
                    //         icon: kFirebaseImage, kTitle: "Firebase"),
                    //   ],
                    // ),
                    // ListTileWidget(
                    //     icon: kGoogleCP, kTitle: "Goolge Cloud Platform"),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}

class RowWidget extends StatelessWidget {
  final String icon;
  final String title;
  const RowWidget({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          icon,
          height: 21,
          width: 17,
        ).marginOnly(right: 10),
        Text(title,
            style: kPoppinSemiBold.copyWith(fontSize: 12, color: kWhite))
      ],
    );
  }
}

class ListTileWidget extends StatelessWidget {
  final String icon;
  final String kTitle;
  const ListTileWidget({
    super.key,
    required this.icon,
    required this.kTitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        minLeadingWidth: 2,
        contentPadding: EdgeInsets.zero,
        leading: Image.asset(
          icon,
          height: 21,
          width: 17,
        ),
        title: Text(kTitle,
            style: kPoppinSemiBold.copyWith(fontSize: 12, color: kWhite)));
  }
}
