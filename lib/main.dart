import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/state_management/put_get.dart';
import 'package:url_strategy/url_strategy.dart';
import 'a_desktop/a_home/a_home.dart';

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
      title: kRalph,
      debugShowCheckedModeBanner: false,
      home:
          const ResponsiveWidget(), //HomePage ResponsiveWidget()   MyHomePage(title: 'URL Launcher')
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
