import 'package:flutter/material.dart';
import 'package:moviedb/constants/AppColors.dart';
import 'package:moviedb/constants/TextStyles.dart';
import 'package:moviedb/features/user/User.dart';
import 'package:moviedb/utils/UiHelpers.dart';
import 'package:moviedb/widgets/post/PostsList.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          UIHelper.verticalSpaceLarge,
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Welcome ${Provider.of<User>(context).name}',
              style: TextStyles.headerStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text('Here are all your posts',
                style: TextStyles.subHeaderStyle),
          ),
          UIHelper.verticalSpaceSmall,
          Expanded(
            child: PostsList(),
          )
        ],
      ),
    );
  }
}
