import 'package:flutter/material.dart';
import 'package:moviedb/features/auth/AuthenticationService.dart';
import 'package:moviedb/features/common/BaseModel.dart';

class AuthViewModel extends BaseModel {
  AuthenticationService _authenticationService;

  AuthViewModel({
    @required AuthenticationService authenticationService,
  }) : _authenticationService = authenticationService;

  Future<bool> login(String userIdText) async {
    setBusy(true);
    var userId = int.tryParse(userIdText);
    var success = await _authenticationService.login(userId);
    setBusy(false);
    return success;
  }
}
