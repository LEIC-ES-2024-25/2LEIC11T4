import 'package:flutter/material.dart';
class loginTextFields extends StatelessWidget{
  final controller;
  final String hintText;
  final bool obscureText;
  const loginTextFields({super.key, this.controller, required this.hintText, required this.obscureText });

  @override
  Widget build(BuildContext context) {
    return Container(padding: const EdgeInsets.all(10), child:TextFormField(
      controller: controller,

      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:Theme.of(context).colorScheme.primary,),
        ),
        focusedBorder:OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)),
        fillColor: Theme.of(context).colorScheme.onPrimary,
        filled: true,
        hintText: hintText,
      ),
      obscureText: obscureText,
      autovalidateMode: AutovalidateMode.always,
    ),
    );
  }
}