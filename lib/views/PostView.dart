import 'package:flutter/material.dart';
import 'package:moviedb/constants/AppColors.dart';
import 'package:moviedb/constants/TextStyles.dart';
import 'package:moviedb/features/post/Post.dart';
import 'package:moviedb/features/user/User.dart';
import 'package:moviedb/utils/UiHelpers.dart';
import 'package:moviedb/widgets/comment/CommentsList.dart';
import 'package:provider/provider.dart';

class PostView extends StatelessWidget {
  final Post post;
  const PostView({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            UIHelper.verticalSpaceLarge,
            Text(post.title, style: TextStyles.headerStyle),
            Text(
              'by ${Provider.of<User>(context).name}',
              style: TextStyle(fontSize: 9.0),
            ),
            UIHelper.verticalSpaceMedium,
            Text(post.body),
            CommentsList(post.id)
          ],
        ),
      ),
    );
  }
}
