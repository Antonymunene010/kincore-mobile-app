import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class FetchPixels {
  /// Figma artboard size
  static const double mockupWidth = 402;
  static const double mockupHeight = 874;

  static late double screenWidth;
  static late double screenHeight;

  static late double _scaleW;
  static late double _scaleH;
  static late double _scaleText;

  /// call in first screen build
  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;

    _scaleW = screenWidth / mockupWidth;
    _scaleH = screenHeight / mockupHeight;

    /// text should never stretch
    _scaleText = _scaleW < _scaleH ? _scaleW : _scaleH;
  }

  /// horizontal spacing / width
  static double w(double px) => px * _scaleW;

  /// vertical spacing / height
  static double h(double px) => px * _scaleH;

  /// font size
  static double sp(double px) => px * _scaleText;

  /// radius
  static double r(double px) => px * _scaleText;

  /// icon size
  static double icon(double px) => px * _scaleText;

  /// safe percentage height
  static double hp(double percent) => screenHeight * percent / 100;

  /// safe percentage width
  static double wp(double percent) => screenWidth * percent / 100;
}

double getScreenPercentSize(BuildContext context, double percent) {
  return (MediaQuery.of(context).size.height * percent) / 100;
}


// class FetchPixels {
//   static double mockupWidth = 402;   // Figma width
//   static double mockupHeight = 874;  // Figma height
//
//   static double width = 0;
//   static double height = 0;
//
//   FetchPixels(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     width = size.width;
//     height = size.height;
//   }
//
//   static double pw(double px) => px / mockupWidth * width;
//   static double ph(double px) => px / mockupHeight * height;
//
//   static double textScale() {
//     return (width > height)
//         ? width / mockupWidth
//         : height / mockupHeight;
//   }
// }
//
//
