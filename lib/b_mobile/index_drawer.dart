import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/configuration/constant.dart';

import '../a_desktop/a_home/a_home.dart';
import '../a_desktop/a_home/navigator.dart';
import '../configuration/enum.dart';
import '../configuration/style.dart';
import '../functions/functions_widget.dart';
import '../state_management/put_get.dart';
import '../state_management/state_management.dart';
import 'a_home_mobile/a_home.dart';
import 'b_services_mobile/services.dart';
import 'c_project_mobile/project.dart';
import 'd_contact_mobile/contacts.dart';

class MobileLayout extends StatelessWidget {
  final List<String> categories = ['Services', 'Projects', 'Contact'];

  MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Padding(
          padding: EdgeInsets.only(
              bottom: SizeConfig.blockY! * 3, right: SizeConfig.blockX! * 3),
          child: ChatButton(
              kFontSizeTitle: SizeConfig.blockX! * 5,
              kFontSize: SizeConfig.blockX! * 5,
              kPaddingResponsive: EdgeInsets.symmetric(
                  vertical: SizeConfig.blockX! * 1,
                  horizontal: SizeConfig.blockX! * 5)),
        ),
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
            children: const [
              HomeWidgetMobile(),
              ServicesWidgetMobile(),
              WordsWidgetMobile(),
              ContactWidgetMobile(),
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