
import 'package:flutter/material.dart';
import 'package:grocery_app/src/core/network_services/dio_client.dart';
import 'package:grocery_app/src/core/network_services/service_locator.dart';


/// Base api service
abstract class ApiService {
  // Dio client object
  @protected
  final api = getIt<DioClient>();
}
