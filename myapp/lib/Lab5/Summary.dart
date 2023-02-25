import 'package:flutter/material.dart';
import 'package:myapp/Lab5/Check.dart';
import 'package:myapp/Lab5/Question1.dart';
import 'package:provider/provider.dart';

class Summary extends StatelessWidget {
  const Summary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Summary'),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  'Total score = ${context.watch<Check>().ans.length} ',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      maximumSize: const Size(100, 50),
                      textStyle: const TextStyle(fontSize: 20),
                      fixedSize: const Size(100, 50),
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () {
                      context.read<Check>().clear();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const Q1()),
                          (route) => false);
                    },
                    child: const Text('Restart'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
