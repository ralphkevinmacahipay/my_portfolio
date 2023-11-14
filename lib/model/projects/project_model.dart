// To parse this JSON data, do
//
//     final projectsModel = projectsModelFromJson(jsonString);

import 'dart:convert';

List<ProjectsModel> projectsModelFromJson(String str) =>
    List<ProjectsModel>.from(
        json.decode(str).map((x) => ProjectsModel.fromJson(x)));

String projectsModelToJson(List<ProjectsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProjectsModel {
  String id;
  String projectTitle;
  String projectLink;
  String image;
  String projectDesc;

  ProjectsModel({
    required this.id,
    required this.projectTitle,
    required this.projectLink,
    required this.image,
    required this.projectDesc,
  });

  factory ProjectsModel.fromJson(Map<String, dynamic> json) => ProjectsModel(
        id: json["id"],
        projectTitle: json["project_title"],
        projectLink: json["project_link"],
        image: json["image"],
        projectDesc: json["project_desc"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "project_title": projectTitle,
        "project_link": projectLink,
        "image": image,
        "project_desc": projectDesc,
      };
}
