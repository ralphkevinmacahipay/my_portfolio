import 'package:flutter/material.dart';
import 'package:my_profile/constant.dart';
import 'package:my_profile/style.dart';

class DesktopLayout extends StatelessWidget {
  DesktopLayout({super.key});
  final ScrollController _scrollController = ScrollController();

  void scrollToPosition(double position) {
    _scrollController.animateTo(
      position,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final List<NavigatorItem> myNav = [
      NavigatorItem(
          kText: "Home",
          onPressed: () {
            scrollToPosition(0);
          }),
      NavigatorItem(
          kText: "Services",
          onPressed: () {
            scrollToPosition(SizeConfig.blockY! * 100);
          }),
      NavigatorItem(
          kText: "Work",
          onPressed: () {
            scrollToPosition(SizeConfig.blockY! * 100 * 2);
          }),
      NavigatorItem(
          kText: "Contact",
          onPressed: () {
            scrollToPosition(SizeConfig.blockY! * 100 * 3);
          }),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: SizeConfig.blockX! * 10.90),
          child: Text(
            "Ralph.dart",
            style: TextStyle(fontSize: SizeConfig.blockX! * 1.77),
          ),
        ),
        backgroundColor: kDarkBlue,
        actions: myNav
            .map((NavigatorItem item) => TextButton(
                onPressed: item.onPressed,
                child: Container(
                  padding: EdgeInsets.only(right: SizeConfig.blockX! * 1.94),
                  child: Text(
                    item.kText,
                    style: TextStyle(
                        fontSize: SizeConfig.blockX! * 1.38, color: kWhite),
                  ),
                )))
            .toList(),
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
          controller: _scrollController,
          children: [
            SizedBox(
              height: SizeConfig.blockY! * 100,
              width: SizeConfig.blockX! * 100,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: SizeConfig.blockY! * 43.94,
                        left: SizeConfig.blockX! * 10.97),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Hi, Welcome to my space\n',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                            ),
                            TextSpan(
                              text: 'I’m Ralph Kevin Rynard \nMacahipay,\n',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 50),
                            ),
                            TextSpan(
                              text: 'A Mobile and Web Developer\n',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 36),
                            ),
                            TextSpan(
                              text:
                                  'A freelancer that provides programming \nservices and project implementation.',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Text"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: SizeConfig.blockY! * 43.94,
                        right: SizeConfig.blockX! * 10.97),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: CircleAvatar(
                        radius: SizeConfig.blockX! * 10.88,
                        backgroundImage: AssetImage(kProfile),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: SizeConfig.blockY! * 100,
              width: SizeConfig.blockX! * 100,
              decoration: const BoxDecoration(color: Colors.orange),
              child: const Center(child: Text("Orage")),
            ),
            Container(
              height: SizeConfig.blockY! * 100,
              width: SizeConfig.blockX! * 100,
              decoration: const BoxDecoration(color: Colors.blue),
              child: const Center(child: Text("Blue")),
            ),
            Container(
              height: SizeConfig.blockY! * 100,
              width: SizeConfig.blockX! * 100,
              decoration: const BoxDecoration(color: Colors.grey),
              child: const Center(child: Text("Grey")),
            ),
          ],
        ),
      ),
    );
  }
}

class NavigatorItem {
  final VoidCallback onPressed;
  final String kText;

  NavigatorItem({required this.onPressed, required this.kText});
}
