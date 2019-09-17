import 'package:flutter/foundation.dart';
import 'package:moviedb/features/common/BaseModel.dart';
import 'package:moviedb/features/post/Post.dart';
import 'package:moviedb/features/post/PostService.dart';

class PostViewModel extends BaseModel {
  PostService _postService;

  PostViewModel({@required PostService postService})
      : _postService = postService;

  List<Post> posts;

  Future getPosts(int userId) async {
    setBusy(true);
    posts = await _postService.getPostsForUser(userId);
    setBusy(false);
  }
}
