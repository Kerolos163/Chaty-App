import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../Core/utils/color_manager.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hint,
    this.obscureText = false,
    this.suffixIcon,
    this.controller,
    this.validator,
  });
  final String? hint;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: ColorManager.second,
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintStyle: GoogleFonts.birthstone(fontSize: 28),
        label: Text(
          hint ?? "",
          style: GoogleFonts.birthstone(
              fontSize: 30, color: ColorManager.primaryFont),
        ),
        suffixIcon: suffixIcon,
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
