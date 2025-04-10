import 'package:bookenchange/UI/Login/Textfield.dart';
import 'package:bookenchange/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bookenchange/Logic/Navigation/navigation.dart';
import 'package:bookenchange/Logic/Navigation/transitions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  final String? title;
  Login({super.key, this.title});
  @override
  State<Login> createState() => _LoginState();
}


class _LoginState extends State<Login> {

  final username=TextEditingController();
  final password=TextEditingController();
  bool value=false;

  Future<void> recover() async {

  }

  Future<void> signin() async {
    final prefs=await SharedPreferences.getInstance();
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: username.text.trim(),
          password: password.text.trim()
      );
      prefs.setBool('remember_me', value);
      if(mounted)Navigator.pushReplacement(context,CustomPageRoute(destination:Navigation.home));
    } on FirebaseAuthException catch (e) {
      if(mounted) SnackBar(content: Text(S.of(context).sign_in_unsuccesful,style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white,)));
    }



  }
  Future<void> signup() async {
      final prefs=await SharedPreferences.getInstance();
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email:username.text.trim() , password: password.text.trim());
        prefs.setBool('remember_me', value);
        if(mounted)Navigator.pushReplacement(context, CustomPageRoute(destination: Navigation.home));
      } on FirebaseAuthException catch (e) {
         if (e.code == 'email-already-in-use') {
          if(mounted) SnackBar(content: Text(S.of(context).already_in_use,style: Theme.of(context).textTheme.bodyMedium?.copyWith(color:Colors.white,)));
        }
      }

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(backgroundColor: Theme.of(context).colorScheme.tertiary,
        body:Center(child: SizedBox(width:320,height: 400 ,child:DecoratedBox(decoration:BoxDecoration(
        color: Theme.of(context).colorScheme.secondary, borderRadius: BorderRadius.circular(10),),
        child:Column(mainAxisSize:MainAxisSize.min,children:[Padding(padding: EdgeInsets.all(10)),
          Center(child:Text(S.of(context).login,style:Theme.of(context).textTheme.titleLarge),),
          Padding(padding:EdgeInsets.all(5)),
          loginTextFields(controller:username ,hintText: S.of(context).email_hint, obscureText: false,),
          Padding(padding:EdgeInsets.all(5)),
          loginTextFields(controller:password,hintText:S.of(context).password_hint , obscureText: true),
          RadioListTile(title: Text(S.of(context).remember,style: Theme.of(context).textTheme.bodyMedium,),value: value, onChanged:
              (bool? newValue) {
          setState(() {
            value = !value;
          });
          },
          toggleable: true,
          groupValue: true,
          ),
          Padding(padding:EdgeInsets.only(left: 40,right: 40,top: 10) ,child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [ FilledButton(onPressed: signup, child:Text(S.of(context).sign_up,style:Theme.of(context).textTheme.bodyMedium),style: FilledButton.styleFrom(minimumSize: Size(100,50),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)) ,backgroundColor: Theme.of(context).indicatorColor),),
            FilledButton(onPressed: signin, child:Text(S.of(context).sign_in,style:Theme.of(context).textTheme.bodyMedium),style: FilledButton.styleFrom(minimumSize: Size(100,50),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)) ,backgroundColor: Theme.of(context).indicatorColor),)]
          ),),
          Align(alignment: Alignment.centerRight,child: TextButton(onPressed: recover, child:Text(S.of(context).forgot_password,style:Theme.of(context).textTheme.bodyMedium), ),),


        ],),),
    ),),);
  }

}
