import '../../../../Core/constant.dart';
import '../../../../Core/utils/asset_manager.dart';
import '../../../../Core/utils/color_manager.dart';
import '../../../../Core/widget/custom_button.dart';
import 'custom_text_form_field.dart';
import 'register_row.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MyDevice.getHeigh(context) / 16),
            Lottie.asset(AssetManager.loginAnimation),
            Text(
              "Chaty",
              style: GoogleFonts.birthstone(
                fontSize: MyDevice.getWidth(context) / 5,
                color: ColorManager.primaryFont,
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Log In",
                style: TextStyle(fontSize: 35),
              ),
            ),
            SizedBox(height: MyDevice.getHeigh(context) / 50),
            const CustomTextFormField(hint: "Email"),
            SizedBox(height: MyDevice.getHeigh(context) / 50),
            const CustomTextFormField(hint: "Password"),
            const SizedBox(height: 30),
            const CustomButton(txt: "LogIn"),
            const SizedBox(height: 8),
            const RegistarRow()
          ],
        ),
      ),
    );
  }
}
