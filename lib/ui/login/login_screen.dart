import 'package:flutter/material.dart';

// Username
// Password

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final usernameController = TextEditingController(); // Get Value of Username TextField
  final passwordController = TextEditingController(); // Get Value of Password TextField

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("Login Screen"),
        ),
      ),
    );
  }
}
