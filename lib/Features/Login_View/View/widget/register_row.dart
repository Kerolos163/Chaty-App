import '../../../../Core/utils/color_manager.dart';
import 'package:flutter/material.dart';

class RegistarRow extends StatelessWidget {
  const RegistarRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't Have Account ? "),
        Text(
          "Registar",
          style: TextStyle(color: ColorManager.second),
        ),
      ],
    );
  }
}
