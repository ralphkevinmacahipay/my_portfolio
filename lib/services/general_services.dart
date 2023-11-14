import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/configuration/constant.dart';
import 'package:my_profile/state/get_x.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:developer' as dev show log;
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

class GeneralServices {
  Future<void> openURL({required Uri uri}) async {
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  Uri parseURL({required String url}) {
    final Uri uri = Uri.parse(url);
    return uri;
  }

  static devLog(String message) => dev.log(message);

  Future<dynamic> sendEmail({
    required String name,
    required String email,
    required String subject,
    required String content,
  }) async {
    try {
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
              "name": name,
              "subject": subject,
              "message": content,
              "user_email": email,
            }
          },
        ),
      );
      if (response.statusCode != 200) {
        return;
      }
      print("code is here");
      devLog(response.body);
      instanceServices.isEmailSent.value = true;
      return response.statusCode;
    } catch (e) {
      devLog("ERROR ==> $e");
    }
  }

  void popAndSnackBar(BuildContext context) {
    showTopSnackBar(
      displayDuration: const Duration(seconds: 1),
      Overlay.of(context),
      SizedBox(
        height: 50,
        child: CustomSnackBar.success(
          icon: Icon(
            Icons.sentiment_very_satisfied,
            color: kTransparent,
          ),
          message: "Message was successfully sent.",
        ),
      ).marginSymmetric(
          horizontal: ResponsiveBreakpoints.of(context).isDesktop
              ? context.percentWidth * 37
              : context.percentWidth * 10),
    );
  }
}
