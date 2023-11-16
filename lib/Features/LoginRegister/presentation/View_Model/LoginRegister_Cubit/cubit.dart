import 'dart:developer';

import 'package:chatapp/Core/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  createUser({required String email, required String uID, String? image}) {
    emit(CreateUserLoadingState());

    UserModel model = UserModel(email: email, uID: uID, image: image);
    FirebaseFirestore.instance
        .collection("Users")
        .doc(uID)
        .set(model.toMap())
        .then((value) {
      log("Create User");
      emit(CreateUserSuccessState());
    }).catchError((error) {
      log(error.toString());
      emit(CreateUserFailureState(error: error.toString()));
    });
  }

  createAccount({required String userEmail, required String userPassword}) {
    emit(CreateAccountLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: userEmail, password: userPassword)
        .then(
      (value) {
        log(value.user!.uid);
        createUser(email: userEmail, uID: value.user!.uid);
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
