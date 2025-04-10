import 'package:bookenchange/UI/Login/Textfield.dart';
import 'package:bookenchange/generated/l10n.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final String? title;
  Login({super.key, this.title});

  final username=TextEditingController();
  final password=TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(backgroundColor: Theme.of(context).colorScheme.tertiary,
        body:Center(child: SizedBox(width:320,height: 370 ,child:DecoratedBox(decoration:BoxDecoration(
        color: Theme.of(context).colorScheme.secondary, borderRadius: BorderRadius.circular(10),),
        child:Column(children:[Center(child:Text(S.of(context).login,style:Theme.of(context).textTheme.titleLarge),),
          SizedBox(height: 20,),
          loginTextFields(controller:username ,hintText: S.of(context).email_hint, obscureText: false,),
          SizedBox(height: 20,),
          loginTextFields(controller:password,hintText:S.of(context).password_hint , obscureText: true),





        ],
        mainAxisSize:MainAxisSize.min,),),
    ),),);
  }
}
