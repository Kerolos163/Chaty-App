import '../../../../Core/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, this.hint});
  final String? hint;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintStyle: GoogleFonts.birthstone(fontSize: 28),
        label: Text(
          hint ?? "",
          style: GoogleFonts.birthstone(
              fontSize: 30, color: ColorManager.primaryFont),
        ),
        border: outlineInputBorder(color: ColorManager.primaryFont),
        focusedBorder: outlineInputBorder(color: ColorManager.second),
        enabledBorder: outlineInputBorder(color: ColorManager.primaryFont),
        errorBorder: outlineInputBorder(color: ColorManager.error),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder({required Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color, width: 1.5),
    );
  }
}
