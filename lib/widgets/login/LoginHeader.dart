import 'package:flutter/material.dart';
import 'package:moviedb/constants/TextStyles.dart';
import 'package:moviedb/utils/UiHelpers.dart';
import 'package:moviedb/widgets/login/LoginTextField.dart';

class LoginHeader extends StatelessWidget {
  final TextEditingController controller;
  final String validationMessage;

  LoginHeader({@required this.controller, this.validationMessage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Login', style: TextStyles.headerStyle),
        UIHelper.verticalSpaceMedium,
        Text('Enter a number between 1 - 10', style: TextStyles.subHeaderStyle),
        LoginTextField(controller),
        this.validationMessage != null
            ? Text(validationMessage, style: TextStyle(color: Colors.red))
            : Container()
      ],
    );
  }
}
