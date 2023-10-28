import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomePageResponsive extends StatelessWidget {
  const HomePageResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ResponsiveBreakpoints.of(context).isMobile
            ? const Row(children: [Text("Mobile")])
            : ResponsiveBreakpoints.of(context).isTablet
                ? const Row(children: [Text("Tablet")])
                : const Row(children: [
                    Text("Ralph.dart"),
                    Spacer(),
                    Text("Home"),
                    Text("Services"),
                    Text("Projects"),
                    Text("Contact")
                  ]),
      ),
    );
  }
}
