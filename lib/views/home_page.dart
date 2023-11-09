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
import '../services/general_services.dart';

class HomePageResponsive extends StatelessWidget {
  const HomePageResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ResponsiveBreakpoints.of(context).isMobile
          ? const NavDrawerMobile()
          : null,
      endDrawer: ResponsiveBreakpoints.of(context).isTablet
          ? const NavDrawerTablet()
          : null,
      // drawer:
      //     ResponsiveBreakpoints.of(context).isTablet ? const NavDrawer() : null,
      backgroundColor: kDarkBlue,
      appBar: AppBar(
        shadowColor: kDarkBlue.withOpacity(.5),
        toolbarHeight: context.percentHeight * 8,
        backgroundColor: Colors.transparent,
        // elevation: 5,
        title: ResponsiveBreakpoints.of(context).isMobile
            ? Row(children: [
                Text("Home",
                    style: kPoppinBold.copyWith(
                        fontSize: context.percentWidth * 7)),
                const Spacer(),
                IconButton(onPressed: () {}, icon: const Icon(Icons.dark_mode))
              ])
            : ResponsiveBreakpoints.of(context).isTablet
                ? const Stack(children: [
                    Align(alignment: Alignment.centerLeft, child: Text("Home")),
                    Align(
                        alignment: Alignment.center, child: Text("Ralph.dart")),
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: const Icon(Icons.menu),
                    // )
                  ])
                : Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.light_mode,
                          size: context.percentWidth * 1.5,
                        )).marginOnly(right: context.percentWidth * 3),
                    Text("Ralph.dart",
                        style: kPoppinBold.copyWith(
                            fontSize: context.percentWidth * 2)),
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
                    ButtonElevated(
                      onPressd: () {
                        scrollToPosition(context.percentHeight * 92 * 2);
                        // instanceControll.setHome(services: true);
                      },
                      textTitle: 'Projects',
                    ).marginOnly(right: context.percentWidth * 3),
                    ButtonElevated(
                      onPressd: () {
                        scrollToPosition(context.percentHeight * 92 * 4);
                        // instanceControll.setHome(services: true);
                      },
                      textTitle: 'Contacts',
                    ).marginOnly(right: context.percentWidth * 3),
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

// TABLET
class NavDrawerTablet extends StatelessWidget {
  const NavDrawerTablet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: context.percentWidth * 40,
      backgroundColor: kDarkBlue,
      child: Column(
        children: [
          SizedBox(height: context.percentHeight * 2),
          Text(kRalph,
              style: kPoppinExtraBold.copyWith(
                  color: kWhite, fontSize: context.percentWidth * 6)),
          SizedBox(height: context.percentHeight * 3),
          Expanded(
            child: ListView.builder(
              itemCount: kNavigator.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    // onPressedNav(
                    //     context: context, enumVal: kNavigator[index]['type']);
                  },
                  title: Text(
                    kNavigator[index]['title'],
                    style: kPoppinSemiBold.copyWith(color: kWhite),
                  ),
                  leading: kNavigator[index]['icon'],
                );
              },
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith(
                (states) => kLightBlue,
              ),
            ),
            onPressed: () => GeneralServices()
                .openURL(uri: GeneralServices().parseURL(url: kCV)),
            child: Text(kDownloadCV),
          ),
          SizedBox(height: context.percentHeight * 50),
        ],
      ),
    );
  }
}

// MOBILE
class NavDrawerMobile extends StatelessWidget {
  const NavDrawerMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: context.percentWidth * 50,
      backgroundColor: kDarkBlue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: context.percentHeight * 2),
          Text(kRalph,
              style: kPoppinExtraBold.copyWith(
                  color: kWhite, fontSize: context.percentWidth * 6)),
          SizedBox(height: context.percentHeight * 3),
          Expanded(
            child: ListView.builder(
              itemCount: ViewsControll().kNavigator.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () => ViewsControll().onPress(
                      context: context,
                      type: ViewsControll().kNavigator[index]['title']),
                  title: Text(
                    ViewsControll().kNavigator[index]['title'],
                    style: kPoppinSemiBold.copyWith(color: kWhite),
                  ),
                  leading: ViewsControll().kNavigator[index]['icon'],
                );
              },
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith(
                (states) => kLightBlue,
              ),
            ),
            onPressed: () => GeneralServices()
                .openURL(uri: GeneralServices().parseURL(url: kCV)),
            child: Text(kDownloadCV),
          ),
          const Spacer(
            flex: 2,
          )
        ],
      ),
    );
  }
}

class ViewsControll {
  final List<Map<String, dynamic>> kNavigator = [
    {
      "title": 'Home',
      "icon": Icon(Icons.home_filled, color: kWhite),
    },
    {
      "title": 'Services',
      "icon": Icon(Icons.work_history, color: kWhite),
    },
    {
      "title": 'Projects',
      "icon": Icon(Icons.auto_awesome_motion_rounded, color: kWhite),
    },
    {
      "title": 'Contacts',
      "icon": Icon(Icons.contact_phone_outlined, color: kWhite),
    }
  ];

  onPress({required BuildContext context, required String type}) {
    switch (type) {
      case 'Home':
        scrollToPosition(0);

      case 'Services':
        scrollToPosition(context.percentHeight * 92);

      case 'Projects':
        scrollToPosition(context.percentHeight * 92 * 2);

      case 'Contacts':
        scrollToPosition(context.percentHeight * 92 * 4);
    }
  }
}
