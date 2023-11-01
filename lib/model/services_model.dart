// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<ServicesModel> servicesFromJson(String str) => List<ServicesModel>.from(
    json.decode(str).map((x) => ServicesModel.fromJson(x)));

String servicesToJson(List<ServicesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServicesModel {
  String id;
  String title;
  String desc;
  String icon1;
  String text1;
  String icon2;
  String text2;
  String icon3;
  String text3;

  ServicesModel({
    required this.id,
    required this.title,
    required this.desc,
    required this.icon1,
    required this.text1,
    required this.icon2,
    required this.text2,
    required this.icon3,
    required this.text3,
  });

  factory ServicesModel.fromJson(Map<String, dynamic> json) => ServicesModel(
        id: json["id"],
        title: json["title"],
        desc: json["desc"],
        icon1: json["icon_1"],
        text1: json["text_1"],
        icon2: json["icon_2"],
        text2: json["text_2"],
        icon3: json["icon_3"],
        text3: json["text_3"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "desc": desc,
        "icon_1": icon1,
        "text_1": text1,
        "icon_2": icon2,
        "text_2": text2,
        "icon_3": icon3,
        "text_3": text3,
      };
}
