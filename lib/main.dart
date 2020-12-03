import 'package:flowers/models/user.dart';
import 'package:flowers/screens/services/auth.dart';
import 'package:flowers/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: Authentication().userStream,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper()
      ),
      );
  }
}


