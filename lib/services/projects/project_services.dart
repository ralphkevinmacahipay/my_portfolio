import 'package:flutter/services.dart';
import 'package:my_profile/model/projects/project_model.dart';

String projectSource = "assets/mock_data_project.json";

class ProjectServices {
  List<ProjectsModel>? _projects;

  Future<List<ProjectsModel>?> getProjectData() async {
    try {
      final jsonData = await rootBundle.loadString(projectSource);
      _projects = projectsModelFromJson(jsonData);
    } catch (e) {
      print("ERROR:  ==> $e");
      return null;
    }
    print("projects:  ==> ${_projects![0].projectTitle}");

    return _projects;
  }
}
