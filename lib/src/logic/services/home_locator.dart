import 'dart:convert';

import 'package:grocery_app/src/core/constant/api.dart';
import 'package:grocery_app/src/core/network_services/api_services.dart';

class ProductService extends ApiService {
  Future getMe(data) async {
    var response = await api.get(APIURL.getMe, data: jsonEncode(data));
    //response.statusCode

    return response;
  }

  Future refresh_token(data) async {
    var response = await api.post(APIURL.refresh_token, data: jsonEncode(data));

    return response;
  }

  Future getAllProduct(data, id) async {
    var response;

    if (id.isEmpty) {
       response =
          await api.get(APIURL.getAllProduct, data: jsonEncode(data));
    }
    else{
       response = await api.get(APIURL.getAllProduct+ id, data: jsonEncode(data));
    }

    return response;
  }

  Future getBestDealProduct(data) async {
    var response =
        await api.get(APIURL.getBestDealProduct, data: jsonEncode(data));

    return response;
  }

  Future getAllcategory(data) async {
    var response = await api.get(APIURL.getAllcategory, data: jsonEncode(data));

    return response;
  }

   Future addToWish(data) async {
    var response = await api.post(APIURL.addToWish, data: jsonEncode(data));

    return response;
  }

     Future addToCart(data) async {
    var response = await api.post(APIURL.addToCart, data: jsonEncode(data));

    return response;
  }

  


  

  Future getBanners(data) async {
    var response = await api.get(APIURL.getBanners, data: jsonEncode(data));

    return response;
  }

  Future customerLogOut(data) async {
    var response =
        await api.post(APIURL.customerLogOut, data: jsonEncode(data));

    return response;
  }
}
