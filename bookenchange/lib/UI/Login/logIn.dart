import 'package:bookenchange/Logic/Navigation/transitions.dart';
import 'package:bookenchange/UI/Login/Textfield.dart';
import 'package:bookenchange/generated/l10n.dart';
import 'package:bookenchange/Logic/Authentication.dart';
import 'package:flutter/material.dart';
import 'package:bookenchange/Logic/Navigation/navigation.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final username = TextEditingController();
  final password = TextEditingController();
  bool value = false;
  final Auth auth = Auth();

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        body: Center(
          child: SizedBox(
            width: 320,
            height: 420,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(padding: EdgeInsets.all(10)),
                  Center(
                    child: Text(
                      S.of(context).login,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  loginTextFields(
                    controller: username,
                    label: S.of(context).email_hint,
                    obscureText: false,
                    hint: "johndoe@gmaiil.com",
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  loginTextFields(
                    controller: password,
                    label: S.of(context).password_hint,
                    obscureText: true,
                  ),
                  RadioListTile(
                    title: Text(
                      S.of(context).remember,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    value: value,
                    onChanged: (bool? newValue) {
                      setState(() {
                        value = !value;
                      });
                    },
                    toggleable: true,
                    groupValue: true,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40, right: 40, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FilledButton(
                          onPressed:
                              () => auth.signup(
                                context,
                                username,
                                password,
                                value,
                              ),
                          style: FilledButton.styleFrom(
                            minimumSize: Size(100, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: Theme.of(context).indicatorColor,
                          ),
                          child: Text(
                            S.of(context).sign_up,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        FilledButton(
                          onPressed:
                              () => auth.signin(
                                context,
                                username,
                                password,
                                value,
                              ),
                          style: FilledButton.styleFrom(
                            minimumSize: Size(100, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: Theme.of(context).indicatorColor,
                          ),
                          child: Text(
                            S.of(context).sign_in,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed:
                          () => Navigator.push(
                            context,
                            CustomPageRoute(destination: Navigation.forgotPass),
                          ),
                      child: Text(
                        S.of(context).forgot_password,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }
}
