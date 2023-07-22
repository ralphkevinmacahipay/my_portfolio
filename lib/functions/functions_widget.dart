import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../state_management/state_management.dart';

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
