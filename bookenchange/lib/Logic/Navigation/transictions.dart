import 'package:flutter/material.dart';

class customPageRoute extends PageRouteBuilder{
  final Widget child,
  customPageRoute ({required this.child ,}):
  super(pageBuilder: (context,animation,secondaryAnimation)=> child);

@override
Widget buildTransitions(BuildContext context,Animation<double> animatition,Animation<double> secondaryAnimation,Widget child)=>
ScaleTransition(scale: scale,child: child,);

}