import 'dart:math' as math;


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/utils/constants/globle_variable.dart';




/// Hides soft keyboard if already shown
///
enum SnackType {
  success,
  alert,
  error
}


void hideKeyBoard() {
  FocusManager.instance.primaryFocus?.unfocus();
}


/// Show snackbar
void showSnackBar(
    { BuildContext ?context,
    required String message,
    SnackType snackType  = SnackType.success,
    bool canDismiss = true,
    bool sticky = false,
    SnackBarBehavior behaviour = SnackBarBehavior.floating,
    }) {
  //if (!context?.mounted??) return;
  //Clear snack bars
  ScaffoldMessenger.of(context??GlobalVariable.globalScaffoldKey.currentContext!).clearSnackBars();
  // Snack bar
  final snackBar = SnackBar(
    behavior: behaviour,
    padding: EdgeInsets.zero,
    elevation: 0,
    content: Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors:snackType==SnackType.success? const [
            Color(0xFF61B15A),
            Color(0xFF6ABE8B)
          ]:snackType==SnackType.alert?
          const [
            Color(0xFFFF8906),
            Color(0xFFFFA745),
          ]:
          const [
            Colors.red,
            Colors.redAccent,
          ],
        ),
      ),
      child: Text(
        message,
      
      textAlign: TextAlign.center,
      ),
    ),
    duration: sticky ? const Duration(days: 365) : const Duration(seconds: 3),
    dismissDirection:
        canDismiss ? DismissDirection.down : DismissDirection.none,
  );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
  ScaffoldMessenger.of(context??GlobalVariable.globalScaffoldKey.currentContext!).showSnackBar(snackBar);
}


