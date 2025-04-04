import 'package:flutter/cupertino.dart';

import 'navigation.dart';

class CustomPageRoute extends PageRouteBuilder {
  final Navigation destination;

  CustomPageRoute({required this.destination})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) =>
        destination.get(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      Animation<double> fadeTransition = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: animation, curve: Curves.easeInOut),
      );

      return FadeTransition(
        opacity: fadeTransition,
        child: child, 
      );
    },
  );
}