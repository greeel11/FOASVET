import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:foasvet/models/user.dart';
import 'package:foasvet/screens/auth/signup.dart';
import 'package:foasvet/screens/main/home.dart';
import 'package:foasvet/screens/main/posts/add.dart';
import 'package:foasvet/screens/main/posts/replies.dart';
import 'package:foasvet/screens/main/profile/edit.dart';
import 'package:foasvet/screens/main/profile/profile.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);

    print(user);
    if (user == null) {
      //show auth system routes
      return SignUp();
    }

    //show main system routes
    return MaterialApp(initialRoute: '/', routes: {
      '/': (context) => Home(),
      '/add': (context) => Add(),
      '/profile': (context) => Profile(),
      '/edit': (context) => Edit(),
      '/replies': (context) => Replies()
    });
  }
}
