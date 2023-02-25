import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myapp/Lab5/Check.dart';
import 'package:myapp/Lab5/Summary.dart';
import 'package:provider/provider.dart';

TextEditingController q2 = TextEditingController();
String ans2 = '';

class Q2 extends StatelessWidget {
  const Q2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question 2'),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text(
                  'What is the color of banana?',
                  style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: q2,
                  decoration: InputDecoration(
                    hintText: 'answer',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      maximumSize: const Size(100, 50),
                      textStyle: const TextStyle(fontSize: 20),
                      fixedSize: const Size(100, 50),
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () {
                      var y = ['yello', 'Yello'];
                      ans2 = q2.text;
                      for (var i = 0; i < y.length; i++) {
                        if (ans2 == y[0]) {
                          context.read<Check>().add(0);
                        } else if (ans2 == y[1]) {
                          context.read<Check>().add(0);
                        } else {
                          break;
                        }
                        break;
                      }

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Summary()),
                      );
                      q2.clear();
                    },
                    child: const Text('OK'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
