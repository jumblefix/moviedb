import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moviedb/constants/AppConstants.dart';
import 'package:moviedb/features/comment/Comment.dart';

class CommentService {
  var client = new http.Client();
  var endpoint = AppConstants.endpoint;

  Future<List<Comment>> getCommentsForPost(int postId) async {
    var comments = List<Comment>();

    var response = await client.get('$endpoint/comments?postId=$postId');

    var parsed = json.decode(response.body) as List<dynamic>;

    for (var comment in parsed) {
      comments.add(Comment.fromJson(comment));
    }

    return comments;
  }
}
