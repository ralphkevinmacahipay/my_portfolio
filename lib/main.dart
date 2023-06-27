import 'package:flutter/material.dart';
import 'package:my_profile/c_tablet/tablet.dart';
import 'package:get/get.dart';
import 'package:url_strategy/url_strategy.dart';
import 'a_desktop/a_home/home.dart';
import 'b_mobile/mobile.dart';
import 'state_management/state_management.dart';

void main() {
  setPathUrlStrategy();
  Get.put(GetManagerController());
  Get.put(FloatingAvatarController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
          ResponsiveWidget(), //HomePage ResponsiveWidget()   MyHomePage(title: 'URL Launcher')
    );
  }
}

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1024) {
          // Extra large devices (breakpoint: 1024)
          return const HomeDesktop();
        } else if (constraints.maxWidth >= 768) {
          // Large devices (breakpoint: 992)
          return const TabletLayout();
        } else {
          // Medium devices (breakpoint: 768)
          return const MobileLayout();
        }
      },
    );
  }
}
