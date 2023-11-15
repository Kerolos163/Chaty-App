import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'state.dart';

class LoginRegisterCubit extends Cubit<LoginRegisterState> {
  LoginRegisterCubit() : super(IniteLoginRegisterState());
  static LoginRegisterCubit get(context) => BlocProvider.of(context);
  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  TextEditingController? confirmPasswordController = TextEditingController();

  bool isVisiable = false;
  changeVisiability() {
    isVisiable = !isVisiable;

    emit(ChangeVisibilityLoginRegisterState());
  }

  bool isLogin = true;
  changeScreen() {
    isLogin = !isLogin;
    emailController!.text = "";
    passwordController!.text = "";
    confirmPasswordController!.text = "";
    emit(ChangeScreenState());
  }

  createAccount({required String userEmail, required String userPassword}) {
    emit(CreateAccountLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: userEmail, password: userPassword)
        .then(
      (value) {
        log(value.user!.uid);
        changeScreen();
        emit(CreateAccountSuccessState());
      },
    ).catchError((error) {
      log(error.toString());
      emit(CreateAccountFailureState(error: error.toString()));
    });
  }

  logInAccount({required String userEmail, required String userPassword}) {
    emit(LoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: userEmail, password: userPassword)
        .then(
      (value) {
        emit(LoginSuccessState());
      },
    ).catchError((error) {
      emit(LoginFailureState(error: error.toString()));
    });
  }
}
