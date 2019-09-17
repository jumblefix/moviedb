import 'package:flutter/material.dart';
import 'package:moviedb/constants/RoutePaths.dart';
import 'package:moviedb/features/post/PostViewModel.dart';
import 'package:moviedb/features/user/User.dart';
import 'package:moviedb/widgets/BaseWidget.dart';
import 'package:moviedb/widgets/post/PostListItem.dart';
import 'package:provider/provider.dart';

class PostsList extends StatelessWidget {
  const PostsList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<PostViewModel>(
      model: PostViewModel(postService: Provider.of(context)),
      onModelReady: (model) => model.getPosts(Provider.of<User>(context).id),
      builder: (context, model, child) => model.busy
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: model.posts.length,
              itemBuilder: (context, index) => PostListItem(
                post: model.posts[index],
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RoutePaths.Post,
                    arguments: model.posts[index],
                  );
                },
              ),
            ),
    );
  }
}
