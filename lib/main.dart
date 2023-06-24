import 'package:flutter/material.dart';
import 'package:my_profile/style.dart';
import 'package:my_profile/tablet/tablet.dart';

import 'desktop/desktop.dart';
import 'mobile/mobile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveWidget(), //HomePage
    );
  }
}

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1024) {
          // Extra large devices (breakpoint: 1024)
          return DesktopLayout();
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
