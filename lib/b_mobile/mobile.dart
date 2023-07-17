import 'package:flutter/material.dart';
import 'package:my_profile/configuration/constant.dart';

import '../configuration/style.dart';

class MobileLayout extends StatelessWidget {
  final List<String> categories = ['Services', 'Projects', 'Contact'];

  MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kDarkBlue,
          title: Text(kRalph),
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  // Open the navigation drawer
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ),
        body: ListView(
          children: const [
            Center(
              child: Text("Hello, World!"),
            ),
          ],
        ),
        drawer: const DrawerWidget(),
      ),
    );
  }
}

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Drawer(
      width: SizeConfig.blockX! * 80,
      backgroundColor: kDarkBlue,
      // TODO: FINISH THE DRAWER CONTENT
      child: ListView(
        children: [
          ListTile(
            onTap: () {
              debugPrint("This isservices");
            },
            leading: Text(
              "Services",
              style: kPoppinSemiBold.copyWith(color: kWhite),
            ),
          )
        ],
      ),
    );
  }
}
