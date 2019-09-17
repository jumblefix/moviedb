import 'dart:async';
import 'package:flutter/material.dart';
import 'package:moviedb/features/user/User.dart';
import 'package:moviedb/features/user/UserService.dart';

class AuthenticationService {
  final UserService _userService;

  AuthenticationService({@required UserService userService})
      : _userService = userService;

  StreamController<User> _userController = StreamController<User>();

  Stream<User> get user => _userController.stream;

  Future<bool> login(int userId) async {
    var fetchedUser = await _userService.getUserProfile(userId);

    var hasUser = fetchedUser != null;
    if (hasUser) {
      _userController.add(fetchedUser);
    }

    return hasUser;
  }
}
