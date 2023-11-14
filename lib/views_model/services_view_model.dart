import 'package:my_profile/model/services/services_model.dart';
import '../services/services/services_service.dart';

class ListServiceViewModel {
  List<ServiceViewModel>? _services;

  Future<List<ServiceViewModel>?> fetchData() async {
    try {
      final apiResult = await ServiceProvider().getServicesData();
      if (apiResult != null) {
        _services = apiResult.map((e) => ServiceViewModel(service: e)).toList();
      }
    } catch (e) {
      print("Error: $e");
    }
    return _services;
  }
}

class ServiceViewModel {
  final ModelServices? service;

  ServiceViewModel({required this.service});
}
