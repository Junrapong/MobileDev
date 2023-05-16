import 'package:flutter/material.dart';
import 'package:myapp/Layout/L1.dart';

class Welcome_ extends StatefulWidget {
  const Welcome_({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome_> {
  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(15),
              child: Text(
                data,
                style: TextStyle(fontSize: 30),
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  maximumSize: const Size(100, 50),
                  textStyle: TextStyle(fontSize: 18),
                  fixedSize: Size(100, 50),
                  shape: StadiumBorder(),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Login_()),
                  );
                },
                child: const Text('Sign out'))
          ],
        ),
      ),
    );
  }
}
