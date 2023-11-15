import 'package:flutter/material.dart';

import '../../../../../Core/utils/color_manager.dart';
import '../../View_Model/LoginRegister_Cubit/cubit.dart';

class RegistarRow extends StatelessWidget {
  const RegistarRow({super.key, required this.logIn});
  final bool logIn;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          logIn ? "Don't Have Account ?" : "Have Account ?",
          style: TextStyle(color: ColorManager.primaryFont),
        ),
        TextButton(
          
          onPressed: () {
            LoginRegisterCubit.get(context).changeScreen();
          },
          child: Text(
            logIn ? "Registar" : "Log In",
            style: TextStyle(
              color: ColorManager.second,
            ),
          ),
        )
      ],
    );
  }
}
