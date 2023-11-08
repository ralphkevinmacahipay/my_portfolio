import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/configuration/constant.dart';
import 'package:my_profile/state/get_x.dart';
import 'package:velocity_x/velocity_x.dart';

List<Map<String, dynamic>> projectList = [
  {
    'icon': kAndroidImage,
    'title': 'A Mobile App Developer',
    'desc': 'Let’s turn your idea into a working mobile application.',
    'icon_a': kFlutterImage,
    'title_a': 'Flutter',
    'icon_b': kFirebaseImage,
    'title_b': 'Firebase',
    'icon_c': kGoogleCP,
    'title_c': 'Google Cloud Platform',
  },
  {
    'icon': kWebImage,
    'title': 'A Web App Developer',
    'desc': 'Let’s turn your idea into a working web application.',
    'icon_a': kFlutterImage,
    'title_a': 'Flutter',
    'icon_b': kFirebaseImage,
    'title_b': 'Firebase',
    'icon_c': kGoogleCP,
    'title_c': 'Google Cloud Platform',
  },
  {
    'icon': kUiImage,
    'title': 'A UI/UX Designer',
    'desc': 'Transforming ideas into intuitive interfaces\nwith a human touch.',
    'icon_a': kFlatIconImage,
    'title_a': 'Flaticon',
    'icon_b': kFigmaImage,
    'title_b': 'Figma',
    'icon_c': '',
    'title_c': '',
  },
];

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ServiceStateControll());
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
            child: Obx(
              () => SizedBox(
                height: 312,
                child: instanceService.services.value != null
                    ? Center(
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: instanceService.services.value?.length,
                          itemBuilder: (context, index) {
                            // final services =
                            //     instanceService.services.value?[index].service;
                            print(
                                "${instanceService.services.value?[index].service!.icon}");
                            return Container(
                              decoration: BoxDecoration(
                                  color: kLighBlue,
                                  borderRadius:
                                      BorderRadius.circular(kBorderRadius)),
                              height: 312,
                              width: 237,
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      instanceService.services.value![index]
                                          .service!.icon, // icon kFlutterImage
                                      height: 100,
                                      width: 100,
                                    ),
                                    Text(
                                        instanceService.services.value![index]
                                            .service!.title, //title
                                        style: kPoppinExtraBold.copyWith(
                                            fontSize: 15, color: kWhite)),
                                    Text(
                                        instanceService.services.value![index]
                                            .service!.desc, //desc
                                        textAlign: TextAlign.center,
                                        style: kPoppinSemiBold.copyWith(
                                            fontSize: 12, color: kWhite)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        RowWidget(
                                            icon: instanceService.services
                                                .value![index].service!.iconA,
                                            title: instanceService.services
                                                .value![index].service!.titleA),
                                        RowWidget(
                                            icon: instanceService.services
                                                .value![index].service!.iconB,
                                            title: instanceService.services
                                                .value![index].service!.titleB),
                                      ],
                                    ),
                                    instanceService.services.value![index]
                                                    .service!.iconC !=
                                                '' &&
                                            instanceService
                                                    .services
                                                    .value![index]
                                                    .service!
                                                    .titleC !=
                                                ''
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              RowWidget(
                                                  icon: instanceService
                                                      .services
                                                      .value![index]
                                                      .service!
                                                      .iconC,
                                                  title: instanceService
                                                      .services
                                                      .value![index]
                                                      .service!
                                                      .titleC),
                                            ],
                                          )
                                        : const SizedBox.shrink(),
                                  ]),
                            ).marginSymmetric(
                                horizontal: context.percentWidth * 2);
                          },
                        ).marginOnly(),
                      )
                    : const Text("No Services"),
              ),
            ),
          ).marginOnly(top: 50)
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
