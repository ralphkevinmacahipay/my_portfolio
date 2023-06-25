import 'package:flutter/material.dart';
import 'package:my_profile/constant.dart';
import 'package:my_profile/style.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class DesktopLayout extends StatefulWidget {
  const DesktopLayout({super.key});

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  final ScrollController _scrollController = ScrollController();
  Color? buttonColor;

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
                      top: SizeConfig.blockY! * 38,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: hoverWidget(
                          myWidget: InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            color: buttonColor,
                            borderRadius: BorderRadius.circular(kBorderRadius),
                            border: Border.all(color: Colors.white),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 24,
                          ),
                          child: Text(
                            "DOWNLOAD CV",
                            style: kPoppinSemiBold.copyWith(
                              fontSize: SizeConfig.blockX! * 1.5,
                              color: kWhite,
                            ),
                          ),
                        ),
                      )),
                    ),
                  ),
                  const FloatingAvatar(),
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

  MouseRegion hoverWidget({required Widget myWidget}) {
    return MouseRegion(
      onHover: (event) {
        // Change the color when hovering
        setState(() {
          buttonColor = Colors.blue; // Replace with your desired hover color
        });
      },
      onExit: (event) {
        // Revert back to the original color when not hovering
        setState(() {
          buttonColor = Colors.transparent; // Replace with the original color
        });
      },
      child: myWidget,
    );
  }
}

class NavigatorItem {
  final VoidCallback onPressed;
  final String kText;

  NavigatorItem({required this.onPressed, required this.kText});
}

class FloatingAvatar extends StatefulWidget {
  const FloatingAvatar({super.key});

  @override
  State<FloatingAvatar> createState() => _FloatingAvatarState();
}

class _FloatingAvatarState extends State<FloatingAvatar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0, end: 50).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.blockY! * 10.94,
        right: SizeConfig.blockX! * 10.97,
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Stack(
              children: [
                Positioned(
                  right: _animation.value,
                  child: Container(
                    width: SizeConfig.blockX! * 20.88,
                    height: SizeConfig.blockX! * 20.88,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.8),
                          blurRadius: 10,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: SizeConfig.blockX! * 20.88,
                      backgroundImage: AssetImage(kProfile),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
