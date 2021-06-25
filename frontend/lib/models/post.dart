import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String id;
  final String creator;
  final String text;
  final Timestamp timestamp;
  final String originalId;
  final bool repost;
  DocumentReference ref;

  int likesCount;
  int repostsCount;

  PostModel(
      {this.id,
      this.creator,
      this.text,
      this.timestamp,
      this.likesCount,
      this.repostsCount,
      this.originalId,
      this.repost,
      this.ref});
}
