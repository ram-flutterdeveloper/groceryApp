import 'package:flutter/material.dart';
import 'package:grocery_app/utils/constants/color_constant.dart';

extension CommonInputDecoration on InputDecoration {
  InputDecoration customRoundedTextFieldDecoration(String hint, Widget? prefix, Widget? suffix, TextStyle hintStyle) {
    var returnResult = InputDecoration(
      hintText: hint,
      labelText: hint,
      alignLabelWithHint: false,
      suffixIcon: suffix,
      suffixIconConstraints: const BoxConstraints(minWidth: 25, maxWidth: 25, maxHeight: 25, minHeight: 25),
      contentPadding: const EdgeInsets.only(top: 10, right: 10, bottom: 10, left: 10),
      prefix: prefix,
      constraints: const BoxConstraints(maxHeight: 60, minHeight: 60),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      labelStyle: hintStyle,
      hintStyle: hintStyle,
      isCollapsed: true,
      fillColor: APPCOLOR.whiteFBFEFB,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(
          color: APPCOLOR.borderColor.withOpacity(0.4),
        ),
      ),
      counterText: "",
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(
          color: APPCOLOR.borderColor.withOpacity(0.4),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(
          color: Colors.red,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(
          color: APPCOLOR.borderColor.withOpacity(0.4),
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(
          color: APPCOLOR.borderColor.withOpacity(0.4),
        ),
      ),
    );
    return returnResult;
  }
}
