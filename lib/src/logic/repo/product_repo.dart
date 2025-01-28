import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:grocery_app/src/core/utils/custom_dio_exception.dart';
import 'package:grocery_app/src/core/utils/response_type_def.dart';
import 'package:grocery_app/src/data/allProduct_model.dart';
import 'package:grocery_app/src/data/banners.dart';
import 'package:grocery_app/src/data/best_dealProduct.dart';
import 'package:grocery_app/src/data/product_category.dart';
import 'package:grocery_app/src/logic/services/home_locator.dart';

class ProductRepo {
  final ProductService _productService;

  ProductRepo(this._productService);

  FutureResult<AllProductModel> getAllProduct(
      data, BuildContext context, id) async {
    try {
      var response = await _productService.getAllProduct(data, id);

      AllProductModel loginResponse =
          allProductModelFromJson(response.toString());

      final String model = response.toString();

      return right(loginResponse);
    } on DioException catch (e) {
      var error = CustomDioExceptions.handleError(e);
      return left(error);
    }
  }

  FutureResult<BestDealProduct> getBestDealProduct(
      data, BuildContext context) async {
    try {
      var response = await _productService.getBestDealProduct(data);

      BestDealProduct loginResponse =
          bestDealProductFromJson(response.toString());

      final String model = response.toString();

      return right(loginResponse);
    } on DioException catch (e) {
      var error = CustomDioExceptions.handleError(e);
      return left(error);
    }
  }

  FutureResult<ProductCategory> getAllcategory(
      data, BuildContext context) async {
    try {
      var response = await _productService.getAllcategory(data);

      ProductCategory productCategory =
          productCategoryFromJson(response.toString());

      // final String model = response.toString();

      return right(productCategory);
    } on DioException catch (e) {
      print("djhgfjdfhjg  ${e}");
      var error = CustomDioExceptions.handleError(e);
      return left(error);
    }
  }

  FutureResult<String> addToWish(data) async 
  {
    try {
      var response = await _productService.addToWish(data);
     
       final String model = response.toString();

      return right(model);
    } on DioException catch (e) 
    {
      print("djhgfjdfhjg  ${e}");
      var error = CustomDioExceptions.handleError(e);
      return left(error);
    }
  }

   FutureResult<String> addToCart(data) async 
  {
    try {
      var response = await _productService.addToCart(data);
     
       final String model = response.toString();

      return right(model);
    } on DioException catch (e) 
    {
      print("djhgfjdfhjg  ${e}");
      var error = CustomDioExceptions.handleError(e);
      return left(error);
    }
  }




  FutureResult<BannerModel> getBanners(data, BuildContext context) async {
    try {
      var response = await _productService.getBanners(data);

      BannerModel bannerresponse = bannerFromJson(response.toString());

      final String model = response.toString();

      return right(bannerresponse);
    } on DioException catch (e) {
      var error = CustomDioExceptions.handleError(e);
      return left(error);
    }
  }

  FutureResult<String> customerLogOut(data) async {
    try {
      var response = await _productService.customerLogOut(data);

      final String model = response.toString();

      return right(model);
    } on DioException catch (e) {
      var error = CustomDioExceptions.handleError(e);
      return left(error);
    }
  }

  // FutureResult<VendorModel> getMe(data) async {
  //   try {
  //     var response = await _homeService.getMe(data);

  //     final VendorModel vendorModel = vendorModelFromJson(response.toString());

  //     if (vendorModel != null)
  //     {
  //       SharedPrefUtils.USER_NAME =
  //           vendorModel.firstName + " " + vendorModel.lastName;
  //           SharedPrefUtils.PHONE = vendorModel.phone;

  //       print("dkfjhdkfhkfk  ${SharedPrefUtils.USER_NAME}");
  //       await SharedPrefUtils.setStoreId(storeId: vendorModel.storeId ?? "");

  //     }

  //     final String model = response.toString();

  //     return right(vendorModel);
  //   } on DioException catch (e) {
  //     var error = CustomDioExceptions.handleError(e);
  //     return left(error);
  //   }
  // }
}
