import 'package:flutter/material.dart';

class DeviceUtil {
  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.shortestSide >= 600;
  }
}
