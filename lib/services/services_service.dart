import 'dart:convert';
import 'dart:developer' as dev show log;
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:my_profile/model/services_model.dart';

import '../configuration/constant.dart';

class ServiceProvider {
  List<ModelServices>? _services;

  Future<List<ModelServices>?> getServicesData() async {
    final contents = await rootBundle.loadString(sourceData);

    _services = modelServicesFromJson(contents);

    dev.log(_services![1].desc);
    return _services;
  }
}
