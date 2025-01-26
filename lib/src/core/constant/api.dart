class APIURL {
  static const BASE_URL = "http://210.89.44.183:3333/xam/";
  static const String sendOtp = "${BASE_URL}auth/send-otp/customer";

  static const String verifyOtp = "${BASE_URL}auth/verify-otp/customer";
  static const String login = "${BASE_URL}auth/login/vendor";
  static const String customerRegister = "${BASE_URL}auth/register/customer";
  static const String getAllProduct = "${BASE_URL}products";
  static const String getBanners = "${BASE_URL}banners";
  static const String customerLogOut = "${BASE_URL}auth/logout/customer";
  static const String getBestDealProduct = "${BASE_URL}products/best-deals";
  static const String getAllcategory = "${BASE_URL}categories";


  

  static const String updateStore = "${BASE_URL}stores/";
  static const String forgetPassword = "${BASE_URL}auth/forgot-password/vendor";
  static const String verifyForgetPassword =
      "${BASE_URL}auth/forgot-password-verify-otp/vendor";
  static const String reset_password = "${BASE_URL}auth/reset-password/vendor";
  
  static const String getProduct = "${BASE_URL}products";
  static const String getCategoryByLevel = "${BASE_URL}categories/by-level/1";
  static const String getMe = "${BASE_URL}auth/me";
  static const String refresh_token = "${BASE_URL}auth/refresh-token";
  static const String createProduct = "${BASE_URL}products";

  static const String uploadImage = "${BASE_URL}images/upload";
  static const String deleteProduct = "${BASE_URL}products/";
  static const String updateProduct = "${BASE_URL}products/";
}
