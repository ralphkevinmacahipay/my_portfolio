import 'package:equatable/equatable.dart';
import 'dart:convert';

List<ModelServices> modelServicesFromJson(String str) =>
    List<ModelServices>.from(
        json.decode(str).map((x) => ModelServices.fromJson(x)));

String modelServicesToJson(List<ModelServices> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelServices extends Equatable {
  final String icon;
  final String title;
  final String desc;
  final String iconA;
  final String titleA;
  final String iconB;
  final String titleB;
  final String iconC;
  final String titleC;

  const ModelServices({
    required this.icon,
    required this.title,
    required this.desc,
    required this.iconA,
    required this.titleA,
    required this.iconB,
    required this.titleB,
    required this.iconC,
    required this.titleC,
  });

  factory ModelServices.fromJson(Map<String, dynamic> json) => ModelServices(
        icon: json["icon"],
        title: json["title"],
        desc: json["desc"],
        iconA: json["icon_a"],
        titleA: json["title_a"],
        iconB: json["icon_b"],
        titleB: json["title_b"],
        iconC: json["icon_c"],
        titleC: json["title_c"],
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "title": title,
        "desc": desc,
        "icon_a": iconA,
        "title_a": titleA,
        "icon_b": iconB,
        "title_b": titleB,
        "icon_c": iconC,
        "title_c": titleC,
      };
  @override
  List<Object?> get props => [
        // id,
        icon,
        title,
        desc,
        iconA,
        titleA,
        iconB,
        titleB,
        iconC,
        titleC,
      ];
}
