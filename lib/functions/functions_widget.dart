import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

bool isAllFieldsNotEmpty(ServiceOfGetValue controller) {
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

void sendMessage() async {
  await sendEmail();
  controllerServiceOfGetValue.clearFields();
}

Future sendEmail() async {
  final url =
      Uri.parse("https://api.emailjs.com/api/v1.0/email/sendr"); //remove r
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
          "name": controllerServiceOfGetValue.senderNameController.value.text,
          "subject": controllerServiceOfGetValue.subjectController.value.text,
          "message": controllerServiceOfGetValue.contentController.value.text,
          "user_email":
              controllerServiceOfGetValue.senderEmailController.value.text,
        }
      },
    ),
  );
  if (response.statusCode != 200) {
    controllerGetManager.kIsTap.value = false;
  }
  debugPrint("response.statusCode: ${response.body}");
  return response.statusCode;
}
