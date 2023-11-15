import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/color_manager.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.txt});
  final String txt;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.second,
        ),
        alignment: Alignment.center,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Text(
              txt,
              style: GoogleFonts.birthstone(
                fontSize: constraints.maxHeight / 1.8,
                color: ColorManager.primaryFont,
              ),
            );
          },
        ),
      ),
    );
  }
}
