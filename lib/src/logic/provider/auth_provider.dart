import 'package:flutter/material.dart';
import 'package:grocery_app/src/core/network_services/service_locator.dart';
import 'package:grocery_app/src/core/utils/snack_bar.dart';
import 'package:grocery_app/src/logic/repo/auth_repo.dart';
import 'package:grocery_app/utils/constants/shared_pref_utils.dart';
import 'package:grocery_app/utils/extensions/extensions.dart';

class AuthProvider extends ChangeNotifier {
  int _currentIndex = 0;
  final int _totalPages = 4; // Set total number of pages
  final PageController _pageController = PageController();

  final TextEditingController name = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController address = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  int get currentIndex => _currentIndex;
  PageController get pageController => _pageController;

  // Calculate progress as a percentage
  double get progress => (_currentIndex + 1) / _totalPages;

  final _authRepo = getIt<AuthRepo>();
  String numberwithCode = '';

  Future<bool> sendOtp(String number, BuildContext context) async {
    context.showLoader(show: true);

    var data = {"phone": "+91" + number};

    numberwithCode = "+91" + number;
    try {
      var response = await _authRepo.sendOtp(data);
      print("check response ${response}");
      context.showLoader(show: false);

      return response.fold(
        (error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error.message),
              backgroundColor: Colors.red,
            ),
          );
          return false;
        },
        (response) {
          print("hdsfvjhdfghjdf");
          _showSnackBar(context, "OTP sent successfully", Colors.green);

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

  Future<bool> verifiOtp(String otp, BuildContext context) async {
    context.showLoader(show: true);
    var data = {
      "phone": numberwithCode,
      "otp": otp,
    };

    try {
      var result = await _authRepo.verifyOtp(data);

      return result.fold(
        (error) {
          // Show error Snackbar
          context.showLoader(show: false);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error.message),
              backgroundColor: Colors.red,
            ),
          );
          return false; // Login failed
        },
        (response) {
          // Login success
          context.showLoader(show: false);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("OTP Verify successful!"),
              backgroundColor: Colors.green,
            ),
          );
          return true;
        },
      );
    } catch (e) {
      context.showLoader(show: false);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Something went wrong. Please try again."),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
  }

  // //login

  // //vendorRegister

  Future<bool> customerRegister(BuildContext context) async {
    context.showLoader(show: true);
    var data = {
      "firstName": name.text,
      "lastName": lastName.text,
      "email": email.text,
    };

    try {
      var result = await _authRepo.customerRegister(data);
      return result.fold(
        (error) {
          // Show error Snackbar
          context.showLoader(show: false);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error.message),
              backgroundColor: Colors.red,
            ),
          );
          return false; // Login failed
        },
        (response) {
          // Login success
          context.showLoader(show: false);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Vendor Register successful!"),
              backgroundColor: Colors.green,
            ),
          );
          return true;
        },
      );
    } catch (e) {
      context.showLoader(show: false);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Something went wrong. Please try again."),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
  }

  // void goToNextPage() {
  //   // Ensure that the current index is updated correctly
  //   if (_currentIndex < _totalPages - 1) {
  //     _currentIndex++; // Increment the index here
  //     _pageController.animateToPage(
  //       _currentIndex,
  //       duration: const Duration(milliseconds: 300),
  //       curve: Curves.ease,
  //     );
  //     notifyListeners(); // Notify listeners to update the view
  //   }
  // }

  // void goToPage(int index) {
  //   if (index >= 0 && index < _totalPages) {
  //     _currentIndex = index;
  //     print("Navigating to page: $_currentIndex"); // Debug print
  //     _pageController.animateToPage(
  //       _currentIndex,
  //       duration: const Duration(milliseconds: 300),
  //       curve: Curves.ease,
  //     );
  //     notifyListeners();
  //   }
  // }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // bool _isChecked = false;

  // bool get isChecked => _isChecked;

  // void toggleCheckbox(bool value) {
  //   _isChecked = value;
  //   notifyListeners();
  // }

  void _showSnackBar(BuildContext context, String message, Color color) {
    showTopSnackBar(context, message, color);
  }
}
