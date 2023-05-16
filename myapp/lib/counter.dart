import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('count'),
      ),
      body: Center(
          child: Column(
        children: [
          Text(
            'Counter = $count',
            style: TextStyle(fontSize: 26),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                count++;
              });
            },
            child: Text('Click'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              setState(() {
                count = 0;
              });
            },
            child: Text('Reset'),
          ),
        ],
      )),
    );
  }
}
