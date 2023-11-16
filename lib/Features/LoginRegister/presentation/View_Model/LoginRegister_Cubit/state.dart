abstract class LoginRegisterState {}

class IniteLoginRegisterState extends LoginRegisterState {}

class ChangeVisibilityLoginRegisterState extends LoginRegisterState {}

class ChangeScreenState extends LoginRegisterState {}

class CreateAccountLoadingState extends LoginRegisterState {}

class CreateAccountSuccessState extends LoginRegisterState {}

class CreateAccountFailureState extends LoginRegisterState {
  final String error;

  CreateAccountFailureState({required this.error});
}

class CreateUserLoadingState extends LoginRegisterState {}

class CreateUserSuccessState extends LoginRegisterState {}

class CreateUserFailureState extends LoginRegisterState {
  final String error;

  CreateUserFailureState({required this.error});
}

class LoginLoadingState extends LoginRegisterState {}

class LoginSuccessState extends LoginRegisterState {}

class LoginFailureState extends LoginRegisterState {
  final String error;

  LoginFailureState({required this.error});
}
