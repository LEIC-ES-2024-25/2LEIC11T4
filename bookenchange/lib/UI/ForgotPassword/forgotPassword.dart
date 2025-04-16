import 'package:bookenchange/Logic/Authentication.dart';
import 'package:bookenchange/UI/Login/Textfield.dart';
import 'package:bookenchange/generated/l10n.dart';
import 'package:flutter/material.dart';

class forgotPassword extends StatelessWidget{
  const forgotPassword({super.key});
  @override
  Widget build(BuildContext context) {
    final Auth auth = Auth();
    final username = TextEditingController();
    return SafeArea(child: Scaffold(
    backgroundColor: Theme.of(context).colorScheme.tertiary,
    body: Center(
    child: SizedBox(
    width: 320,
    height: 200,
    child: DecoratedBox(
    decoration: BoxDecoration(
    color: Theme.of(context).colorScheme.secondary,
    borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      children: [
        loginTextFields(
          controller: username,
          label: S.of(context).email_hint,
          obscureText: false,
          hint: "johndoe@gmaiil.com",
        ),
        Padding(padding: EdgeInsets.only(top: 10),
          child: FilledButton(
            onPressed: ()=>auth.recover(context, username),
            style: FilledButton.styleFrom(
              minimumSize: Size(100, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Theme.of(context).indicatorColor,
            ),
            child: Text(
              S.of(context).send,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        )
      ],
    )

    ),
    ),
    ),
    ),
    );
  }
  

}