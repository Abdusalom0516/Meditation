import 'package:flutter/material.dart';

class AppResponsive {
  static late double screenHeight;
  static late double screenWidth;

  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
  }

  static double height(double number) => (number / 720) * screenHeight;

  static double width(double number) => (number / 360) * screenWidth;
}

double appW(double width) {
  return AppResponsive.width(width);
}

double appH(double height) {
  return AppResponsive.height(height);
}