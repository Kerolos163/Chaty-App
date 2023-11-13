import 'package:chatapp/Features/LoginRegister_View/View_Model/LoginRegister_Cubit/cubit.dart';
import 'package:chatapp/Features/LoginRegister_View/View_Model/LoginRegister_Cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Core/constant.dart';
import '../../../../Core/utils/asset_manager.dart';
import '../../../../Core/utils/color_manager.dart';
import '../../../../Core/widget/custom_button.dart';
import 'custom_text_form_field.dart';
import 'register_row.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class LoginRegisterBody extends StatelessWidget {
  const LoginRegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginRegisterCubit, LoginRegisterState>(
      builder: (context, state) {
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                      fontSize: 35,
                      color: ColorManager.primaryFont,
                    ),
                  ),
                ),
                SizedBox(height: MyDevice.getHeigh(context) / 50),
                const CustomTextFormField(hint: "Email"),
                SizedBox(height: MyDevice.getHeigh(context) / 50),
                CustomTextFormField(
                  hint: "Password",
                  obscureText: !(LoginRegisterCubit.get(context).isVisiable),
                  suffixIcon: IconButton(
                    onPressed: () {
                      LoginRegisterCubit.get(context).changeVisiability();
                    },
                    icon: Icon(LoginRegisterCubit.get(context).isVisiable
                        ? Icons.visibility_off
                        : Icons.visibility),
                  ),
                ),
                const SizedBox(height: 30),
                const CustomButton(txt: "LogIn"),
                const SizedBox(height: 8),
                const RegistarRow()
              ],
            ),
          ),
        );
      },
    );
  }
}
