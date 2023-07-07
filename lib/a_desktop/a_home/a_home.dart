import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/a_desktop/a_home/navigator.dart';
import 'package:my_profile/configuration/constant.dart';
import 'package:my_profile/configuration/style.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart' show CustomSnackBar;
import 'package:top_snackbar_flutter/top_snack_bar.dart' show showTopSnackBar;
import '../../my_widget/my_widget.dart';
import '../../state_management/state_management.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:rive/rive.dart';
import '../../configuration/enum.dart';
import 'body.dart';

class HomeDesktop extends GetView<GetManagerController> {
  const HomeDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

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
      TyperAnimatedText(kTextAnimated_3,
          textStyle: kPoppinBold.copyWith(
              fontSize: SizeConfig.blockX! * 2, color: kWhite),
          speed: const Duration(milliseconds: 100)),
    ];
    return Scaffold(
      floatingActionButton: const Padding(
        padding: EdgeInsets.only(right: 60, bottom: 60),
        child: ChatButton(),
      ),
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: SizeConfig.blockX! * 10.90),
          child: Text(
            text_5,
            style: TextStyle(fontSize: SizeConfig.blockX! * 1.77),
          ),
        ),
        backgroundColor: kDarkBlue,
        actions: [
          // TODO: implement Hover effect using inkWell
          Obx(
            () => NavItem(
              navItem: NavItemEnum.home,
              controller: controller,
              kColor: controller.kColorHome.value,
            ),
          ),
          SizedBox(width: SizeConfig.blockX! * 2.5),
          Obx(
            () => NavItem(
              controller: controller,
              kColor: controller.kColorServices.value,
              navItem: NavItemEnum.services,
            ),
          ),
          SizedBox(width: SizeConfig.blockX! * 2.5),
          Obx(
            () => NavItem(
              controller: controller,
              kColor: controller.kColorWorks.value,
              navItem: NavItemEnum.works,
            ),
          ),
          SizedBox(width: SizeConfig.blockX! * 2.5),
          Obx(
            () => NavItem(
                controller: controller,
                kColor: controller.kColorContact.value,
                navItem: NavItemEnum.contact),
          ),
          SizedBox(width: SizeConfig.blockX! * 10)
        ],
      ),
      body: BodyHome(items: items, controller: controller),
    );
  }
}

class ChatButton extends GetView<ServiceOfGetValue> {
  const ChatButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: kTransparent,
      splashColor: Colors.amber,
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            Future sendEmail() async {
              final url =
                  Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
              const serviceId = "service_e1jtrn2";
              const templateId = "template_jqm56ps";
              const userID = "Kuyvp1B40YV1mN9WA";

              final response = await http.post(
                url,
                headers: {'Content-Type': 'application/json'},
                body: json.encode(
                  {
                    "service_id": serviceId,
                    "template_id": templateId,
                    "user_id": userID,
                    "template_params": {
                      "name": controller.senderNameController.value.text,
                      "subject": controller.subjectController.value.text,
                      "message": controller.contentController.value.text,
                      "user_email": controller.senderEmailController.value.text,
                    }
                  },
                ),
              );
              debugPrint("response.statusCode: ${response.body}");
              return response.statusCode;
            }

            return AlertDialog(
              backgroundColor: kLighBlue,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Let’s Connect',
                    style: kPoppinBold.copyWith(
                        fontSize: SizeConfig.blockX! * 1.5, color: kWhite),
                  ),
                  IconWidgetContact(
                    kIcon: kExitImage,
                    kOnpress: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // TODO: Implement TextFormField make it dynamic

                  Obx(() => TextFormFieldWidget(
                        controller: controller,
                        kText: 'Sender Name',
                        textEditingController:
                            controller.senderNameController.value,
                      )),

                  Obx(() => TextFormFieldWidget(
                        controller: controller,
                        kText: 'Sender Email',
                        textEditingController:
                            controller.senderEmailController.value,
                      )),
                  Obx(() => TextFormFieldWidget(
                        controller: controller,
                        kText: 'Subject',
                        textEditingController:
                            controller.subjectController.value,
                      )),
                  Obx(() => TextFormFieldWidget(
                        controller: controller,
                        kText: 'Content',
                        textEditingController:
                            controller.contentController.value,
                      )),
                ],
              ),
              actions: [
                TextButton(
                  child: const Text('Send'),
                  onPressed: () {
                    // TODO: ACTIVATED WHEN ITS DONE
                    sendEmail();
                    controller.clearFields();

                    Navigator.of(context).pop();
                    showTopSnackBar(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockX! * 30,
                          vertical: SizeConfig.blockY! * 5),
                      displayDuration: const Duration(milliseconds: 3),
                      Overlay.of(context),
                      SizedBox(
                        height: SizeConfig.blockY! * 8,
                        child: CustomSnackBar.success(
                          icon: Icon(Icons.check_circle, color: kTransparent),
                          message: "Message sent",
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        );
      },
      child: RiveAnimation.asset(
        fit: BoxFit.cover,
        kChatImage,
      ),
    );
  }
}

class TextFormFieldWidget extends StatelessWidget {
  final String kText;
  final TextEditingController textEditingController;

  const TextFormFieldWidget({
    super.key,
    required this.controller,
    required this.kText,
    required this.textEditingController,
  });

  final ServiceOfGetValue controller;

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
