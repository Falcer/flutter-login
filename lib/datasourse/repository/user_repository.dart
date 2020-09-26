import 'package:login/data/network.dart';
import 'package:login/data/user.dart';
import 'package:login/datasourse/network/user_network.dart';

class UserRepository {
  static UserNetwork _userNetwork;
  static final UserRepository _singleton = UserRepository._internal();

  factory UserRepository(UserNetwork userNetwork) {
    _userNetwork = userNetwork;
    return _singleton;
  }

  UserRepository._internal();


  Future<Network> login(String username, String password) async {
    return _userNetwork.login(username, password);
  }
  Future<Network> register(User user) async {
    return _userNetwork.register(user);
  }
}

// UserRepository()

// new UserRepository()