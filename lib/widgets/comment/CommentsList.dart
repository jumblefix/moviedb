import 'package:flutter/material.dart';
import 'package:moviedb/features/comment/CommentsViewModel.dart';
import 'package:moviedb/widgets/BaseWidget.dart';
import 'package:moviedb/widgets/comment/CommentItem.dart';
import 'package:provider/provider.dart';

class CommentsList extends StatelessWidget {
  final int postId;
  CommentsList(this.postId);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<CommentsViewModel>(
      onModelReady: (model) => model.fetchComments(postId),
      model: CommentsViewModel(commentService: Provider.of(context)),
      builder: (context, model, child) => model.busy
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Expanded(
              child: ListView.builder(
                itemCount: model.comments.length,
                itemBuilder: (context, index) =>
                    CommentItem(model.comments[index]),
              ),
            ),
    );
  }
}
