import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/configuration/constant.dart';
import 'package:my_profile/state/get_x.dart';
import 'package:velocity_x/velocity_x.dart';

String servicesDesc =
    "As a freelance designer and developer, I've collaborated with startups to create digital products for businesses and consumers alike. My services span brand design and programming, offering comprehensive solutions for diverse needs. With a passion for innovation and a commitment to excellence.";

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
              child: Column(
                children: [
                  Text(
                    "Services",
                    style: kPoppinBold.copyWith(
                        color: kWhite, fontSize: context.percentWidth * 3),
                  ),
                  Text(
                    servicesDesc,
                    textAlign: TextAlign.center,
                    style: kPoppinSemiBold.copyWith(
                        color: kLightGrey,
                        fontSize: context.percentWidth * 1.5),
                  ).paddingSymmetric(horizontal: 50),
                ],
              )).marginOnly(top: context.percentHeight * 5),
          Align(
            alignment: Alignment.bottomCenter,
            child: Obx(
              () => SizedBox(
                height: 312,
                child: instanceServices.services.value != null
                    ? Center(
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: instanceServices.services.value?.length,
                          itemBuilder: (context, index) {
                            GlobalKey containerKey = GlobalKey();
                            // final services =
                            //     instanceService.services.value?[index].service;
                            print(
                                "${instanceServices.services.value?[index].service!.icon}");
                            return BuilderServices(
                              containerKey: containerKey,
                              index: index,
                            );
                          },
                        ).marginOnly(),
                      )
                    : const Text("No Services"),
              ),
            ),
          ).marginOnly(bottom: 20)
        ],
      ),
    );
  }
}

class BuilderServices extends StatefulWidget {
  const BuilderServices({
    super.key,
    required this.containerKey,
    required this.index,
  });
  final int index;
  final GlobalKey<State<StatefulWidget>> containerKey;

  @override
  State<BuilderServices> createState() => _BuilderServicesState();
}

class _BuilderServicesState extends State<BuilderServices> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("text");
      },
      onHover: (isHover) {
        setState(() {
          isHovering = isHover;
        });
        print("isHover $isHovering");
      },
      child: AnimatedContainer(
        key: widget.containerKey,
        duration: const Duration(microseconds: 200),
        curve: Curves.ease,
        decoration: BoxDecoration(
            color: isHovering ? kHoverColor : kLighBlue,
            borderRadius: BorderRadius.circular(kBorderRadius)),
        height: 500,
        width: isHovering ? 300 : 237,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                instanceServices.services.value![widget.index].service!
                    .icon, // icon kFlutterImage
                height: 100,
                width: 100,
              ),
              Text(
                  instanceServices
                      .services.value![widget.index].service!.title, //title
                  style:
                      kPoppinExtraBold.copyWith(fontSize: 15, color: kWhite)),
              Text(
                  instanceServices
                      .services.value![widget.index].service!.desc, //desc
                  textAlign: TextAlign.center,
                  style: kPoppinSemiBold.copyWith(fontSize: 12, color: kWhite)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RowWidget(
                      icon: instanceServices
                          .services.value![widget.index].service!.iconA,
                      title: instanceServices
                          .services.value![widget.index].service!.titleA),
                  RowWidget(
                      icon: instanceServices
                          .services.value![widget.index].service!.iconB,
                      title: instanceServices
                          .services.value![widget.index].service!.titleB),
                ],
              ),
              instanceServices.services.value![widget.index].service!.iconC !=
                          '' &&
                      instanceServices
                              .services.value![widget.index].service!.titleC !=
                          ''
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RowWidget(
                            icon: instanceServices
                                .services.value![widget.index].service!.iconC,
                            title: instanceServices
                                .services.value![widget.index].service!.titleC),
                      ],
                    )
                  : const SizedBox.shrink(),
            ]),
      ).marginSymmetric(horizontal: context.percentWidth * 2),
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
