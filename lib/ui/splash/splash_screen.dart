import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 1500), () async {
      await SharedPreferences.getInstance().then((value) => {
        if(value.getString('token') != null && value.getString('token').isNotEmpty) {
          Navigator.pushReplacementNamed(context, "/home")
        } else {
          Navigator.pushReplacementNamed(context, "/login")
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("Splash Screen"),
        ),
      ),
    );
  }
}
