import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/a_desktop/a_home/navigator.dart';
import 'package:my_profile/configuration/constant.dart';
import 'package:my_profile/configuration/style.dart';
import '../../state_management/state_management.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../enum.dart';
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

class ChatButton extends StatelessWidget {
  const ChatButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        splashColor: Colors.amber,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              TextEditingController senderNameController =
                  TextEditingController();
              TextEditingController senderEmailController =
                  TextEditingController();

              TextEditingController subjectController = TextEditingController();
              TextEditingController contentController = TextEditingController();

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
                        "name": senderNameController.text,
                        "subject": subjectController.text,
                        "message": contentController.text,
                        "user_email": senderEmailController.text,
                      }
                    },
                  ),
                );
                debugPrint("response.statusCode: ${response.body}");
                return response.statusCode;
              }

              return AlertDialog(
                title: const Text('Compose Email'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // TODO: USE TEXTFORMFIELD INSTEAD OF TEXTFIELD
                    TextField(
                      onSubmitted: (value) {
                        senderNameController.text = value;
                      },
                      controller: senderNameController,
                      decoration:
                          const InputDecoration(labelText: 'Sender Name'),
                    ),
                    TextField(
                      onSubmitted: (value) {
                        senderEmailController.text = value;
                      },
                      controller: senderEmailController,
                      decoration:
                          const InputDecoration(labelText: 'Sender Email'),
                    ),
                    TextField(
                      onSubmitted: (value) {
                        subjectController.text = value;
                      },
                      controller: subjectController,
                      decoration: const InputDecoration(labelText: 'Subject'),
                    ),
                    TextField(
                      onSubmitted: (value) {
                        contentController.text = value;
                      },
                      controller: contentController,
                      decoration: const InputDecoration(labelText: 'Content'),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    child: const Text('Send'),
                    onPressed: () {
                      // TODO: ACTIVATED WHEN ITS DONE         sendEmail();

                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text('Close'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.chat_bubble));
  }
}
