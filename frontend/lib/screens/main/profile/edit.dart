import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:foasvet/services/user.dart';

class Edit extends StatefulWidget {
  Edit({Key key}) : super(key: key);

  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  UserService _userService = UserService();
  File _profileImage;
  File _bannerImage;
  final picker = ImagePicker();
  String name = '';

  Future getImage(int type) async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null && type == 0) {
        _profileImage = File(pickedFile.path);
      }
      if (pickedFile != null && type == 1) {
        _bannerImage = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(4, 116, 132, 1),
        actions: [
          FlatButton(
              onPressed: () async {
                await _userService.updateProfile(
                    _bannerImage, _profileImage, name);
                Navigator.pop(context);
              },
              child: Text('Save',
                  style: TextStyle(
                    color: Colors.white,
                  )))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: new Form(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () => getImage(0),
                  child: _profileImage == null
                      ? Icon(Icons.person)
                      : Image.file(
                          _profileImage,
                          height: 100,
                        ),
                ),
                Text('Change your profile picture'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () => getImage(1),
                  child: _bannerImage == null
                      ? Icon(Icons.image)
                      : Image.file(
                          _bannerImage,
                          height: 100,
                        ),
                ),
                Text('Change your banner image'),
              ],
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Change your username"),
              onChanged: (val) => setState(() {
                name = val;
              }),
            )
          ],
        )),
      ),
    );
  }
}
