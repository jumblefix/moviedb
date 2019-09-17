import 'package:flutter/material.dart';
import 'package:moviedb/constants/AppColors.dart';
import 'package:moviedb/constants/RoutePaths.dart';
import 'package:moviedb/features/auth/AuthViewModel.dart';
import 'package:moviedb/widgets/BaseWidget.dart';
import 'package:moviedb/widgets/login/LoginHeader.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<AuthViewModel>(
      model: AuthViewModel(authenticationService: Provider.of(context)),
      child: LoginHeader(controller: _controller),
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            child,
            model.busy
                ? CircularProgressIndicator()
                : FlatButton(
                    color: Colors.white,
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () async {
                      var loginSuccess = await model.login(_controller.text);
                      if (loginSuccess) {
                        Navigator.pushNamed(context, RoutePaths.Home);
                      }
                    },
                  )
          ],
        ),
      ),
    );
  }
}
