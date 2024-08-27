import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle largeTitle(Color color) {
    return TextStyle(
        color: color,
        fontSize: 35,
        fontWeight: FontWeight.w700,
        fontFamily: 'Montserrat');
  }

  static TextStyle title(Color color) {
    return TextStyle(
        color: color,
        fontSize: 25,
        fontWeight: FontWeight.w400,
        fontFamily: 'Montserrat');
  }

  static TextStyle mediumText(Color color) {
    return TextStyle(
        color: color,
        fontSize: 23,
        fontWeight: FontWeight.w700,
        fontFamily: 'Montserrat');
  }

  static TextStyle regularText(Color color) {
    return TextStyle(
        color: color,
        fontSize: 20,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.7,
        fontFamily: 'Montserrat');
  }

  static TextStyle smalText(Color color) {
    return TextStyle(
        color: color,
        fontSize: 15,
        fontWeight: FontWeight.w500,
        fontFamily: 'Montserrat');
  }
}
