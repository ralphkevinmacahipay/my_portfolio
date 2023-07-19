import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/configuration/constant.dart';

import '../a_desktop/a_home/navigator.dart';
import '../configuration/enum.dart';
import '../configuration/style.dart';
import '../functions/functions_widget.dart';
import '../state_management/put_get.dart';
import '../state_management/state_management.dart';
import 'a_home_mobile/a_home.dart';
import 'b_services_mobile/services.dart';

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
          title: Obx(() =>
              Text(controllerGetManager.kTitle.value, style: kPoppinBold)),
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
            children: [
              const HomeWidgetMobile(),
              const ServicesWidgetMobile(),
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
        ),
        drawer: const NavigatorDrawerWidget(),
      ),
    );
  }
}

class NavigatorDrawerWidget extends GetView<GetManagerController> {
  const NavigatorDrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Drawer(
      width: SizeConfig.blockX! * 80,
      backgroundColor: kDarkBlue,
      // TODO: FINISH THE DRAWER CONTENT
      child: Column(
        children: [
          SizedBox(height: SizeConfig.blockY! * 2),
          Text(kRalph,
              style: kPoppinExtraBold.copyWith(
                  color: kWhite, fontSize: SizeConfig.blockX! * 6)),
          SizedBox(height: SizeConfig.blockY! * 3),
          Expanded(
            child: ListView.builder(
              itemCount: kNavigator.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    onPressedNav(
                        context: context, enumVal: kNavigator[index]['type']);
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
            onPressed: () => openURL(uri: parseURL(url: kCV)),
            child: Text(kDownloadCV),
          ),
          SizedBox(height: SizeConfig.blockY! * 50),
        ],
      ),
    );
  }
}
