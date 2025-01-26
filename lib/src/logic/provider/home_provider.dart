import 'package:flutter/material.dart';
import 'package:grocery_app/src/core/network_services/service_locator.dart';
import 'package:grocery_app/src/core/routes/routes.dart';
import 'package:grocery_app/src/data/allProduct_model.dart';
import 'package:grocery_app/src/data/banners.dart';
import 'package:grocery_app/src/data/best_dealProduct.dart';
import 'package:grocery_app/src/data/product_category.dart';
import 'package:grocery_app/src/logic/repo/product_repo.dart';
import 'package:grocery_app/utils/constants/shared_pref_utils.dart';
import 'package:grocery_app/utils/extensions/extensions.dart';

class ProductProvider extends ChangeNotifier {
  final _homeRepo = getIt<ProductRepo>();

  bool isLoadingg = true;

  List<Product> products = [];

  Future<void> gettAllProduct(BuildContext context) async {
    var data = {};

    var result = await _homeRepo.getAllProduct(data, context);
    return result.fold(
      (error) {
        isLoadingg = false;
        notifyListeners();
      },
      (response) {
        products = response.data!;
        isLoadingg = false;
        notifyListeners();
      },
    );
  }

  List<BestDeal> bestdeal = [];

  bool isBestdealingloading = true;

  Future<void> getBestDealProduct(BuildContext context) async {
    var data = {};

    var result = await _homeRepo.getBestDealProduct(data, context);
    return result.fold(
      (error) {
        isBestdealingloading = false;
        notifyListeners();
      },
      (response) {
        bestdeal = response.data!;
        isBestdealingloading = false;
        notifyListeners();
      },
    );
  }

  List<Datum> categoryList = [];

  bool iscategroyloading = true;
  Future<void> getAllcategory(BuildContext context) async {
    var data = {};

    var result = await _homeRepo.getAllcategory(data, context);
    return result.fold(
      (error) {
           print("djhgfjdfhjg  ${error}");
        iscategroyloading = false;
        notifyListeners();
      },
      (response) {
        print("jdshfjghdhfjhgjd");
        categoryList = response.data!;
        iscategroyloading = false;
        notifyListeners();
      },
    );
  }

  List<BannerData> banner = [];
  bool isBannerLoading = true;

  Future<void> getBanners(BuildContext context) async {
    var data = {};

    var result = await _homeRepo.getBanners(data, context);
    return result.fold(
      (error) {
        isBannerLoading = false;
        notifyListeners();
      },
      (response) {
        banner = response.data!;
        isBannerLoading = false;
        notifyListeners();
      },
    );
  }

  Future<bool> customerLogOut(BuildContext context) async {
    context.showLoader(show: true);

    var data = {};

    try {
      var result = await _homeRepo.customerLogOut(data);

      context.showLoader(show: false);

      return result.fold(
        (error) {
          // Show error Snackbar
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error.message),
              backgroundColor: Colors.red,
            ),
          );
          return false; // Login failed
        },
        (response) async {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Store created successful!"),
              backgroundColor: Colors.green,
            ),
          );
          await SharedPrefUtils.clear();
          context.clearAndPush(routePath: MyRoutes.LOGIN);

          return true;
        },
      );
    } catch (e) {
      context.showLoader(show: false);
      print("Unexpected error: $e");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Something went wrong. Please try again."),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
  }

  int _activeIndex = 0;

  int get activeIndex => _activeIndex;

  void setActiveIndex(int index) {
    _activeIndex = index;
    notifyListeners();
  }
}
