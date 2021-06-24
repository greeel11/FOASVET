import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foasvet/services/auth.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _authService = AuthService();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromRGBO(254, 219, 118, 1),
            // elevation: 8,
            title: Text("Sign Up")),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: new Form(
              child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: "Type your email"),
                onChanged: (val) => setState(() {
                  email = val;
                }),
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Type password"),
                obscureText: true,
                onChanged: (val) => setState(() {
                  password = val;
                }),
              ),
              RaisedButton(
                  child: Text('Signup'),
                  onPressed: () async =>
                      {_authService.signUp(email, password)}),
              RaisedButton(
                  child: Text('Signin'),
                  onPressed: () async =>
                      {_authService.signIn(email, password)}),
            ],
          )),
        ));
  }
}
