import 'package:flutter/material.dart';

import '../utils/color_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.txt});
  final String txt;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: ColorManager.second,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        txt,
        style: TextStyle(fontSize: 28, color: ColorManager.primary),
      ),
    );
  }
}
