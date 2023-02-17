import 'package:flutter/material.dart';
import 'package:myapp/second.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  String message = 'What is your name?';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(message),
              // const Text('What is your name?'),
              ElevatedButton(
                onPressed: () async {
                  var name = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Second()),
                  );
                  if (name != null) {
                    setState(() {
                      message = 'Hello $name';
                    });
                  }
                },
                child: const Text('Next'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
