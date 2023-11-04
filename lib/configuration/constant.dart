import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_profile/configuration/style.dart';

import 'enum.dart';

// asset image
String kBackground = "assets/background.png";
String kProfile = "assets/profile.png";
String kAndroidImage = "assets/android_image.png";
String kFigmaImage = "assets/figma_image.png";
String kFirebaseImage = "assets/firebase_image.png";
String kFlatIconImage = "assets/flaticon_image.png";
String kFlutterImage = "assets/flutter_image.png";
String kUiImage = "assets/ui_image.png";
String kProjectOne = "assets/project_one.png";
String kProjectOneMobile = "assets/project_one.png";

String kWebImage = "assets/web_image.png";
String kFaceBook = "assets/facebook_image.png";
String kGmail = "assets/gmail_image.png";
String kInstagram = "assets/instagram_image.png";
String kLinkedIn = "assets/linkedin_image.png";
String kGitHub = "assets/github_image.png";
String kGoogleCP = "assets/google_cloud_platform.png";
String kChatImage = "assets/chat_image.riv";
String kExitImage = "assets/exit_image.png";

Color kValidatorColor = Colors.red;
Color kDarkBlue = const Color(0xff0D0D15);
Color kWhite = const Color(0xffFFFFFF);
Color kLighDark = const Color(0xff1F1F2D);
Color kSkyBlue = const Color(0xff1ABCFE);
Color kHoverColor = const Color(0xff143F88);
Color kLightBlue = const Color(0xff47C5FB);

Color kTransparent = Colors.transparent;
Color kBlue = Colors.blue;
Color kBackGround = const Color(0xff1275B1);

Color kLightGrey = const Color(0xffAAAAAA);
Color kLighBlue = const Color(0xff132139);
String kTextAnimated_1 = "A Mobile App Developer";
String kRalph = "Ralph.dart";
String kTextAnimated_2 = "A Web App Developer";
String kTextAnimated_3 = "A UI/UX Designer";
String text_1 = 'Hi, Welcome to my space\n';
String text_2 = 'I’m Ralph';
String text_3 = " What can I do?";
String kDownloadCV = "DOWNLOAD CV";
String textHome =
    "A freelancer that provides programming services and project implementation";
String text_4 =
    " As a freelance designer and developer, I've collaborated with startups to create digital products for businesses and consumers alike. My services span brand design and programming, offering comprehensive solutions for diverse needs. With a passion for innovation and a commitment to excellence.";
String text_5 = "Ralph.dart";
String text_6 = "Android App Developer";
String text_7 = "Let’s turn your idea into a working mobile application.";
String text_8 = "Flutter";
String text_9 = "Firebase";
String text_10 = "UI/UX Designer";
String text_11 =
    "Transforming ideas into intuitive interfaces\nwith a human touch.";
String text_12 = "Figma";
String text_13 = "Flaticon";
String text_14 = "Web App Development";
String text_15 = "Let’s turn your idea into a working web application.";
String text_16 = "Google Cloud Platform";
String kMyFaceBook = "https://www.facebook.com/kevin.macahipay.7/";
String kMyInstagram = "https://www.instagram.com/siralphpalato/";
String kMyGitHub = "https://github.com/ralphkevinmacahipay";
String kMyLinkedIn =
    "https://www.linkedin.com/in/ralph-kevin-macahipay-7a12a7257/";
String kCV =
    'https://drive.google.com/file/d/1pABxVDR9oj8dR71MU4t2woHah9atog9I/view?usp=sharing';

String kProjectTextTitle = "What I have done?";
String kProjectSubTitle =
    "Throughout my career as a designer and developer, I have crafted digital products catering to both commercial and individual needs.";
String kContactTitle = "Stay Connected";
String kContactSubTitle =
    "Let’s transform your idea into reality, if you have any needs when it comes to programming or UI/UX design, please contact me.";
const double kBorderRadius = 10;
final kPoppinBold = GoogleFonts.poppins(fontWeight: FontWeight.bold);
final kPoppinExtraBold = GoogleFonts.poppins(fontWeight: FontWeight.w700);
final kPoppinSemiBold = GoogleFonts.poppins(fontWeight: FontWeight.w500);
final kPoppinRegular = GoogleFonts.poppins(fontWeight: FontWeight.w400);

// navigator item
final List<Map<String, dynamic>> kNavigator = [
  {
    "title": getNavNmae(NavItemEnum.home),
    "type": NavItemEnum.home,
    "icon": Icon(Icons.home_filled, color: kWhite),
  },
  {
    "title": 'Services',
    "onpress": NavItemEnum.services,
    "icon": Icon(Icons.work_history, color: kWhite),
  },
  {
    "title": 'Projcts',
    "onpress": NavItemEnum.project,
    "icon": Icon(Icons.auto_awesome_motion_rounded, color: kWhite),
  },
  {
    "title": 'Contacts',
    "onpress": NavItemEnum.contact,
    "icon": Icon(Icons.contact_phone_outlined, color: kWhite),
  }
];

List<TyperAnimatedText> itemsAnimatedText = [
  TyperAnimatedText(kTextAnimated_1,
      textStyle:
          kPoppinBold.copyWith(fontSize: SizeConfig.blockX! * 2, color: kWhite),
      speed: const Duration(milliseconds: 100)),
  TyperAnimatedText(kTextAnimated_2,
      textStyle:
          kPoppinBold.copyWith(fontSize: SizeConfig.blockX! * 2, color: kWhite),
      speed: const Duration(milliseconds: 100)),
  TyperAnimatedText(kTextAnimated_3,
      textStyle:
          kPoppinBold.copyWith(fontSize: SizeConfig.blockX! * 2, color: kWhite),
      speed: const Duration(milliseconds: 100)),
];

final List<Map<String, dynamic>> listItemCorouselServices = [
  {
    'kMainImage': kAndroidImage,
    "kTextTitle": text_6,
    "kSubTitle": text_7,
    "kTextOne": text_8,
    "kTextTwo": text_9,
    "kTextThree": text_16,
    "kImageOne": kFirebaseImage,
    "kImageTwo": kFlutterImage,
    "kImageThree": kGoogleCP,
  },
  {
    'kMainImage': kWebImage,
    "kTextTitle": text_14,
    "kSubTitle": text_15,
    "kTextOne": text_8,
    "kTextTwo": text_9,
    "kTextThree": text_16,
    "kImageOne": kFirebaseImage,
    "kImageTwo": kFlutterImage,
    "kImageThree": kGoogleCP,
  },

  {
    'kMainImage': kUiImage,
    "kTextTitle": text_10,
    "kSubTitle": text_11,
    "kTextOne": text_8,
    "kTextTwo": text_13,
    "kTextThree": text_16,
    "kImageOne": kFigmaImage,
    "kImageTwo": kFlatIconImage,
  },

  // Add more image URLs here
];

final List<Map<String, dynamic>> listItemCorouselWork = [
  {"image": kProjectOneMobile}
];

List<Map<String, dynamic>> myListIcon = [
  {
    'icon': kInstagram,
    'onTap': ContactEnum.instagram,
  },
  {
    'icon': kFaceBook,
    'onTap': ContactEnum.facebook,
  },
  {
    'icon': kGitHub,
    'onTap': ContactEnum.gihub,
  },
  {
    'icon': kLinkedIn,
    'onTap': ContactEnum.linkedin,
  },
];

final formKey = GlobalKey<FormState>();
