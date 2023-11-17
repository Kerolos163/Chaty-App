import '../../../../../Core/transition/page_slide_transition.dart';
import '../../../../Layout/presentation/view/layout_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../../../Core/constant.dart';
import '../../../../../Core/utils/asset_manager.dart';
import '../../../../../Core/utils/color_manager.dart';
import '../../../../../Core/widget/custom_button.dart';
import '../../View_Model/LoginRegister_Cubit/cubit.dart';
import '../../View_Model/LoginRegister_Cubit/state.dart';
import 'custom_text_form_field.dart';
import 'register_row.dart';

class LoginRegisterBody extends StatefulWidget {
  const LoginRegisterBody({super.key});

  @override
  State<LoginRegisterBody> createState() => _LoginRegisterBodyState();
}

class _LoginRegisterBodyState extends State<LoginRegisterBody> {
  final _formKey = GlobalKey<FormState>();
  late LoginRegisterCubit myCubit;
  @override
  void dispose() {
    myCubit.emailController!.dispose();
    myCubit.passwordController!.dispose();
    myCubit.confirmPasswordController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    myCubit = LoginRegisterCubit.get(context);
    return BlocConsumer<LoginRegisterCubit, LoginRegisterState>(
      listener: (context, state) {
        if (state is CreateAccountFailureState) {
          showSnack(context, state.error);
        } else if (state is LoginFailureState) {
          showSnack(context, state.error);
        } else if (state is LoginSuccessState) {
          PageSlide(const LayoutView());
          Navigator.of(context).pushReplacement(PageSlide(const LayoutView()));
        }
      },
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
                      myCubit.isLogin ? "LOGIN" : "REGISTER",
                      style: TextStyle(
                        fontSize: 30,
                        color: ColorManager.primaryFont,
                      ),
                    ),
                  ),
                  SizedBox(height: MyDevice.getHeigh(context) / 60),
                  CustomTextFormField(
                    hint: "Email",
                    controller: myCubit.emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: MyDevice.getHeigh(context) / 60),
                  CustomTextFormField(
                    controller: myCubit.passwordController,
                    hint: "Password",
                    obscureText: !(myCubit.isVisiable),
                    suffixIcon: IconButton(
                      onPressed: () {
                        myCubit.changeVisiability();
                      },
                      icon: Icon(myCubit.isVisiable
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
                  myCubit.isLogin
                      ? const SizedBox()
                      : CustomTextFormField(
                          controller: myCubit.confirmPasswordController,
                          hint: "Confirme Password",
                          obscureText: !(myCubit.isVisiable),
                          suffixIcon: IconButton(
                            onPressed: () {
                              myCubit.changeVisiability();
                            },
                            icon: Icon(
                              myCubit.isVisiable
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Password';
                            } else if (value !=
                                myCubit.passwordController!.text) {
                              return "don't match password";
                            }
                            return null;
                          },
                        ),
                  const SizedBox(height: 20),
                  (state is CreateAccountLoadingState ||
                          state is LoginLoadingState)
                      ? CircularProgressIndicator(color: ColorManager.second)
                      : CustomButton(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              if (myCubit.isLogin) {
                                userLogin(context);
                              } else {
                                userRegister(context);
                              }
                            }
                          },
                          txt: myCubit.isLogin ? "LOGIN" : "REGISTER",
                        ),
                  const SizedBox(height: 8),
                  RegistarRow(
                    logIn: myCubit.isLogin,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void userLogin(BuildContext context) {
    myCubit.logInAccount(
      userEmail: myCubit.emailController!.text.trim(),
      userPassword: myCubit.passwordController!.text,
    );
  }

  void userRegister(BuildContext context) {
    myCubit.createAccount(
      userEmail: myCubit.emailController!.text.trim(),
      userPassword: myCubit.passwordController!.text,
    );
  }
}
