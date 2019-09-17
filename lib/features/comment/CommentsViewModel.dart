import 'package:flutter/material.dart';
import 'package:moviedb/features/comment/Comment.dart';
import 'package:moviedb/features/comment/CommentService.dart';
import 'package:moviedb/features/common/BaseModel.dart';

class CommentsViewModel extends BaseModel {
  CommentService _commentService;

  CommentsViewModel({@required CommentService commentService})
      : _commentService = commentService;

  List<Comment> comments;

  Future fetchComments(int postId) async {
    setBusy(true);
    comments = await _commentService.getCommentsForPost(postId);
    setBusy(false);
  }
}
