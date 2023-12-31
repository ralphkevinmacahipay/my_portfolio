import 'package:flutter/material.dart';
import 'package:my_profile/state_management/put_get.dart';

import '../configuration/constant.dart';
import '../configuration/enum.dart';
import '../configuration/style.dart';
import '../functions/functions_widget.dart';
import '../state_management/state_management.dart';

class TextWidget extends StatelessWidget {
  final TextAlign? kTextAlign;
  final double kFontSize;
  final double? kFontSpace;
  final Color kTextColor;
  final Alignment kAlign;
  final String ktext;
  final TextStyle kTextStyle;
  const TextWidget({
    super.key,
    required this.kTextStyle,
    required this.ktext,
    required this.kAlign,
    required this.kTextColor,
    required this.kFontSize,
    this.kFontSpace,
    this.kTextAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: kAlign,
      child: Text(
        textAlign: kTextAlign,
        ktext,
        style: kTextStyle.copyWith(
            letterSpacing: kFontSpace, fontSize: kFontSize, color: kTextColor),
      ),
    );
  }
}

class TextWidgetOne extends StatelessWidget {
  final TextAlign? kTextALign;
  final String kText;
  final TextStyle kTextStyle;

  final double kFontSize;
  const TextWidgetOne({
    super.key,
    required this.kText,
    required this.kTextStyle,
    required this.kFontSize,
    this.kTextALign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: kTextALign,
      kText,
      style: kTextStyle.copyWith(
        fontSize: kFontSize,
        color: kWhite,
      ),
    );
  }
}

class SubTitleWidget extends StatelessWidget {
  final double? kFointSize;
  final Color? kColor;
  final String kTitle; // text_4
  const SubTitleWidget({
    super.key,
    required this.kTitle,
    this.kColor,
    this.kFointSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: SizeConfig.blockX! * 10),
      padding: EdgeInsets.only(top: SizeConfig.blockY! * 12.89),
      child: TextWidget(
        kTextAlign: TextAlign.center,
        kTextStyle: kPoppinSemiBold,
        ktext: kTitle,
        kAlign: Alignment.topCenter,
        kTextColor: kColor ?? kLightGrey,
        kFontSize: kFointSize ?? SizeConfig.blockX! * 1.5,
      ),
    );
  }
}

// icon widget contact

class IconWidgetContact extends StatelessWidget {
  final double? kIconSize;
  final VoidCallback? kOnpress;
  final String? kImage;
  final String? kIcon;
  const IconWidgetContact({
    super.key,
    this.kIcon,
    this.kImage,
    this.kOnpress,
    this.kIconSize,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: kIconSize ?? SizeConfig.blockX! * 2.5,
      onPressed: kOnpress,
      icon: kImage != null
          ? Image.asset(
              kImage!,
              fit: BoxFit.cover,
            )
          : CircleAvatar(
              backgroundColor: kTransparent,
              backgroundImage: AssetImage(kIcon!)),
    );
  }
}

// InkWellWIdget
class InkWellWIdget extends StatelessWidget {
  final EdgeInsetsGeometry? kPaddingResponsive;

  final double? kFontSize;
  final EdgeInsetsGeometry kPadding;
  final void Function()? kOnTap;
  final void Function(bool)? onHover;
  final String kText;
  final Color kColor;
  final bool kIsHover;

  const InkWellWIdget({
    super.key,
    required this.controller,
    required this.kColor,
    required this.kIsHover,
    required this.kText,
    this.onHover,
    required this.kPadding,
    this.kOnTap,
    this.kFontSize,
    this.kPaddingResponsive,
  });

  final GetManagerController controller;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: onHover,
      onTap: kOnTap,
      child: Container(
        decoration: BoxDecoration(
          color: kIsHover || controllerGetManager.isMobile.value
              ? kColor
              : kTransparent,
          borderRadius: BorderRadius.circular(kBorderRadius),
          border: Border.all(color: Colors.white),
        ),
        padding: kPaddingResponsive ?? kPadding,
        child: Text(
          kText,
          style: kPoppinSemiBold.copyWith(
            fontSize: kFontSize ?? SizeConfig.blockX! * 1.5,
            color: kWhite,
          ),
        ),
      ),
    );
  }
}

//TextFormFieldWidget

class TextFormFieldWidget extends StatelessWidget {
  final Color kColor;
  final TextFormFieldEnum kTextFormFieldEnum;
  final String kText;
  final TextEditingController textEditingController;

  const TextFormFieldWidget({
    super.key,
    required this.controller,
    required this.kText,
    required this.textEditingController,
    required this.kTextFormFieldEnum,
    required this.kColor,
  });

  final ServiceOfMessage controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: (value) {
        controller.senderNameController.value.text = value;
      },
      controller: textEditingController,
      style: kPoppinRegular.copyWith(color: kWhite),
      decoration: InputDecoration(
        labelText: kText,
        labelStyle: TextStyle(color: kWhite),
        contentPadding: const EdgeInsets.symmetric(
            vertical: 10, horizontal: 20), // Adjust the padding as needed
        enabledBorder: OutlineInputBorder(
          gapPadding: 2,
          borderSide: BorderSide(color: kColor),
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

class CopyRightWidget extends StatelessWidget {
  final AlignmentGeometry? kAlignment;
  final double? kFontSize;
  const CopyRightWidget({
    super.key,
    this.kFontSize,
    this.kAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: kAlignment ?? Alignment.bottomCenter,
      child: RichText(
        text: TextSpan(
          text: 'Developed by ',
          style: kPoppinRegular.copyWith(
            color: kWhite,
            fontSize: kFontSize ?? SizeConfig.blockX! * 1,
          ),
          children: [
            TextSpan(
              text: 'Ralph Kevin Rynard E. Macahipay',
              style: kPoppinBold.copyWith(
                color: kWhite,
                fontSize: kFontSize ?? SizeConfig.blockX! * 1,
              ),
            ),
            TextSpan(
              text: ' © 2023',
              style: kPoppinRegular.copyWith(
                color: kWhite,
                fontSize: kFontSize ?? SizeConfig.blockX! * 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
