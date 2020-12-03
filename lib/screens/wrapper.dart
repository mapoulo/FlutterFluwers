import 'package:flowers/models/user.dart';
import 'package:flowers/screens/authentication/authenticateUser.dart';
import 'package:flowers/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<User>(context);
            if(user != null){
              return Home();
            }else{
             return AuthenticateUser();
            }

  }
}