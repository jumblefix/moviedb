import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moviedb/constants/AppConstants.dart';
import 'package:moviedb/features/user/User.dart';

class UserService {
  var client = new http.Client();
  var endpoint = AppConstants.endpoint;

  Future<User> getUserProfile(int userId) async {
    var response = await client.get('$endpoint/users/$userId');

    return User.fromJson(json.decode(response.body));
  }
}
