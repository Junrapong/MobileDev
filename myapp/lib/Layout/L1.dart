import 'package:flutter/material.dart';
import 'package:myapp/Layout/L2.dart';

class Login_ extends StatefulWidget {
  const Login_({super.key});

  @override
  State<Login_> createState() => _LoginState();
}

bool c = false;
var account = [
  {'username': 'James', 'password': 'a1b1'},
  {'username': 'Lara', 'password': 'a2b2'},
  {'username': '', 'password': ''},
];

String check(String username, String password) {
  for (int i = 0; i < account.length; i++) {
    if (username == account[i]['username'] &&
        password == account[i]['password']) {
      c = true;
      return 'Welcome ${account[i]['username']}';
    } else if (username == '' && password == '') {
      c = false;
      return '';
    }
  }
  c = false;
  return 'Wrong Username and Password';
}

class _LoginState extends State<Login_> {
  String username = '';
  String password = '';
  String output = '';
  bool _obscureText = true;
  // bool c = false;
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
                      borderRadius: BorderRadius.circular(90.0),
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
                    // filled: true,
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
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90.0),
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
                    maximumSize: const Size(100, 50),
                    textStyle: TextStyle(fontSize: 20),
                    fixedSize: Size(100, 50),
                    shape: StadiumBorder(),
                    // side: BorderSide(color: Colors.red),
                  ),
                  onPressed: () {
                    if (user.text.isNotEmpty && pass.text.isNotEmpty) {
                      setState(() {
                        username = user.text;
                        password = pass.text;
                        output = check(username, password);
                      });
                    }
                    if (c == true) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const Welcome_()),
                              settings: RouteSettings(arguments: output)));
                      // output = '';
                    }

                    user.clear();
                    pass.clear();
                  },
                  child: const Text('Login'),
                ),
              ),
            ),
            Container(
              child: Text(
                check(username, password),
                style: TextStyle(color: Colors.red),
              ),
            )
          ],
        ),
      ),
    );
  }
}
