import 'package:chatapp/Features/Login_View/View_Model/Login_Cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(IniteLoginState());
  static LoginCubit get(context) => BlocProvider.of(context);
  bool isVisiable = false;
  changeVisiability() {
    isVisiable = !isVisiable;

    emit(ChangeVisibilityLoginState());
  }
}
