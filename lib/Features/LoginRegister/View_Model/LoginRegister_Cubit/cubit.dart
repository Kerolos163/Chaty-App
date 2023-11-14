import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'state.dart';

class LoginRegisterCubit extends Cubit<LoginRegisterState> {
  LoginRegisterCubit() : super(IniteLoginRegisterState());
  static LoginRegisterCubit get(context) => BlocProvider.of(context);
  bool isVisiable = false;
  changeVisiability() {
    isVisiable = !isVisiable;

    emit(ChangeVisibilityLoginRegisterState());
  }

  bool isLogin = true;
  changeScreen() {
    isLogin = !isLogin;
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
        emit(CreateAccountSuccessState());
      },
    ).catchError((error) {
      log(error.toString());
      emit(CreateAccountFailureState(error: error.toString()));
    });
  }
}
