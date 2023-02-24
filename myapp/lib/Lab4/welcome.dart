import 'package:flutter/material.dart';


import 'login.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(15),
                child: Text(
                  data,
                  style: const TextStyle(fontSize: 30),
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    maximumSize: Size(100, 50),
                    textStyle: TextStyle(fontSize: 18),
                    fixedSize: Size(100, 50),
                    shape: StadiumBorder(),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: ((context) => const Login())),
                    );
                  },
                  child: const Text('Sign out'))
            ],
          ),
        ),
      ),
    );
  }
}
