import 'package:flutter/material.dart';

class PageSlide extends PageRouteBuilder {
  final dynamic page;
  PageSlide(this.page)
      : super(
          pageBuilder: (context, animation, secondAnimation) => page,
          transitionsBuilder: (context, animation, secondAnimation, child) {
            var tween =
                Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero);
            var offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );
}
