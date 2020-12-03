import 'package:flowers/screens/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function togglePages;
  Register({this.togglePages});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

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
                      await Authentication().register(email, password);
                    },
                    child: Text("Register"),
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
                  "Login",
                  style: TextStyle(color: Colors.black),
                )),
          )
        ],
      ),
    ));
  }
}
