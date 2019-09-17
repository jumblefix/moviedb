import 'package:flutter/material.dart';
import 'package:moviedb/constants/RoutePaths.dart';
import 'package:moviedb/features/post/Post.dart';
import 'package:moviedb/views/HomeView.dart';
import 'package:moviedb/views/LoginView.dart';
import 'package:moviedb/views/PostView.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Home:
        return MaterialPageRoute(builder: (_) => HomeView());
      case RoutePaths.Login:
        return MaterialPageRoute(builder: (_) => LoginView());
      case RoutePaths.Post:
        var post = settings.arguments as Post;
        return MaterialPageRoute(builder: (_) => PostView(post: post));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
