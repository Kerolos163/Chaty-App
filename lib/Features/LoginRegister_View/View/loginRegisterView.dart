import 'package:chatapp/Features/LoginRegister_View/View_Model/LoginRegister_Cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widget/login_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginRegisterCubit(),
      child: const Scaffold(
        body: LoginRegisterBody(),
      ),
    );
  }
}
