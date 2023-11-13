import 'state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
}
