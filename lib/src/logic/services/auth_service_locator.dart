
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:grocery_app/src/core/constant/api.dart';
import 'package:grocery_app/src/core/network_services/api_services.dart';



class AuthServices extends ApiService {
  /// Login
  Future sendOtp(data) async
   {
    var response = await api.post(APIURL.sendOtp, data: jsonEncode(data));
    return response;
  }

   

  

   Future verifyOtp(data) async {
    var response = await api.post(APIURL.verifyOtp, data: jsonEncode(data));
    return response;
  }
   Future login(data) async
    {
    var response = await api.post(APIURL.login, data: jsonEncode(data));
    //response.statusCode
   
    return response;
  }

   

  

   Future userRegister(data) async 
   {
    var response = await api.post(APIURL.customerRegister, data: jsonEncode(data));
    return response;
  }

  


    Future forgetPassword(data) async
     {
    var response = await api.post(APIURL.forgetPassword, data: jsonEncode(data));
    return response;
  }

   Future verifyForgetPassword(data) async
     {
    var response = await api.post(APIURL.verifyForgetPassword, data: jsonEncode(data));
    return response;
  }


   Future reset_password(data) async
     {
    var response = await api.post(APIURL.reset_password, data: jsonEncode(data));
    return response;
  }




  



  

  /// Login
  // Future profileUpdate(data) async {
  //   var response = await api.put(Endpoints.update, data: data);
  //   return response;
  // }

  // /// Update badges
  // Future updateBadge(data) async {
  //   var response = await api.put(Endpoints.updateBadge, data: data);
  //   return response;
  // }

  // /// Login
  // Future getProfile() async {
  //   var response = await api.get(
  //     Endpoints.myProfile,
  //   );
  //   return response;
  // }

  // Future getAvatar() async {
  //   var response = await api.get(
  //     Endpoints.getAvatar,
  //   );
  //   return response;
  // }

  // Future getAllBadge() async {
  //   var response = await api.get(
  //     Endpoints.getAllBadge,
  //   );
  //   return response;
  // }

  // Future getOtherProfile(data) async {
  //   var response =
  //       await api.get(Endpoints.getOtherUserProfile, queryParameters: data);
  //   return response;
  // }

  // setNotificatinStatus(data) async {
  //   var response = await api.put(Endpoints.notificationSettings, data: data);
  //   return response;
  // }

  // Future reportUser(data) async {
  //   var response = await api.post(Endpoints.report, data: data);
  //   return response;
  // }

  // Future logOut(data) async {
  //   var response = await api.post(Endpoints.signOut, data: data);
  //   return response;
  // }
}
