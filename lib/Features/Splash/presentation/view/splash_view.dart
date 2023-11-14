import 'package:flutter/material.dart';

import '../../../../Core/utils/color_manager.dart';
import 'Widget/splash_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorManager.primary,
      body: const SplashBody(),
    );
  }
}