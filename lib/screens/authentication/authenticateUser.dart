import 'package:flowers/screens/authentication/logIn.dart';
import 'package:flowers/screens/authentication/register.dart';
import 'package:flutter/material.dart';

class AuthenticateUser extends StatefulWidget {
  @override
  _AuthenticateUserState createState() => _AuthenticateUserState();
}

class _AuthenticateUserState extends State<AuthenticateUser> {
  @override
  Widget build(BuildContext context) {
    bool showLogInPage = true;

    void toggle() {
      setState(() {
        showLogInPage = !showLogInPage;
        print("Method is called");
      });
    }

    if (showLogInPage) {
      return LogIn(togglePages: toggle);
    } else {
      return Register(togglePages: toggle);
    }
  }
}
