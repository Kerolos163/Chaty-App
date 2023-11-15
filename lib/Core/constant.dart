import 'utils/color_manager.dart';
import 'package:flutter/material.dart';

abstract class MyDevice {
  static getWidth(context) => MediaQuery.of(context).size.width;
  static getHeigh(context) => MediaQuery.of(context).size.height;
}

showSnack(context, String txt) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(txt),backgroundColor: ColorManager.second),
  );
}
