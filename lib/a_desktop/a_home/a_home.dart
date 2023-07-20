import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/a_desktop/a_home/navigator.dart';
import 'package:my_profile/configuration/constant.dart';
import 'package:my_profile/configuration/style.dart';
import '../../my_widget/my_widget.dart';
import '../../state_management/put_get.dart';
import '../../state_management/state_management.dart';
import 'package:rive/rive.dart';
import '../../configuration/enum.dart';
import 'body.dart';

class HomeDesktop extends GetView<GetManagerController> {
  const HomeDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

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
              kColor: controller.kColorProject.value,
              navItem: NavItemEnum.project,
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
      body: BodyHome(items: itemsAnimatedText),
    );
  }
}

class ChatButton extends GetView<ServiceOfGetValue> {
  final EdgeInsetsGeometry? kPaddingResponsive;
  final Color? kColor;
  final double? kFontSize;
  final double? kFontSizeTitle;

  const ChatButton({
    this.kPaddingResponsive,
    this.kFontSizeTitle,
    this.kColor,
    this.kFontSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: kTransparent,
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
                      fontSize: kFontSizeTitle ?? SizeConfig.blockX! * 1.5,
                      color: kWhite,
                    ),
                  ),
                  IconWidgetContact(
                    kIcon: kExitImage,
                    kOnpress: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              content: Builder(
                builder: (context) {
                  return ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: SizeConfig.blockX! * 20,
                      maxHeight: SizeConfig.blockY! * 50,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Obx(() => TextFormFieldWidget(
                                controller: controller,
                                kText: 'Sender Name',
                                textEditingController:
                                    controller.senderNameController.value,
                              )),
                          SizedBox(height: SizeConfig.blockY! * 1),
                          Obx(() => TextFormFieldWidget(
                                controller: controller,
                                kText: 'Sender Email',
                                textEditingController:
                                    controller.senderEmailController.value,
                              )),
                          SizedBox(height: SizeConfig.blockY! * 1),
                          Obx(() => TextFormFieldWidget(
                                controller: controller,
                                kText: 'Subject',
                                textEditingController:
                                    controller.subjectController.value,
                              )),
                          SizedBox(height: SizeConfig.blockY! * 1),
                          Obx(() => TextFormFieldWidget(
                                controller: controller,
                                kText: 'Content',
                                textEditingController:
                                    controller.contentController.value,
                              )),
                          SizedBox(height: SizeConfig.blockY! * 1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Obx(
                                () => InkWellWIdget(
                                  kPaddingResponsive: kPaddingResponsive,
                                  kFontSize: kFontSize,
                                  kOnTap: () {
                                    debugPrint("Print send");
                                    sendEmail();
                                    Navigator.of(context).pop();
                                  },
                                  kPadding: EdgeInsets.symmetric(
                                    vertical: SizeConfig.blockY! * .5,
                                    horizontal: SizeConfig.blockX! * 1,
                                  ),
                                  onHover: (value) => controllerGetManager
                                      .setIsHoverSend(value),
                                  controller: controllerGetManager,
                                  kText: "Send",
                                  kColor: kBlue,
                                  kIsHover: controllerGetManager.getIsHoverSend,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
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
