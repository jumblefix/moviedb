import 'package:flutter/material.dart';
import 'package:moviedb/constants/RoutePaths.dart';
import 'package:moviedb/flavors/FlavorBanner.dart';
import 'package:moviedb/provider_setup.dart';
import 'package:moviedb/router.dart';
import 'package:provider/provider.dart';

class MovieDBApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlavorBanner(
      child: MultiProvider(
        providers: providers,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.yellow,
          ),
          initialRoute: RoutePaths.Login,
          onGenerateRoute: Router.generateRoute,
        ),
      ),
    );
  }
}
