import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:grocery_app/src/core/utils/custom_dio_exception.dart';
import 'package:grocery_app/src/core/utils/response_type_def.dart';
import 'package:grocery_app/src/data/allProduct_model.dart';
import 'package:grocery_app/src/logic/services/home_locator.dart';


class ProductRepo {
  final ProductService _productService;

  ProductRepo(this._productService);

  FutureResult<String> getAllProduct(data, BuildContext context) async {
    try {
      var response = await _productService.getAllProduct(data);
     
      AllProductModel loginResponse = allProductModelFromJson(response.toString());

     

      final String model = response.toString();

      return right(model);
    } on DioException catch (e) 
    {
      

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
