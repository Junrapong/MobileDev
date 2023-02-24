import 'dart:html';

import 'package:flutter/material.dart';
import 'package:myapp/Lab4/welcome.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

var account = [
  {'username': 'James', 'password': 'a1b1'},
  {'username': 'Lara', 'password': 'a2b2'},
  {'username': '', 'password': ''}
];
bool check_ = false;
String check(String username, String password) {
  for (int i = 0; i < account.length; i++) {
    if (username == account[i]['username'] &&
        password == account[i]['password']) {
      check_ = true;
      return 'Welcome ${account[i]['username']}';
    } else if (username == '' && password == '') {
      check_ = false;
      return '';
    }
  }
  check_ = false;
  return 'Wrong Username and Password';
}

class _LoginState extends State<Login> {
  String username = '';
  String password = '';
  String output = '';
  bool _obscureText = true;
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Container(
                child: TextField(
                  controller: user,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    hintText: 'Username',
                    prefixIcon: Icon(Icons.face),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Container(
                child: TextField(
                  obscureText: _obscureText, //hint text
                  controller: pass,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Password',
                    prefixIcon: const Icon(Icons.password),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Icon(_obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Container(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      maximumSize: Size(100, 50),
                      textStyle: TextStyle(fontSize: 20),
                      fixedSize: Size(100, 50),
                      shape: StadiumBorder(),
                    ),
                    onPressed: () {
                      if (user.text.isNotEmpty && pass.text.isNotEmpty) {
                        setState(() {
                          username = user.text;
                          password = pass.text;
                          output = check(username, password);
                        });
                      }
                      if (check_ == true) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const Welcome()),
                                settings: RouteSettings(arguments: output)));
                      }
                      user.clear();
                      pass.clear();
                    },
                    child: const Text('Login')),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  check(username, password),
                  style: TextStyle(color: Colors.red),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
