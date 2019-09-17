import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moviedb/constants/AppConstants.dart';
import 'package:moviedb/features/post/Post.dart';

class PostService {
  var client = new http.Client();
  var endpoint = AppConstants.endpoint;

  Future<List<Post>> getPostsForUser(int userId) async {
    var posts = List<Post>();

    var response = await client.get('$endpoint/posts?userId=$userId');

    var parsed = json.decode(response.body) as List<dynamic>;

    for (var post in parsed) {
      posts.add(Post.fromJson(post));
    }

    return posts;
  }
}
