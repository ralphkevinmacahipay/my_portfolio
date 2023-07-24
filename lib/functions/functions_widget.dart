import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../configuration/constant.dart';
import '../state_management/state_management.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../state_management/put_get.dart';

Future<void> openURL({required Uri uri}) async {
  debugPrint("code ishere");
  if (!await launchUrl(uri)) {
    throw Exception('Could not launch $uri');
  }
}

Uri parseURL({required String url}) {
  final Uri uri = Uri.parse(url);
  return uri;
}

bool isAllFieldsNotEmpty(ServiceOfMessage controller) {
  if (controller.senderNameController.value.text == '' ||
      controller.senderEmailController.value.text == '' ||
      controller.subjectController.value.text == '' ||
      controller.contentController.value.text == '') {
    return false;
  }
  return true;
}

void kValidatorFunction({required String? value, required Rx<Color> kColor}) {
  if (value == null || value.isEmpty) {
    // TODO: set up the TextFormFieldEnum switch case
    //test it first before commit
    kColor.value = kValidatorColor;
    return;
  } else {
    kColor.value = kWhite;
  }
}

void sendMessage(
    {required ServiceOfMessage controller,
    required BuildContext context}) async {
  controller.setBuildContext(context: context);
  if (await sendEmail(controller: controller) == 200) {
    await Future.delayed(const Duration(seconds: 1));
    popAndSnackBar();

    debugPrint("coe herererer");
    controller.kIsTap.value = false;
  }
  controllerServiceOfGetValue.clearFields();
}

Future sendEmail({required ServiceOfMessage controller}) async {
  final url =
      Uri.parse("https://api.emailjs.com/api/v1.0/email/send"); //remove r
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
  if (response.statusCode != 200) {}
  debugPrint("response.statusCode: ${response.body}");
  return response.statusCode;
}

void popAndSnackBar() {
  Navigator.of(controllerServiceOfGetValue.getContext).pop();
  showTopSnackBar(
    displayDuration: const Duration(seconds: 1),
    Overlay.of(controllerServiceOfGetValue.getContext),
    CustomSnackBar.success(
      icon: Icon(
        Icons.sentiment_very_satisfied,
        color: kTransparent,
      ),
      message: "Message was successfully sent.",
    ),
  );
}
