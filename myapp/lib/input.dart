import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatefulWidget {
  const Input({super.key});

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  TextEditingController tcName = TextEditingController();
  String name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(hintText: 'Your name'),
            controller: tcName,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  name = tcName.text;
                });
              },
              child: Text('OK')),
          Text(name)
        ],
      ),
    );
  }
}
