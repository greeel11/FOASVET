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
            backgroundColor: Color.fromRGBO(4, 116, 132, 1),
            elevation: 8,
            title: Text(
              "FOASVET",
              style: TextStyle(fontFamily: 'Poppins'),
            )),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: new Form(
              child: Column(
            children: [
              TextFormField(
                style: TextStyle(fontFamily: 'Poppins'),
                decoration: InputDecoration(hintText: "Type your email"),
                onChanged: (val) => setState(() {
                  email = val;
                }),
              ),
              TextFormField(
                style: TextStyle(fontFamily: 'Poppins'),
                decoration: InputDecoration(hintText: "Type your password"),
                obscureText: true,
                onChanged: (val) => setState(() {
                  password = val;
                }),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: Column(
                  children: [
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color.fromRGBO(4, 116, 132, 1),
                          side: BorderSide(
                              color: Color.fromRGBO(4, 116, 132, 1), width: 2),
                        ),
                        child: Text('Log In'),
                        onPressed: () async =>
                            {_authService.signIn(email, password)}),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          primary: Color.fromRGBO(4, 116, 132, 1),
                          backgroundColor: Colors.white,
                          side: BorderSide(
                              color: Color.fromRGBO(4, 116, 132, 1), width: 2),
                        ),
                        child: Text('Sign Up'),
                        onPressed: () async =>
                            {_authService.signUp(email, password)}),
                  ],
                ),
              ),
            ],
          )),
        ));
  }
}
