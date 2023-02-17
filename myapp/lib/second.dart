import 'package:flutter/material.dart';

class Second extends StatelessWidget {
  Second({super.key});
  final TextEditingController tcNane = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Second Route'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: tcNane,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(), labelText: 'Your name'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, tcNane.text);
                },
                child: const Text('OK'),
              )
            ],
          ),
        ));
  }
}
