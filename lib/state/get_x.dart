import 'package:get/get.dart';
import 'package:my_profile/model/services/services_model.dart';
import 'package:my_profile/services/services/services_service.dart';
import 'package:my_profile/views_model/projects/projects_view_model.dart';

import '../views/services.dart';
import '../views_model/services_view_model.dart';

class ServiceStateControll extends GetxController {
//  Rx<List<ServiceViewModel>> services = Rx(List<ServiceViewModel>)(null);
  Rx<List<ServiceViewModel>?> services = Rx<List<ServiceViewModel>?>(null);
  Rx<List<ProjectViewModel>?> projects = Rx<List<ProjectViewModel>?>(null);

  Future<void> stateDataService() async {
    final List<ServiceViewModel>? fetchData =
        await ListServiceViewModel().fetchData();
    services.value = fetchData;
  }

  Future<void> stateDataProject() async {
    final getFromViewModel = await ListProjectsViewModel().getFetchProject();
    if (getFromViewModel != null) {
      projects.value = getFromViewModel;
      if (projects.value != null) {
        print("projects: ${projects.value?[0].project.projectTitle}");
      } else {
        print("No project data the length is : ${projects.value?.length}");
      }
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    stateDataService(); // handle services data
    stateDataProject(); // handle projects data
    super.onInit();
  }

  static ServiceStateControll get instance => Get.find();
}

final instanceService = ServiceStateControll.instance;
