// 35.247.129.160/user/login => POST
// 35.247.129.160/user/register => POST

import 'package:flutter/material.dart';
import 'package:login/datasourse/network/user_network.dart';
import 'package:login/datasourse/repository/user_repository.dart';
import 'package:login/provider/user_provider.dart';
import 'package:login/ui/home/home_screen.dart';
import 'package:login/ui/login/login_screen.dart';
import 'package:login/ui/register/register_screen.dart';
import 'package:login/ui/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(SuperApp());
}

class SuperApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
          create: (_) => UserProvider(UserRepository(UserNetwork())),
        )
      ],
      child: MaterialApp(
        initialRoute: "/splash",
        routes: {
          "/splash": (context) => SplashScreen(),
          "/login": (context) => LoginScreen(),
          "/register": (context) => RegisterScreen(),
          "/home": (context) => HomeScreen(),
        },
      ),
    );
  }
}
