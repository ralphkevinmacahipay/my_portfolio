import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/a_desktop/a_home/navigator.dart';
import 'package:my_profile/configuration/constant.dart';
import 'package:my_profile/configuration/style.dart';
import '../../functions/functions_widget.dart';
import '../../my_widget/my_widget.dart';
import '../../state_management/put_get.dart';
import '../../state_management/state_management.dart';
import '../../configuration/enum.dart';
import 'body.dart';
import 'package:rive/rive.dart';

class HomeDesktop extends GetView<GetManagerController> {
  const HomeDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: const Padding(
        padding: EdgeInsets.only(right: 60, bottom: 60),
        child: ChatButton(),
      ),
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: SizeConfig.blockX! * 10.90),
          child: Text(
            text_5,
            style: kPoppinBold.copyWith(fontSize: 30),
          ),
        ),
        backgroundColor: kDarkBlue,
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Obx(
                () => NavItem(
                  navItem: NavItemEnum.home,
                  controller: controller,
                  kColor: controller.kColorHome.value,
                ),
              ),
              SizedBox(width: SizeConfig.blockX! * 2),
              Obx(
                () => NavItem(
                  controller: controller,
                  kColor: controller.kColorServices.value,
                  navItem: NavItemEnum.services,
                ),
              ),
              SizedBox(width: SizeConfig.blockX! * 2),
              Obx(
                () => NavItem(
                  controller: controller,
                  kColor: controller.kColorProject.value,
                  navItem: NavItemEnum.project,
                ),
              ),
              SizedBox(width: SizeConfig.blockX! * 2),
              Obx(
                () => NavItem(
                  controller: controller,
                  kColor: controller.kColorContact.value,
                  navItem: NavItemEnum.contact,
                ),
              ),
              SizedBox(width: SizeConfig.blockX! * 5),
            ],
          )
        ],
      ),
      body: BodyHome(items: itemsAnimatedText),
    );
  }
}

class ChatButton extends GetView<ServiceOfMessage> {
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
                      fontSize: kFontSizeTitle ?? 25,
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
                  return SizedBox(
                    width: SizeConfig.blockX! * 20,
                    height: SizeConfig.blockY! * 40,
                    child: Form(
                      key: formKey,
                      child: Obx(
                        () => Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // TODO: MAKE THE DATA CAME FROM Map<String,dynamic> list
                            Obx(() => TextFormFieldWidget(
                                  kColor: controllerGetManager.kColorName.value,
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
                                  kColor:
                                      controllerGetManager.kColorSubject.value,
                                  kTextFormFieldEnum: TextFormFieldEnum.subject,
                                  controller: controller,
                                  kText: 'Subject',
                                  textEditingController:
                                      controller.subjectController.value,
                                )),
                            SizedBox(height: SizeConfig.blockY! * 1),
                            Obx(() => TextFormFieldWidget(
                                  kColor:
                                      controllerGetManager.kColorContent.value,
                                  kTextFormFieldEnum: TextFormFieldEnum.content,
                                  controller: controller,
                                  kText: 'Content',
                                  textEditingController:
                                      controller.contentController.value,
                                )),
                            SizedBox(height: SizeConfig.blockY! * 1),
                            controller.kIsTap.value
                                ? SizedBox(
                                    height: getSize(
                                      sizeType: SizeTypeEnum.height,
                                      kPlatform: controller.kPlatform.value,
                                    ),
                                    width: getSize(
                                      sizeType: SizeTypeEnum.width,
                                      kPlatform: controller.kPlatform.value,
                                    ),
                                    child: const CircularProgressIndicator())
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Obx(
                                        () => InkWellWIdget(
                                          kPaddingResponsive:
                                              kPaddingResponsive,
                                          kFontSize: kFontSize,
                                          kOnTap: () {
                                            if (formKey.currentState!
                                                    .validate() &&
                                                isAllFieldsNotEmpty(
                                                    controller)) {
                                              controller.kIsTap.value = true;

                                              debugPrint("Print send");
                                              sendMessage(
                                                  context: context,
                                                  controller: controller);
                                            }
                                          },
                                          kPadding: EdgeInsets.symmetric(
                                            vertical: SizeConfig.blockY! * .5,
                                            horizontal: SizeConfig.blockX! * 1,
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
                  );
                },
              ),
            );
          },
        );
      },
      child: RiveAnimation.asset(
        kChatImage,
      ),
    );
  }
}
