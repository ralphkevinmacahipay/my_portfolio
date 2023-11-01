import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/views/contacts.dart';
import 'package:my_profile/views/home.dart';
import 'package:my_profile/views/projects.dart';
import 'package:my_profile/views/services.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:velocity_x/velocity_x.dart';

import '../a_desktop/a_home/navigator.dart';
import '../configuration/constant.dart';
import '../state_management/get_manager.dart';

class HomePageResponsive extends StatelessWidget {
  const HomePageResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlue,
      appBar: AppBar(
        shadowColor: kDarkBlue.withOpacity(.5),
        toolbarHeight: context.percentHeight * 8,
        backgroundColor: Colors.transparent,
        // elevation: 5,
        title: ResponsiveBreakpoints.of(context).isMobile
            ? Row(children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
                    .marginOnly(right: context.percentWidth * 5),
                const Text("Home"),
                const Spacer(),
                IconButton(onPressed: () {}, icon: const Icon(Icons.dark_mode))
              ])
            : ResponsiveBreakpoints.of(context).isTablet
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        const Text("Home"),
                        const Text("Ralph.dart"),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.menu))
                      ])
                : Row(children: [
                    IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.light_mode))
                        .marginOnly(right: context.percentWidth * 3),
                    const Text("Ralph.dart"),
                    const Spacer(),
                    ButtonElevated(
                      onPressd: () {
                        scrollToPosition(0);
                        // instanceControll.setHome(home: true);
                      },
                      textTitle: 'Home',
                    ).marginOnly(right: context.percentWidth * 3),
                    ButtonElevated(
                      onPressd: () {
                        scrollToPosition(context.percentHeight * 92);
                        // instanceControll.setHome(services: true);
                      },
                      textTitle: 'Services',
                    ).marginOnly(right: context.percentWidth * 3),
                    ElevatedButton(
                      style: ButtonStyle(backgroundColor:
                          MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.hovered)) {
                          return kBlue;
                        }

                        return kTransparent;
                      })),
                      child: Text(
                        "Projects",
                        style: kPoppinSemiBold.copyWith(
                            color: kWhite,
                            fontSize: context.percentWidth * 1.6),
                      ),
                      onPressed: () {
                        scrollToPosition(context.percentHeight * 92 * 2);
                      },
                    ).marginOnly(right: context.percentWidth * 3),
                    ElevatedButton(
                      style: ButtonStyle(backgroundColor:
                          MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.hovered)) {
                          return kBlue;
                        }

                        return kTransparent;
                      })),
                      child: Text(
                        "Contacts",
                        style: kPoppinSemiBold.copyWith(
                            color: kWhite,
                            fontSize: context.percentWidth * 1.6),
                      ),
                      onPressed: () {
                        scrollToPosition(context.percentHeight * 92 * 4);
                      },
                    )
                  ]),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              kBackground,
            ),
          ),
        ),
        child: ListView(
          controller: scrollController,
          physics: const BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.normal),
          children: const [HomePage(), Services(), Projects(), Contacts()],
        ),
      ),
    );
  }
}

class ButtonElevated extends StatelessWidget {
  final dynamic colorChanger;
  final String textTitle;
  final void Function()? onPressd;

  const ButtonElevated({
    super.key,
    this.colorChanger,
    required this.textTitle,
    this.onPressd,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kBorderRadius))),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            //colorChanger
            if (states.contains(MaterialState.hovered)) {
              return kBlue;
            }
            return kTransparent;

            // return instanceControll.isServiceTap.value
            //     ? kBlue
            //     : kTransparent;
          })),
      onPressed: onPressd,
      child: Text(
        textTitle,
        style: kPoppinSemiBold.copyWith(
            color: kWhite, fontSize: context.percentWidth * 1.6),
      ),
    );
  }
}
