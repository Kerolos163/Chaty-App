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
