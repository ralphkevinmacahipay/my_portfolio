import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/configuration/constant.dart';

import '../a_desktop/a_home/navigator.dart';
import '../configuration/enum.dart';
import '../configuration/style.dart';
import '../state_management/state_management.dart';

class MobileLayout extends StatelessWidget {
  final List<String> categories = ['Services', 'Projects', 'Contact'];

  MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
          controller: scrollController,
          children: [
            Container(
              decoration: BoxDecoration(color: kBlue),
              height: SizeConfig.blockY! * 100,
              width: SizeConfig.blockX! * 100,
            ),
            Container(
              decoration: const BoxDecoration(color: Colors.red),
              height: SizeConfig.blockY! * 100,
              width: SizeConfig.blockX! * 100,
            ),
            Container(
              decoration: const BoxDecoration(color: Colors.pinkAccent),
              height: SizeConfig.blockY! * 100,
              width: SizeConfig.blockX! * 100,
            ),
            Container(
              decoration: const BoxDecoration(color: Colors.green),
              height: SizeConfig.blockY! * 100,
              width: SizeConfig.blockX! * 100,
            ),
          ],
        ),
        drawer: const DrawerWidget(),
      ),
    );
  }
}

class DrawerWidget extends GetView<GetManagerController> {
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
      child: ListView.builder(
        itemCount: myList.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              onPressedNav(context: context, enumVal: myList[index]['type']);
            },
            title: Text(
              myList[index]['title'],
              style: kPoppinSemiBold.copyWith(color: kWhite),
            ),
            leading: myList[index]['icon'],
          );
        },
      ),
    );
  }
}
