import 'package:flutter/material.dart';

class Login1 extends StatefulWidget {
  const Login1({super.key});

  @override
  State<Login1> createState() => _LoginState();
}

var account = [
  {'username': 'admin', 'password': '1234', 'role': 'admin'},
  {'username': '', 'password': '', 'role': ''}
];
check(String username, String password) {
  for (int i = 0; i < account.length; i++) {
    if (username == account[i]['username'] &&
        password == account[i]['password']) {
      return 'Wolcome ${account[i]['role']} ';
    } else if (username == '' && password == '') {
      return '';
    } else {
      return 'Wrong Username and Password ';
    }
  }
}

class _LoginState extends State<Login1> {
  bool _obscureText = true;
  String username = '';
  String password = '';
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextField(
                  controller: user,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(90.0),
                      ),
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Username',
                      hintText: 'Username'),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  obscureText: _obscureText, //hint text
                  controller: pass,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                    labelText: 'Password',
                    hintText: 'Password',
                    filled: true,
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(_obscureText
                            ? Icons.visibility
                            : Icons.visibility_off) //hint text
                        ),
                  ),
                ),
              ),
            ),
            Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    maximumSize: const Size.fromHeight(50),
                    textStyle: TextStyle(fontSize: 20)),
                onPressed: () {
                  setState(() {
                    username = user.text;
                    password = pass.text;
                  });
                },
                child: const Text('Login'),
              ),
            ),
            Center(child: Container(child: Text(check(username, password)))),
          ],
        ),
      ),
    );
  }
}
