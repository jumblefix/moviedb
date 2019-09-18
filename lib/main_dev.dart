import 'package:flutter/material.dart';
import 'package:moviedb/MovieDBApp.dart';
import 'package:moviedb/constants/AppConstants.dart';
import 'package:moviedb/flavors/FlavorConfig.dart';
import 'package:moviedb/utils/SystemChromeSettings.dart';

void main() {
  setSystemSetting();

  FlavorConfig(
    flavor: Flavor.DEV,
    color: Colors.deepPurpleAccent,
    values: FlavorValues(baseUrl: AppConstants.endpoint),
  );

  runApp(MovieDBApp());
}
