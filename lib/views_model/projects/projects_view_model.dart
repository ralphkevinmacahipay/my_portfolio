import 'package:my_profile/model/projects/project_model.dart';
import 'package:my_profile/services/projects/project_services.dart';

class ListProjectsViewModel {
  List<ProjectViewModel>? projects;

  Future<List<ProjectViewModel>?> getFetchProject() async {
    try {
      final res = await ProjectServices().getProjectData();
      if (res != null) {
        projects = res.map((x) => ProjectViewModel(project: x)).toList();
      }
    } catch (e) {
      print("ERROR: $e");
    }
    return null;
  }
}

class ProjectViewModel {
  final ProjectsModel project;

  ProjectViewModel({required this.project});
}
