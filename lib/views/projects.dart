import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/state/get_x.dart';
import 'package:my_profile/views/widget_sources.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../configuration/constant.dart';
import '../model/projects/project_model.dart';
import '../services/general_services.dart';

String servicesDesc =
    "Throughout my career as a designer and developer, I have crafted digital products catering to both commercial and individual needs.";
String descProd =
    "The SafeMO app is designed for commuters, aiming to provide security measures in partnership with 911 here in Puerto Princesa City.";
String kSafeMoProject = "assets/safemoApp.png";

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  final PageController pageViewControll = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.percentHeight * 92,
      width: context.percentWidth * 100,
      decoration: const BoxDecoration(),
      child: Stack(
        children: [
          TitleWidget(kTitle: "Projects", servicesDesc: servicesDesc),
          Align(
            alignment: ResponsiveBreakpoints.of(context).isMobile
                ? Alignment.center
                : Alignment.bottomCenter,
            child: Obx(
              () => instanceServices.projects.value != null
                  ? Container(
                      decoration: BoxDecoration(
                          color: kLighBlue,
                          borderRadius: BorderRadius.circular(15)),
                      width: ResponsiveBreakpoints.of(context).isMobile
                          ? context.percentWidth * 90
                          : context.percentWidth * 77.083,
                      height: context.percentHeight * 57.88,
                      child: Stack(
                        children: [
                          PageView.builder(
                            itemCount: instanceServices.projects.value?.length,
                            onPageChanged: (index) {
                              print('index $index');
                              instanceServices.currProd.value = index;
                            },
                            controller: pageViewControll,
                            itemBuilder: (context, index) {
                              final GlobalKey keyContainer = GlobalKey();
                              final services = instanceServices
                                  .projects.value![index].project;
                              return ProjectContent(
                                services: services,
                                index: index,
                                keyContainer: keyContainer,
                              );
                            },
                          ),
                          ResponsiveBreakpoints.of(context).isMobile
                              ? const SizedBox.shrink()
                              : Obx(
                                  () => instanceServices.currProd.value !=
                                          instanceServices
                                                  .projects.value!.length -
                                              1
                                      ? Align(
                                          alignment: Alignment.centerRight,
                                          child: IconButton(
                                              iconSize: 50,
                                              color: kWhite,
                                              onPressed: () {
                                                pageViewControll.nextPage(
                                                  duration: const Duration(
                                                      milliseconds: 300),
                                                  curve: Curves.ease,
                                                );
                                              },
                                              icon: const Icon(Icons
                                                  .arrow_circle_right_outlined)),
                                        )
                                      : const SizedBox.shrink(),
                                ),
                          ResponsiveBreakpoints.of(context).isMobile
                              ? const SizedBox.shrink()
                              : Obx(
                                  () => instanceServices.currProd.value > 0
                                      ? Align(
                                          alignment: Alignment.centerLeft,
                                          child: IconButton(
                                              iconSize: 50,
                                              color: kWhite,
                                              onPressed: () {
                                                pageViewControll.previousPage(
                                                  duration: const Duration(
                                                      milliseconds: 300),
                                                  curve: Curves.ease,
                                                );
                                              },
                                              icon: const Icon(Icons
                                                  .arrow_circle_left_outlined)),
                                        )
                                      : const SizedBox.shrink(),
                                ),
                        ],
                      ))
                  : const SizedBox.shrink(),
            ),
          ).marginOnly(
              bottom: ResponsiveBreakpoints.of(context).isMobile
                  ? 0
                  : context.percentHeight * 10),
          instanceServices.projects.value != null
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: SmoothPageIndicator(
                    controller: pageViewControll,
                    count: instanceServices.projects.value!.length,
                    effect: ExpandingDotsEffect(dotColor: kWhite),
                  ),
                ).marginOnly(
                  bottom: ResponsiveBreakpoints.of(context).isMobile
                      ? context.percentHeight * 10
                      : context.percentHeight * 5)
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}

class ProjectContent extends StatelessWidget {
  final ProjectsModel services;

  final int index;
  final GlobalKey keyContainer;
  const ProjectContent({
    super.key,
    required this.keyContainer,
    required this.index,
    required this.services,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: keyContainer,
      height: context.percentHeight * 39.59,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(services.projectTitle,
                      style: kPoppinExtraBold.copyWith(
                          fontSize: ResponsiveBreakpoints.of(context).isDesktop
                              ? context.percentWidth * 2
                              : ResponsiveBreakpoints.of(context).isTablet
                                  ? context.percentWidth * 5
                                  : context.percentWidth * 6,
                          color: kWhite))
                  .marginOnly(
                      left: context.percentWidth * 10,
                      top: context.percentHeight * 3.32),
            ],
          ),
          SizedBox(
            height: context.percentHeight * 39.59,
            child: ResponsiveBreakpoints.of(context).isDesktop
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: context.percentWidth * 40.9,
                        height: context.percentHeight * 37.25,
                        child: Image.asset(
                          services.image,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        width: context.percentWidth * 18,
                        child: Text(services.projectDesc,
                            style: kPoppinRegular.copyWith(
                                fontSize: context.percentWidth * 1.5,
                                color: kWhite)),
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                        SizedBox(
                          width: ResponsiveBreakpoints.of(context).isMobile
                              ? context.percentWidth * 70
                              : context.percentWidth * 50,
                          height: context.percentHeight * 20,
                          child: Image.asset(
                            services.image,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          width: ResponsiveBreakpoints.of(context).isMobile
                              ? context.percentWidth * 80
                              : context.percentWidth * 50,
                          child: Text(services.projectDesc,
                              textAlign: TextAlign.center,
                              style: kPoppinRegular.copyWith(
                                  fontSize:
                                      ResponsiveBreakpoints.of(context).isMobile
                                          ? context.percentWidth * 3.9
                                          : context.percentWidth * 2.5,
                                  color: kWhite)),
                        )
                      ]),
          ),
          ElevatedButton(
                  onPressed: () => GeneralServices().openURL(
                      uri: GeneralServices()
                          .parseURL(url: services.projectLink)),
                  child: const Text("View Project"))
              .marginOnly(bottom: context.percentHeight * 2)
        ],
      ),
    );
  }
}
