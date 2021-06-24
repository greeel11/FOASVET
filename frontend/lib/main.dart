import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:foasvet/models/user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:foasvet/screens/wrapper.dart';
import 'package:foasvet/services/auth.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root foasvet application.
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          //return SomethingWentWrong();
        }

        // Once complete, show application
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamProvider<UserModel>.value(
            value: AuthService().user,
            child:
                MaterialApp(debugShowCheckedModeBanner: false, home: Wrapper()),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Text("Loading");
      },
    );
  }
}
