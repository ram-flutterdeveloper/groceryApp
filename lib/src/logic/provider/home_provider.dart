import 'package:flutter/material.dart';
import 'package:grocery_app/src/core/network_services/service_locator.dart';
import 'package:grocery_app/src/logic/repo/home_repo.dart';

class ProductProvider extends ChangeNotifier {
  final _homeRepo = getIt<ProductRepo>();

  Future<bool> gettAllProduct(BuildContext context) async {
    var data = {};

    var result = await _homeRepo.getAllProduct(data, context);
    return result.fold(
      (error) {
        return true;
      },
      (response) {
        return true;
      },
    );
  }
}
