import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/configuration/constant.dart';
import 'package:velocity_x/velocity_x.dart';

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

class MobileLayout extends GetView<ServiceOfMessage> {
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
              kFontSize: getFontSize(
                  kPlatform: controller.kPlatform.value,
                  sizeType: SizeTypeEnum.width),
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

class NavigatorDrawerWidget extends StatelessWidget {
  const NavigatorDrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: context.percentWidth * 80,
      backgroundColor: kDarkBlue,
      child: Column(
        children: [
          SizedBox(height: context.percentHeight * 2),
          Text(kRalph,
              style: kPoppinExtraBold.copyWith(
                  color: kWhite, fontSize: context.percentWidth * 6)),
          SizedBox(height: context.percentHeight * 3),
          Expanded(
            child: ListView.builder(
              itemCount: kNavigator.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    // onPressedNav(
                    //     context: context, enumVal: kNavigator[index]['type']);
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
          SizedBox(height: context.percentHeight * 50),
        ],
      ),
    );
  }
}
