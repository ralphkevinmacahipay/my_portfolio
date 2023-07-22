import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/a_desktop/a_home/navigator.dart';
import 'package:my_profile/configuration/constant.dart';
import 'package:my_profile/configuration/style.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../functions/functions_widget.dart';
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
                    child: Form(
                      key: formKey,
                      child: SingleChildScrollView(
                        child: Obx(
                          () => Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Obx(() => TextFormFieldWidget(
                                    kColor:
                                        controllerGetManager.kColorName.value,
                                    kTextFormFieldEnum: TextFormFieldEnum.name,
                                    controller: controller,
                                    kText: 'Sender Name',
                                    textEditingController:
                                        controller.senderNameController.value,
                                  )),
                              SizedBox(height: SizeConfig.blockY! * 1),
                              Obx(() => TextFormFieldWidget(
                                    kColor:
                                        controllerGetManager.kColorEmail.value,
                                    kTextFormFieldEnum: TextFormFieldEnum.email,
                                    controller: controller,
                                    kText: 'Sender Email',
                                    textEditingController:
                                        controller.senderEmailController.value,
                                  )),
                              SizedBox(height: SizeConfig.blockY! * 1),
                              Obx(() => TextFormFieldWidget(
                                    kColor: controllerGetManager
                                        .kColorSubject.value,
                                    kTextFormFieldEnum:
                                        TextFormFieldEnum.subject,
                                    controller: controller,
                                    kText: 'Subject',
                                    textEditingController:
                                        controller.subjectController.value,
                                  )),
                              SizedBox(height: SizeConfig.blockY! * 1),
                              Obx(() => TextFormFieldWidget(
                                    kColor: controllerGetManager
                                        .kColorContent.value,
                                    kTextFormFieldEnum:
                                        TextFormFieldEnum.content,
                                    controller: controller,
                                    kText: 'Content',
                                    textEditingController:
                                        controller.contentController.value,
                                  )),
                              SizedBox(height: SizeConfig.blockY! * 1),
                              controllerGetManager.kIsTap.value
                                  ? const CircularProgressIndicator()
                                  : Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Obx(
                                          () => InkWellWIdget(
                                            kPaddingResponsive:
                                                kPaddingResponsive,
                                            kFontSize: kFontSize,
                                            kOnTap: () {
                                              controllerGetManager
                                                  .kIsTap.value = true;
                                              debugPrint(
                                                  "controller.senderNameController.value: ${controller.senderNameController.value.text.toString()}");

                                              debugPrint(
                                                  "controller.senderEmailController.value: ${controller.senderEmailController.value.text.toString()}");

                                              debugPrint(
                                                  "controller.subjectController.value: ${controller.subjectController.value.text.toString()}");

                                              debugPrint(
                                                  "controller.contentController.value: ${controller.contentController.value.text.toString()}");

                                              if (formKey.currentState!
                                                      .validate() &&
                                                  isAllFieldsNotEmpty(
                                                      controller)) {
                                                debugPrint(
                                                    "isAllFieldsNotEmpty(controller): ${isAllFieldsNotEmpty(controller)}");
                                                debugPrint("Print send");
                                                sendMessage();

                                                Navigator.of(context).pop();
                                                showTopSnackBar(
                                                  displayDuration:
                                                      const Duration(
                                                          seconds: 1),
                                                  Overlay.of(context),
                                                  CustomSnackBar.success(
                                                    icon: Icon(
                                                      Icons
                                                          .sentiment_very_satisfied,
                                                      color: kTransparent,
                                                    ),
                                                    message:
                                                        "Message was successfully sent.",
                                                  ),
                                                );
                                              }
                                            },
                                            kPadding: EdgeInsets.symmetric(
                                              vertical: SizeConfig.blockY! * .5,
                                              horizontal:
                                                  SizeConfig.blockX! * 1,
                                            ),
                                            onHover: (value) =>
                                                controllerGetManager
                                                    .setIsHoverSend(value),
                                            controller: controllerGetManager,
                                            kText: "Send",
                                            kColor: kBlue,
                                            kIsHover: controllerGetManager
                                                .getIsHoverSend,
                                          ),
                                        ),
                                      ],
                                    ),
                            ],
                          ),
                        ),
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
