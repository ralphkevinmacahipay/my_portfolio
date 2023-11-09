import 'package:flutter/services.dart';
import 'package:my_profile/model/services/services_model.dart';

String sourceDataS = "assets/mock_data_services.json";

class ServiceProvider {
  List<ModelServices>? _services;

  Future<List<ModelServices>?> getServicesData() async {
    final contents = await rootBundle.loadString(sourceDataS);

    _services = modelServicesFromJson(contents);

    return _services;
  }
}
