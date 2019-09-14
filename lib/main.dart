import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moviedb/constants/AppConstants.dart';
import 'package:moviedb/screens/HomePage.dart';
import 'package:moviedb/utils/theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  runApp(MovieApp());
}

class MovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.app_name,
      theme: appTheme,
      home: HomePage(),
    );
  }
}
