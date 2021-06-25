import 'package:flutter/material.dart';
import 'package:foasvet/models/post.dart';
import 'package:foasvet/models/user.dart';
import 'package:foasvet/services/posts.dart';

class ItemPost extends StatefulWidget {
  final PostModel post;
  final AsyncSnapshot<UserModel> snapshotUser;
  final AsyncSnapshot<bool> snapshotLike;
  final AsyncSnapshot<bool> snapshotrepost;
  final bool repost;

  ItemPost(this.post, this.snapshotUser, this.snapshotLike, this.snapshotrepost,
      this.repost,
      {Key key})
      : super(key: key);

  @override
  _ItemPostState createState() => _ItemPostState();
}

class _ItemPostState extends State<ItemPost> {
  PostService _postService = PostService();
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
          padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.snapshotrepost.data || widget.repost) Text("repost"),
              SizedBox(height: 20),
              Row(
                children: [
                  widget.snapshotUser.data.profileImageUrl != ''
                      ? CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                              widget.snapshotUser.data.profileImageUrl))
                      : Icon(Icons.person, size: 40),
                  SizedBox(width: 10),
                  Text(widget.snapshotUser.data.name)
                ],
              ),
            ],
          )),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.post.text),
                SizedBox(height: 20),
                Text(widget.post.timestamp.toDate().toString()),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            icon: new Icon(Icons.chat_bubble_outline,
                                color: Color.fromRGBO(4, 116, 132, 1),
                                size: 30.0),
                            onPressed: () => Navigator.pushNamed(
                                context, '/replies',
                                arguments: widget.post)),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                            icon: new Icon(
                                widget.snapshotrepost.data
                                    ? Icons.cancel
                                    : Icons.repeat,
                                color: Color.fromRGBO(4, 116, 132, 1),
                                size: 30.0),
                            onPressed: () => _postService.repost(
                                widget.post, widget.snapshotrepost.data)),
                        Text(widget.post.repostsCount.toString())
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                            icon: new Icon(
                                widget.snapshotLike.data
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Color.fromRGBO(4, 116, 132, 1),
                                size: 30.0),
                            onPressed: () {
                              _postService.likePost(
                                  widget.post, widget.snapshotLike.data);
                            }),
                        Text(widget.post.likesCount.toString())
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
