import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/views/contacts.dart';
import 'package:my_profile/views/home.dart';
import 'package:my_profile/views/projects.dart';
import 'package:my_profile/views/services.dart';
import 'package:my_profile/views/widget_sources.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:rive/rive.dart';
import 'package:velocity_x/velocity_x.dart';
import '../a_desktop/a_home/navigator.dart';
import '../configuration/constant.dart';
import '../functions/functions_widget.dart';
import '../my_widget/my_widget.dart';
import '../services/general_services.dart';
import '../state/get_x.dart';
import '../state_management/state_management.dart';

class HomePageResponsive extends StatelessWidget {
  const HomePageResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const ChatButtonFloating(),
      drawer: ResponsiveBreakpoints.of(context).isMobile
          ? const NavDrawerMobile()
          : null,
      endDrawer: ResponsiveBreakpoints.of(context).isTablet
          ? const NavDrawerTablet()
          : null,
      // drawer:
      //     ResponsiveBreakpoints.of(context).isTablet ? const NavDrawer() : null,
      backgroundColor: kDarkBlue,
      appBar: AppBar(
        shadowColor: kDarkBlue.withOpacity(.5),
        toolbarHeight: context.percentHeight * 8,
        backgroundColor: Colors.transparent,
        // elevation: 5,
        title: ResponsiveBreakpoints.of(context).isMobile
            ? Row(children: [
                Obx(
                  () => Text(instanceServices.pageTitle.value,
                      style: kPoppinBold.copyWith(
                          fontSize: context.percentWidth * 7)),
                ),
                const Spacer(),
                IconButton(onPressed: () {}, icon: const Icon(Icons.dark_mode))
              ])
            : ResponsiveBreakpoints.of(context).isTablet
                ? Stack(children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child:
                            Obx(() => Text(instanceServices.pageTitle.value))),
                    const Align(
                        alignment: Alignment.center, child: Text("Ralph.dart")),
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: const Icon(Icons.menu),
                    // )
                  ])
                : Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.light_mode,
                          size: context.percentWidth * 1.5,
                        )).marginOnly(right: context.percentWidth * 3),
                    Text("Ralph.dart",
                        style: kPoppinBold.copyWith(
                            fontSize: context.percentWidth * 2)),
                    const Spacer(),
                    ButtonElevated(
                      onPressd: () {
                        scrollToPosition(0);
                        // instanceControll.setHome(home: true);
                      },
                      textTitle: 'Home',
                    ).marginOnly(right: context.percentWidth * 3),
                    ButtonElevated(
                      onPressd: () {
                        scrollToPosition(context.percentHeight * 92);
                        // instanceControll.setHome(services: true);
                      },
                      textTitle: 'Services',
                    ).marginOnly(right: context.percentWidth * 3),
                    ButtonElevated(
                      onPressd: () {
                        scrollToPosition(context.percentHeight * 92 * 2);
                        // instanceControll.setHome(services: true);
                      },
                      textTitle: 'Projects',
                    ).marginOnly(right: context.percentWidth * 3),
                    ButtonElevated(
                      onPressd: () {
                        scrollToPosition(context.percentHeight * 92 * 4);
                        // instanceControll.setHome(services: true);
                      },
                      textTitle: 'Contacts',
                    ).marginOnly(right: context.percentWidth * 3),
                  ]),
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
          children: const [HomePage(), Services(), Projects(), Contacts()],
        ),
      ),
    );
  }
}

class ChatButtonFloating extends StatefulWidget {
  const ChatButtonFloating({
    super.key,
  });

  @override
  State<ChatButtonFloating> createState() => _ChatButtonFloatingState();
}

class _ChatButtonFloatingState extends State<ChatButtonFloating> {
  late TextEditingController _controllerName;
  late TextEditingController _controllerEmail;
  late TextEditingController _controllerSuject;
  late TextEditingController _controllerContent;

  @override
  void initState() {
    // TODO: implement initState
    _controllerName = TextEditingController();
    _controllerEmail = TextEditingController();
    _controllerSuject = TextEditingController();
    _controllerContent = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controllerName.dispose();
    _controllerEmail.dispose();
    _controllerSuject.dispose();
    _controllerContent.dispose();
    super.dispose();
  }

  _clear() {
    _controllerName.clear();
    _controllerEmail.clear();
    _controllerSuject.clear();
    _controllerContent.clear();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: kTransparent,
      onPressed: () {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                backgroundColor: kLighBlue,
                content: Builder(
                  builder: (context) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    height: 412,
                    width: 300,
                    child: Obx(
                      () => IgnorePointer(
                          ignoring: instanceServices.isSending.value,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Lest't Connect!",
                                      style: kPoppinBold.copyWith(
                                          color: kWhite,
                                          fontSize: context.percentWidth * 2),
                                    ),
                                    IconButton(
                                      iconSize: context.percentWidth * 2.5,
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      icon: Image.asset(
                                        kExitImage,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  ],
                                ).marginSymmetric(),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  TextFormFieldWidget(
                                      kController: _controllerName,
                                      kTitle: "Name"),
                                  TextFormFieldWidget(
                                      kController: _controllerEmail,
                                      kTitle: "Email"),
                                  TextFormFieldWidget(
                                      kController: _controllerSuject,
                                      kTitle: "Subject"),
                                  TextFormFieldWidget(
                                      kController: _controllerContent,
                                      kTitle: "Content"),
                                  instanceServices.isSending.value
                                      ? const Center(
                                          child: CircularProgressIndicator())
                                      : ElevatedWidget(
                                          s: 1.4,
                                          h: 2.5,
                                          w: 8,
                                          ktitle: "Send",
                                          onPress: () {
                                            instanceServices.isSending.value =
                                                true;
                                            GeneralServices.devLog(
                                                "_controllerName ${_controllerEmail.text}");
                                            GeneralServices()
                                                .sendEmail(
                                                    name: _controllerName.text,
                                                    email:
                                                        _controllerEmail.text,
                                                    subject:
                                                        _controllerSuject.text,
                                                    content:
                                                        _controllerContent.text)
                                                .then((value) {
                                              if (instanceServices
                                                  .isSending.value) {
                                                instanceServices
                                                    .isSending.value = false;
                                                Navigator.of(context).pop();
                                              }
                                            });
                                          },
                                        )
                                ],
                              ).marginOnly(top: context.percentHeight * 5),
                            ],
                          )),
                    ),
                  ),
                ));
          },
        ).then((value) {
          if (instanceServices.isEmailSent.value) {
            instanceServices.isEmailSent.value = false;
            _clear();
            GeneralServices().popAndSnackBar(context);
          }
        });
      },
      child: RiveAnimation.asset(
        kChatImage,
      ),
    );
  }
}

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController kController;
  final String kTitle;
  const TextFormFieldWidget({
    super.key,
    required this.kController,
    required this.kTitle,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: (value) {
        kController.text = value;
      },
      controller: kController,
      style: kPoppinRegular.copyWith(color: kWhite),
      decoration: InputDecoration(
        labelText: kTitle,
        labelStyle: TextStyle(color: kWhite),
        contentPadding: const EdgeInsets.symmetric(
            vertical: 10, horizontal: 20), // Adjust the padding as needed
        enabledBorder: OutlineInputBorder(
          gapPadding: 2,
          borderSide: BorderSide(color: kWhite),
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
      ),
    );
  }
}

class ButtonElevated extends StatelessWidget {
  final dynamic colorChanger;
  final String textTitle;
  final void Function()? onPressd;

  const ButtonElevated({
    super.key,
    this.colorChanger,
    required this.textTitle,
    this.onPressd,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kBorderRadius))),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            //colorChanger
            if (states.contains(MaterialState.hovered)) {
              return kBlue;
            }
            return kTransparent;

            // return instanceControll.isServiceTap.value
            //     ? kBlue
            //     : kTransparent;
          })),
      onPressed: onPressd,
      child: Text(
        textTitle,
        style: kPoppinSemiBold.copyWith(
            color: kWhite, fontSize: context.percentWidth * 1.6),
      ),
    );
  }
}

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
              itemCount: ViewsControll().kNavigator.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () => ViewsControll().onPress(
                      context: context,
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
            onPressed: () => _voidOpenLink(),
            child: Text(kDownloadCV),
          ),
          SizedBox(height: context.percentHeight * 50),
        ],
      ),
    );
  }

  _voidOpenLink() {
    print("code is here");
    GeneralServices().openURL(
        uri: GeneralServices().parseURL(
            url:
                "https://drive.google.com/file/d/1ob8jN81m0zj2SYRl5Ctl-RkBX01P8aES/view?usp=drivesdk"));
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
                      context: context,
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
            onPressed: () => GeneralServices()
                .openURL(uri: GeneralServices().parseURL(url: kCV)),
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

class ViewsControll {
  final List<Map<String, dynamic>> kNavigator = [
    {
      "title": 'Home',
      "icon": Icon(Icons.home_filled, color: kWhite),
    },
    {
      "title": 'Services',
      "icon": Icon(Icons.work_history, color: kWhite),
    },
    {
      "title": 'Projects',
      "icon": Icon(Icons.auto_awesome_motion_rounded, color: kWhite),
    },
    {
      "title": 'Contacts',
      "icon": Icon(Icons.contact_phone_outlined, color: kWhite),
    }
  ];

  onPress({required BuildContext context, required String type}) {
    instanceServices.pageTitle.value = type;
    switch (type) {
      case 'Home':
        scrollToPosition(0);

      case 'Services':
        scrollToPosition(context.percentHeight * 92);

      case 'Projects':
        scrollToPosition(context.percentHeight * 92 * 2);

      case 'Contacts':
        scrollToPosition(context.percentHeight * 92 * 4);
    }

    Navigator.of(context).pop();
  }
}
