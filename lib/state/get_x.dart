import 'package:get/get.dart';
import 'package:my_profile/model/services_model.dart';
import 'package:my_profile/services/services_service.dart';

import '../views/services.dart';
import '../views_model/ServiceViewModel.dart';

class ServiceStateControll extends GetxController {
//  Rx<List<ServiceViewModel>> services = Rx(List<ServiceViewModel>)(null);
  Rx<List<ServiceViewModel>?> services = Rx<List<ServiceViewModel>?>(null);

  Future<void> stateDataService() async {
    final List<ServiceViewModel>? fetchData =
        await ListServiceViewModel().fetchData();
    services.value = fetchData;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    stateDataService(); // handle services data

    super.onInit();
  }

  static ServiceStateControll get instance => Get.find();
}

final instanceService = ServiceStateControll.instance;
