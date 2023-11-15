import '../../View_Model/LoginRegister_Cubit/cubit.dart';
import '../../View_Model/LoginRegister_Cubit/state.dart';
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

class LoginRegisterBody extends StatefulWidget {
  const LoginRegisterBody({super.key});

  @override
  State<LoginRegisterBody> createState() => _LoginRegisterBodyState();
}

class _LoginRegisterBodyState extends State<LoginRegisterBody> {
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    LoginRegisterCubit.get(context).emailController!.dispose();
    LoginRegisterCubit.get(context).passwordController!.dispose();
    LoginRegisterCubit.get(context).confirmPasswordController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginRegisterCubit, LoginRegisterState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: MyDevice.getHeigh(context) / 14),
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
                      LoginRegisterCubit.get(context).isLogin
                          ? "LOGIN"
                          : "REGISTER",
                      style: TextStyle(
                        fontSize: 30,
                        color: ColorManager.primaryFont,
                      ),
                    ),
                  ),
                  SizedBox(height: MyDevice.getHeigh(context) / 60),
                  CustomTextFormField(
                    hint: "Email",
                    controller: LoginRegisterCubit.get(context).emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: MyDevice.getHeigh(context) / 60),
                  CustomTextFormField(
                    controller:
                        LoginRegisterCubit.get(context).passwordController,
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: MyDevice.getHeigh(context) / 60),
                  LoginRegisterCubit.get(context).isLogin
                      ? const SizedBox()
                      : CustomTextFormField(
                          controller: LoginRegisterCubit.get(context)
                              .confirmPasswordController,
                          hint: "Confirme Password",
                          obscureText:
                              !(LoginRegisterCubit.get(context).isVisiable),
                          suffixIcon: IconButton(
                            onPressed: () {
                              LoginRegisterCubit.get(context)
                                  .changeVisiability();
                            },
                            icon: Icon(
                                LoginRegisterCubit.get(context).isVisiable
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Password';
                            } else if (value !=
                                LoginRegisterCubit.get(context)
                                    .passwordController!
                                    .text) {
                              return "don't match password";
                            }
                            return null;
                          },
                        ),
                  const SizedBox(height: 20),
                  CustomButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        if (LoginRegisterCubit.get(context).isLogin) {
                        } else {
                          userRegister(context);
                        }
                      } else {}
                    },
                    txt: LoginRegisterCubit.get(context).isLogin
                        ? "LOGIN"
                        : "REGISTER",
                  ),
                  const SizedBox(height: 8),
                  RegistarRow(
                    logIn: LoginRegisterCubit.get(context).isLogin,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void userRegister(BuildContext context) {
    LoginRegisterCubit.get(context).createAccount(
      userEmail: LoginRegisterCubit.get(context).emailController!.text.trim(),
      userPassword: LoginRegisterCubit.get(context).passwordController!.text,
    );
  }
}
