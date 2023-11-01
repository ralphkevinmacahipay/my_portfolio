import 'package:flutter/material.dart';
import 'package:my_profile/configuration/constant.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

import '../configuration/enum.dart';
import '../views_control/ui.dart';

// TABLET
class NavDrawerTablet extends StatelessWidget {
  const NavDrawerTablet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: context.percentWidth * 40,
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

// MOBILE

class NavDrawerMobile extends StatelessWidget {
  const NavDrawerMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: context.percentWidth * 50,
      backgroundColor: kDarkBlue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: context.percentHeight * 2),
          Text(kRalph,
              style: kPoppinExtraBold.copyWith(
                  color: kWhite, fontSize: context.percentWidth * 6)),
          SizedBox(height: context.percentHeight * 3),
          Expanded(
            child: ListView.builder(
              itemCount: ViewsControll().kNavigator.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () => ViewsControll().onPress(
                      type: ViewsControll().kNavigator[index]['title']),
                  title: Text(
                    ViewsControll().kNavigator[index]['title'],
                    style: kPoppinSemiBold.copyWith(color: kWhite),
                  ),
                  leading: ViewsControll().kNavigator[index]['icon'],
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
          const Spacer(
            flex: 2,
          )
        ],
      ),
    );
  }
}

Future<void> openURL({required Uri uri}) async {
  debugPrint("code ishere");
  if (!await launchUrl(uri)) {
    throw Exception('Could not launch $uri');
  }
}

Uri parseURL({required String url}) {
  final Uri uri = Uri.parse(url);
  return uri;
}
