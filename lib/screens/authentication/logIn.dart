import 'package:flowers/screens/services/auth.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  final Function togglePages;
  LogIn({this.togglePages});

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            color: Colors.yellow,
          ),
          Container(
            padding: EdgeInsets.all(8),
            height: 200,
            width: MediaQuery.of(context).size.width,
            color: Colors.brown,
            child: Column(
              children: <Widget>[
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: TextField(
                    onChanged: (val) {
                      email = val;
                    },
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: TextField(
                    onChanged: (val) {
                      password = val;
                    },
                  ),
                ),
                SizedBox(height: 20),
                Center(
                    child: Container(
                  color: Colors.white,
                  child: FlatButton(
                    onPressed: () async {
                      await Authentication().logIn(email, password);
                    },
                    child: Text("Login"),
                  ),
                )),
              ],
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: GestureDetector(
                onTap: () {
                  widget.togglePages();
                },
                child: Text(
                  "Register",
                  style: TextStyle(color: Colors.black),
                )),
          )
        ],
      ),
    ));
  }
}
