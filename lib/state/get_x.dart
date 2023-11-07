import 'package:get/get.dart';
import 'package:my_profile/model/services_model.dart';
import 'package:my_profile/services/services_service.dart';

import '../views/services.dart';
import '../views_model/ServiceViewModel.dart';

class ServiceStateControll extends GetxController {
//  Rx<List<ServiceViewModel>> services = Rx(List<ServiceViewModel>)(null);
  Rx<List<ServiceViewModel>?> services = Rx<List<ServiceViewModel>?>(null);

  @override
  void onInit() async {
    // TODO: implement onInit
    final List<ServiceViewModel>? fetchData =
        await ListServiceViewModel().fetchData();
    services.value = fetchData;

    print(" services ==> ${services.value?[2].service?.title}");
    super.onInit();
  }

  static ServiceStateControll get instance => Get.find();
}
