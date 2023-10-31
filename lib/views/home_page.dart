import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/views/contacts.dart';
import 'package:my_profile/views/home.dart';
import 'package:my_profile/views/projects.dart';
import 'package:my_profile/views/services.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePageResponsive extends StatelessWidget {
  const HomePageResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        elevation: 0,
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
                        .marginOnly(right: context.percentWidth * 5),
                    const Text("Ralph.dart"),
                    const Spacer(),
                    const Text("Home")
                        .marginOnly(right: context.percentWidth * 5),
                    const Text("Services")
                        .marginOnly(right: context.percentWidth * 5),
                    const Text("Projects")
                        .marginOnly(right: context.percentWidth * 5),
                    const Text("Contact")
                  ]),
      ),
      body: ListView(
        children: const [HomePage(), Services(), Projects(), Contacts()],
      ),
    );
  }
}
