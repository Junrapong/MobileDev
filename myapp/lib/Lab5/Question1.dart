import 'package:flutter/material.dart';
import 'package:myapp/Lab5/Check.dart';
import 'package:myapp/Lab5/Qusetion2.dart';
import 'package:provider/provider.dart';

TextEditingController q1 = TextEditingController();
String ans1 = '';

class Q1 extends StatelessWidget {
  const Q1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question 1'),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text(
                  'What is this year?',
                  style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: q1,
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
                      ans1 = q1.text;
                      if (ans1 == '2023') {
                        context.read<Check>().add(0);
                      }
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Q2()),
                      );
                      q1.clear();
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
