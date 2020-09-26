import 'package:flutter/material.dart';
import 'package:login/data/network.dart';
import 'package:login/data/user.dart';
import 'package:login/datasourse/repository/user_repository.dart';

class UserProvider with ChangeNotifier {
  UserRepository _userRepository;

  UserProvider(UserRepository userRepository) {
    this._userRepository = userRepository;
  }

  Future<Network> login(String username, String password) async {
    return this._userRepository.login(username, password);
  }

  Future<Network> register(User user) async {
    return this._userRepository.register(user);
  }
}