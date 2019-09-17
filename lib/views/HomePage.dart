import 'package:flutter/material.dart';
import 'package:moviedb/constants/AppConstants.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstants.app_name),
      ),
      body: Center(
        child: Text(AppConstants.app_name),
      ),
    );
  }
}
