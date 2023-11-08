import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/state/get_x.dart';
import 'package:my_profile/state_management/put_get.dart';
import 'package:my_profile/views/home_page.dart';
import 'package:url_strategy/url_strategy.dart';
import 'a_desktop/a_home/a_home.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'b_mobile/index_drawer.dart';
import 'configuration/constant.dart';
import 'configuration/enum.dart';
import 'configuration/style.dart';
import 'state_management/state_management.dart';

void main() {
  setPathUrlStrategy();
  Get.put(GetManagerController());

  Get.put(ServiceOfMessage());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) =>
          ResponsiveBreakpoints.builder(child: child!, breakpoints: [
        const Breakpoint(start: 0, end: 450, name: MOBILE),
        const Breakpoint(start: 451, end: 800, name: TABLET),
        const Breakpoint(start: 801, end: 1920, name: DESKTOP),
        const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
      ]),
      title: kRalph,
      debugShowCheckedModeBanner: false,
      home:
          const HomePageResponsive(), //HomePage ResponsiveWidget()   MyHomePage(title: 'URL Launcher')  HomePageResponsive()
    );
  }
}

class HoverContainer extends StatefulWidget {
  final int index;

  const HoverContainer({super.key, required this.index});

  @override
  _HoverContainerState createState() => _HoverContainerState();
}

class _HoverContainerState extends State<HoverContainer> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(16.0),
        color: isHovered ? Colors.blue[100] : Colors.white,
        child: Text('Item ${widget.index + 1}'),
      ),
    );
  }
}

class ResponsiveWidget extends GetView<ServiceOfMessage> {
  const ResponsiveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        SizeConfig().init(context);
        double screenWidth = constraints.maxWidth;

        if (screenWidth >= 1008) {
          controller.kPlatform.value = PlatFormEnumType.desktop;

          return const HomeDesktop();
        } else if (screenWidth >= 641 && screenWidth <= 1007) {
          controller.kPlatform.value = PlatFormEnumType.tablet;

          return MobileLayout();
        } else {
          controllerGetManager.isMobile.value = true;
          controller.kPlatform.value = PlatFormEnumType.mobile;
          return MobileLayout();
        }
      },
    );
  }
}
