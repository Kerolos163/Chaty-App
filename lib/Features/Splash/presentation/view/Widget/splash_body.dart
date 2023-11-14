import '../../../../../Core/constant.dart';
import '../../../../../Core/transition/page_slide_transition.dart';
import '../../../../../Core/utils/color_manager.dart';
import '../../../../LoginRegister/View/login_register_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationcontroller;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    initSlidingAnimation();
    navToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: slidingText());
  }

  void navToHome() {
    Future.delayed(const Duration(seconds: 4)).then((value) {
      Navigator.of(context).pushReplacement(PageSlide(const LoginView()));
    });
  }

  void initSlidingAnimation() {
    animationcontroller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 5), end: Offset.zero).animate(
            CurvedAnimation(
                parent: animationcontroller, curve: Curves.bounceInOut));
    animationcontroller.forward();
  }

  AnimatedBuilder slidingText() {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, _) {
        return SlideTransition(
          position: slidingAnimation,
          child: Text(
            "Chaty",
            style: GoogleFonts.birthstone(
              fontSize: MyDevice.getWidth(context) / 3.5,
              color: ColorManager.primaryFont,
            ),
          ),
        );
      },
    );
  }
}
