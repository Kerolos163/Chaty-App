import 'package:flutter/material.dart';

abstract class MyDevice {
  static getWidth(context) => MediaQuery.of(context).size.width;
  static getHeigh(context) => MediaQuery.of(context).size.height;
}
