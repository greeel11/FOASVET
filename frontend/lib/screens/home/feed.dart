import 'package:flutter/material.dart';
import 'package:foasvet/models/post.dart';
import 'package:provider/provider.dart';
import 'package:foasvet/screens/main/posts/list.dart';
import 'package:foasvet/services/posts.dart';

class Feed extends StatefulWidget {
  Feed({Key key}) : super(key: key);

  @override
  FeedState createState() => FeedState();
}

class FeedState extends State<Feed> {
  PostService _postService = PostService();
  @override
  Widget build(BuildContext context) {
    return FutureProvider.value(
      value: _postService.getFeed(),
      child: Scaffold(body: ListPosts(null)),
    );
  }
}
