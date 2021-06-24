import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foasvet/screens/home/feed.dart';
import 'package:foasvet/screens/home/search.dart';
import 'package:foasvet/services/auth.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _authService = AuthService();
  int _currentIndex = 0;
  final List<Widget> _children = [Feed(), Search()];

  void onTabPressed(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Color.fromRGBO(4, 116, 132, 1),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromRGBO(4, 116, 132, 1),
          onPressed: () {
            Navigator.pushNamed(context, '/add');
          },
          child: Icon(Icons.create)),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: Text(
                  "FOASVET",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color.fromRGBO(254, 219, 118, 1)),
                ),
              ),
              decoration: BoxDecoration(color: Color.fromRGBO(4, 116, 132, 1)),
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                Navigator.pushNamed(context, '/profile',
                    arguments: FirebaseAuth.instance.currentUser.uid);
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () async {
                _authService.signOut();
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(4, 116, 132, 1),
        onTap: onTabPressed,
        selectedItemColor: Color.fromRGBO(254, 219, 118, 1),
        unselectedItemColor: Color.fromRGBO(255, 255, 255, 0.7),
        currentIndex: _currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: new Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: new Icon(Icons.search), label: 'search')
        ],
      ),
      body: _children[_currentIndex],
    );
  }
}
