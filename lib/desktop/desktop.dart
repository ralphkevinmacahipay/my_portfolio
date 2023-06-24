import 'package:flutter/material.dart';
import 'package:my_profile/constant.dart';
import 'package:my_profile/style.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

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

    List<TyperAnimatedText> items = [
      TyperAnimatedText(kTextAnimated_1,
          textStyle: kPoppinBold.copyWith(
              fontSize: SizeConfig.blockX! * 2, color: kWhite),
          speed: const Duration(milliseconds: 100)),
      TyperAnimatedText(kTextAnimated_2,
          textStyle: kPoppinBold.copyWith(
              fontSize: SizeConfig.blockX! * 2, color: kWhite),
          speed: const Duration(milliseconds: 100)),
      TyperAnimatedText(kTextAnimated_3,
          textStyle: kPoppinBold.copyWith(
              fontSize: SizeConfig.blockX! * 2, color: kWhite),
          speed: const Duration(milliseconds: 100)),
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
                        bottom: SizeConfig.blockY! * 30.94,
                        left: SizeConfig.blockX! * 10.97),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Hi, Welcome to my space\n',
                              style: kPoppinSemiBold.copyWith(
                                wordSpacing: SizeConfig.blockX! * 0.2,
                                letterSpacing: SizeConfig.blockX! * 0.2,
                                fontSize: SizeConfig.blockX! * 2.08,
                                color: kWhite,
                              ),
                            ),
                            TextSpan(
                              text: '\n', // Empty TextSpan for spacing
                              style: TextStyle(
                                fontSize: SizeConfig.blockY! * 2.95,
                              ), // Adjust the font size as needed
                            ),
                            TextSpan(
                              text: 'I’m Ralph Kevin Rynard \nMacahipay\n',
                              style: kPoppinExtraBold.copyWith(
                                letterSpacing: SizeConfig.blockX! * 0.34,
                                height: 1.2,
                                color: kWhite,
                                fontSize: SizeConfig.blockX! * 3,
                              ),
                            ),
                            const TextSpan(
                              text: '\n', // Empty TextSpan for spacing
                              style: TextStyle(
                                fontSize: 16,
                              ), // Adjust the font size as needed
                            ),
                            WidgetSpan(
                              child: Row(
                                children: [
                                  Text(
                                    "A",
                                    style: kPoppinBold.copyWith(
                                      fontSize: SizeConfig.blockX! * 2,
                                      color: kWhite,
                                    ),
                                  ),
                                  SizedBox(
                                    width: SizeConfig.blockX! * 2,
                                  ),
                                  AnimatedTextKit(
                                    animatedTexts: items,
                                    repeatForever: true,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: SizeConfig.blockX! * 10.90,
                        top: SizeConfig.blockY! * 38),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(kBorderRadius),
                            border: Border.all(color: Colors.white),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 24),
                          child: Text(
                            "DOWNLOAD CV",
                            style: kPoppinSemiBold.copyWith(
                              fontSize: SizeConfig.blockX! * 1.5,
                              color: kWhite,
                            ),
                          ),
                        ),
                      ),
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
                  ),
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
              child: AnimatedTextKit(
                animatedTexts: items,
                isRepeatingAnimation: true,
              ),
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

//  TextSpan(
//                               text:
//                                   'A freelancer that provides programming \nservices and project implementation.',
//                               style: kPoppinSemiBold.copyWith(
//                                 fontSize: SizeConfig.blockX! * 1.5,
//                                 color: kLightGrey,
//                               ),
//                             ),



// Text.rich(
//                         TextSpan(
//                           children: [
//                             TextSpan(
//                               text: 'Hi, Welcome to my space\n',
//                               style: kPoppinSemiBold.copyWith(
//                                   wordSpacing: SizeConfig.blockX! * 0.2,
//                                   letterSpacing: SizeConfig.blockX! * 0.2,
//                                   fontSize: SizeConfig.blockX! * 2.08,
//                                   color: kWhite),
//                             ),
//                             TextSpan(
//                               text: '\n', // Empty TextSpan for spacing
//                               style: TextStyle(
//                                   fontSize: SizeConfig.blockY! *
//                                       2.95), // Adjust the font size as needed
//                             ),
//                             TextSpan(
//                               text: 'I’m Ralph Kevin Rynard \nMacahipay\n',
//                               style: kPoppinExtraBold.copyWith(
//                                   letterSpacing: SizeConfig.blockX! * 0.34,
//                                   height: 1.2,
//                                   color: kWhite,
//                                   fontSize: SizeConfig.blockX! * 3),
//                             ),
//                             const TextSpan(
//                               text: '\n', // Empty TextSpan for spacing
//                               style: TextStyle(
//                                   fontSize:
//                                       16), // Adjust the font size as needed
//                             ),
//                             TextSpan(
//                               text: 'A Mobile and Web Developer\n',
//                               style: kPoppinBold.copyWith(
//                                   fontSize: SizeConfig.blockX! * 2,
//                                   color: kWhite),
//                             ),
//                             const TextSpan(
//                               text: '\n', // Empty TextSpan for spacing
//                               style: TextStyle(
//                                   fontSize:
//                                       16), // Adjust the font size as needed
//                             ),
//                             TextSpan(
//                               text:
//                                   'A freelancer that provides programming \nservices and project implementation.',
//                               style: kPoppinSemiBold.copyWith(
//                                 fontSize: SizeConfig.blockX! * 1.5,
//                                 color: kLightGrey,
//                               ),
//                             ),
//                           ],
//                         ),
//                         textAlign: TextAlign.left,
//                       ),