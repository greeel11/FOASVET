import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:foasvet/models/post.dart';
import 'package:foasvet/screens/main/posts/list.dart';
import 'package:foasvet/services/posts.dart';

class Replies extends StatefulWidget {
  Replies({Key key}) : super(key: key);

  @override
  _RepliesState createState() => _RepliesState();
}

class _RepliesState extends State<Replies> {
  PostService _postService = PostService();
  String text = '';
  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    PostModel args = ModalRoute.of(context).settings.arguments;
    return FutureProvider.value(
        value: _postService.getReplies(args),
        child: Container(
          child: Scaffold(
            body: Container(
              child: Column(
                children: [
                  Expanded(child: ListPosts(args)),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Form(
                            child: TextFormField(
                          style: TextStyle(fontFamily: 'Poppins'),
                          controller: _textController,
                          onChanged: (val) {
                            setState(() {
                              text = val;
                            });
                          },
                        )),
                        SizedBox(
                          height: 10,
                        ),
                        FlatButton(
                            textColor: Colors.white,
                            color: Color.fromRGBO(4, 116, 132, 1),
                            onPressed: () async {
                              await _postService.reply(args, text);
                              _textController.text = '';
                              setState(() {
                                text = '';
                              });
                            },
                            child: Text("Reply"))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
