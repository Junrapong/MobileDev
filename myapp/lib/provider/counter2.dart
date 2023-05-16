import 'package:flutter/material.dart';
import 'package:myapp/provider/count.dart';
import 'package:provider/provider.dart';

class Counter2 extends StatelessWidget {
  const Counter2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter 2'),
      ),
      body: Center(
        child: Text(
            'count = ${context.watch<Count>().value}'), //ดูค่าและเปลี่ยนแปลงแบบ real time
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<Count>().drop(); //ดูสถานะของ count
        },
        child: const Icon(Icons.remove),
      ),
    );
  }
}
