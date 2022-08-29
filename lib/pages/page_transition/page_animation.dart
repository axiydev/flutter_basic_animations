import 'package:flutter/material.dart';

class CustomPageRouteBuilder extends PageRouteBuilder {
  Widget? child;
  CustomPageRouteBuilder({this.child})
      : super(
            pageBuilder: (context, animation, secondaryAnimation) => child!,
            transitionDuration: const Duration(seconds: 1),
            transitionsBuilder: (context, animation, secondaryAnimation,
                    child) =>
                SlideTransition(
                  position:
                      Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
                          .animate(animation),
                  child: child,
                ));
}
