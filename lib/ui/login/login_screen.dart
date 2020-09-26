import 'package:flutter/material.dart';
import 'package:login/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Username
// Password

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController =
      TextEditingController(); // Get Value of Username TextField
  final passwordController =
      TextEditingController(); // Get Value of Password TextField
  bool _isLoading = false;


  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Username",
                  hintText: "falcerdev",
                ),
              ),
              SizedBox(
                height: 16,
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                  hintText: "********",
                ),
              ),
              SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () async {
                  setState(() {
                    _isLoading = true;
                  });
                  userProvider
                      .login(usernameController.text, passwordController.text)
                      .then((value) async => {
                            if (value.success)
                              {
                                SharedPreferences.getInstance().then((prefs) => {
                                  prefs.setString(
                                    'token', value.data.toString())
                                }),
                                Navigator.pushReplacementNamed(
                                    context, "/home"),
                              }
                            else
                              {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext ctx) {
                                    return AlertDialog(
                                      title: Text("Login Failed"),
                                      content: Text(value.message),
                                      actions: [
                                        FlatButton(
                                          onPressed: () {
                                            Navigator.pop(ctx);
                                          },
                                          child: Text("Ok"),
                                        )
                                      ],
                                    );
                                  },
                                )
                              }
                          })
                      .whenComplete(() => {
                            this.setState(() {
                              this._isLoading = !this._isLoading;
                            })
                          });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 24,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: !this._isLoading
                        ? Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        : Container(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            )),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text("or"),
              SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/register");
                },
                child: Container(
                  child: Center(
                    child: Text(
                      "Sign up",
                      style: TextStyle(color: Colors.blue.withAlpha(90)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
