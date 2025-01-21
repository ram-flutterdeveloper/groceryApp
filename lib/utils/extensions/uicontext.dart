// ignore_for_file: file_names

import 'package:flutter/material.dart';

extension CustomUITheme on BuildContext {
  TextStyle customLight(Color color, double fontSize) {
    return TextStyle(fontWeight: FontWeight.w300, color: color, fontSize: fontSize, fontFamily: 'Nunito');
  }

  TextStyle customBold(Color color, double fontSize) {
    return TextStyle(fontWeight: FontWeight.w700, color: color, fontSize: fontSize, fontFamily: 'Nunito');
  }

  TextStyle customRegular(Color color, double fontSize) {
    return TextStyle(fontWeight: FontWeight.w400, color: color, fontSize: fontSize, fontFamily: 'Nunito');
  }

  TextStyle customMedium(Color color, double fontSize) {
    return TextStyle(fontWeight: FontWeight.w500, color: color, fontSize: fontSize, fontFamily: 'Nunito');
  }

  TextStyle customSemiBold(Color color, double fontSize) {
    return TextStyle(fontWeight: FontWeight.w600, color: color, fontSize: fontSize, fontFamily: 'Nunito');
  }

  TextStyle customExtraBold(Color color, double fontSize) {
    return TextStyle(fontWeight: FontWeight.w800, color: color, fontSize: fontSize, fontFamily: 'Nunito');
  }

  double screenWidth() {
    return MediaQuery.sizeOf(this).width;
  }

  double screenHeight() {
    return MediaQuery.sizeOf(this).height;
  }

  EdgeInsets get bodyPadding {
    return const EdgeInsets.only(left: 15, right: 15);
  }

  EdgeInsets get bodyLeftOnly {
    return const EdgeInsets.only(left: 15);
  }

  EdgeInsets get bodyAllPadding {
    return const EdgeInsets.all(15);
  }
}
