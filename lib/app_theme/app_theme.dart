import 'package:flutter/material.dart';
import 'package:my_profile/configuration/constant.dart';

class AppTheme {
  static final darkTheme = ThemeData(
      // colorScheme: ColorScheme(
      //     brightness: Brightness.dark,
      //     primary: kWhite,
      //     onPrimary: kLighBlue,
      //     secondary: kLighDark,
      //     onSecondary: kWhite,
      //     error: Colors.yellow,
      //     onError: Colors.red,
      //     background: kBackGround,
      //     onBackground: kBackGround,
      //     surface: kBackGround,
      //     onSurface: kBackGround),
      textTheme: TextTheme(titleLarge: kPoppinBold.copyWith(color: kBlue)),
      scaffoldBackgroundColor: kDarkBlue,
      appBarTheme: AppBarTheme(
        backgroundColor: kDarkBlue,
      ));
}
