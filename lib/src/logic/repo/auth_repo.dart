import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:grocery_app/src/core/utils/custom_dio_exception.dart';
import 'package:grocery_app/src/core/utils/response_type_def.dart';
import 'package:grocery_app/src/data/OTPResponseModel.dart';
import 'package:grocery_app/src/data/registration_response.dart';
import 'package:grocery_app/src/data/vendor_otpModel.dart';
import 'package:grocery_app/src/logic/services/auth_service_locator.dart';
import 'package:grocery_app/utils/constants/shared_pref_utils.dart';

class AuthRepo {
  final AuthServices _authServices;

  AuthRepo(this._authServices);

  FutureResult<String> sendOtp(data) async {
    try {
      var response = await _authServices.sendOtp(data);
      final String model = response.toString();
      // OtpResponseModel otpResponseModel =
      //     otpResponseModelFromJson(response.toString());

      return right(model);
    } on DioException catch (e) {
      print("dhfgfdgjdhfgfgh  ${e}");
      var error = CustomDioExceptions.handleError(e);
      return left(error);
    }
  }

  FutureResult<VendorOtpModel> verifyOtp(data) async {
    try {
      var response = await _authServices.verifyOtp(data);

      final VendorOtpModel vendorOtpModel =
          vendorOtpModelFromJson(response.toString());

      if (vendorOtpModel.data != null) {
        await SharedPrefUtils.setToken(
            authToken: vendorOtpModel.data!.accessToken ?? "");
      }

      //  final String model = response.toString();

      return right(vendorOtpModel);
    } on DioException catch (e) {
      var error = CustomDioExceptions.handleError(e);
      return left(error);
    }
  }

  // FutureResult<LoginResponse> login(data) async {
  //   try {
  //     var response = await _authServices.login(data);

  //     LoginResponse loginResponse = loginResponseFromJson(response.toString());
  //     if (loginResponse.accessToken != null) {
  //       await SharedPrefUtils.setToken(
  //           authToken: loginResponse.accessToken ?? "");
  //       await SharedPrefUtils.setRefreshToken(
  //           refresh_token: loginResponse.refreshToken ?? "");
  //     }

  //     print("Response status code: ${response.statusCode}");

  //     return right(loginResponse);
  //   } on DioException catch (e) {
  //     print("DioException occurred: $e");

  //     if (e.response != null) {
  //       int statusCode = e.response!.statusCode ?? 0;
  //       var errorData = e.response!.data; // Error body from the server

  //       String errorMessage =
  //           errorData['message']['message'] ?? 'Unknown error';

  //       print("Error: $errorMessage (Status Code: $statusCode)");

  //       // Custom error handling
  //       var error = CustomDioExceptions.handleError(e);
  //       return left(error);
  //     } else {
  //       // Handle other DioExceptions without a response (e.g., network issues)
  //       var error = CustomDioExceptions.handleError(e);
  //       return left(error);
  //     }
  //   }
  // }

  FutureResult<String> customerRegister(data) async {
    try {
      var response = await _authServices.userRegister(data);

      RegistrationResponse registrationResponse =
          registrationResponseFromJson(response.toString());
      await SharedPrefUtils.setToken(
          authToken: registrationResponse.accessToken ?? "");
      if (response.statCode) {
        print("dsfklgjkfgbfgkfdgjkhkfdjg");
      }

      final String model = response.toString();
      return right(model);
    } on DioException catch (e) {
      var error = CustomDioExceptions.handleError(e);
      return left(error);
    }
  }

  // FutureResult<String> forgetPassword(data) async {
  //   try {
  //     var response = await _authServices.forgetPassword(data);
  //     final String model = response.toString();
  //     return right(model);
  //   } on DioException catch (e) {
  //     var error = CustomDioExceptions.handleError(e);
  //     return left(error);
  //   }
  // }

  // FutureResult<String> verifyForgetPassword(data) async {
  //   try {
  //     var response = await _authServices.verifyForgetPassword(data);

  //     PasswordModel passwordModel = passwordModelFromJson(response.toString());
  //     if (passwordModel.data != null) {
  //       print("JHGhjhg   ${passwordModel.data!.resetToken}");
  //       await SharedPrefUtils.setResetToken(
  //           resetToken: passwordModel.data!.resetToken ?? "");
  //     }

  //     final String model = response.toString();
  //     return right(model);
  //   } on DioException catch (e) {
  //     var error = CustomDioExceptions.handleError(e);
  //     return left(error);
  //   }
  // }

  // FutureResult<String> reset_password(data) async {
  //   try {
  //     var response = await _authServices.reset_password(data);
  //     final String model = response.toString();
  //     return right(model);
  //   } on DioException catch (e) {
  //     var error = CustomDioExceptions.handleError(e);
  //     return left(error);
  //   }
  // }
}
