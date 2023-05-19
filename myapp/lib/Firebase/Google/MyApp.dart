import 'package:flutter/material.dart';

import 'LoginButton.dart';
import 'UserProfile.dart';

//void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterBase',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutterbase'),
          backgroundColor: Colors.amber,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              LoginButton(), // <-- Built with StreamBuilder
              UserProfile() // <-- Built with StatefulWidget
            ],
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlutterBase'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30),
            LoginButton(), // <-- Built with StreamBuilder
            UserProfile() // <-- Built with StatefulWidget
          ],
        ),
      ),
    );
  }
}
