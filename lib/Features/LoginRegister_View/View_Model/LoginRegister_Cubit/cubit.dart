import 'package:chatapp/Features/LoginRegister_View/View_Model/LoginRegister_Cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(IniteLoginState());
  static LoginCubit get(context) => BlocProvider.of(context);
  bool isVisiable = false;
  changeVisiability() {
    isVisiable = !isVisiable;

    emit(ChangeVisibilityLoginState());
  }

  bool isLogin = true;
  changeScreen() {
    isLogin = !isLogin;
    emit(ChangeScreenState());
  }
}
