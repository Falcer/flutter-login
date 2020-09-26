import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login/data/network.dart';
import 'package:login/data/user.dart';
import 'package:login/utils/constants.dart';

class UserNetwork {
  static final UserNetwork _singleton = UserNetwork._internal();

  factory UserNetwork() {
    return _singleton;
  }

  UserNetwork._internal();

  Future<Network> login(String username, String password) async {
    var result = await http.post("$API_URL/user/login",
        body: {'username': username, 'password': password}); // String Templating
    return Network.fromJson(jsonDecode(result.body));
  }

  Future<Network> register(User user) async {
    var result = await http.post("$API_URL/user/login",
        body: {'username': user.username, 'password': user.password, 'fullname': user.fullname}); // String Templating
    return Network.fromJson(jsonDecode(result.body));
  }
}
