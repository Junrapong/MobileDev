import 'package:flutter/material.dart';
import 'package:myapp/provider/count.dart';
import 'package:myapp/provider/counter2.dart';
import 'package:provider/provider.dart';

// class Counter extends StatefulWidget {
//   const Counter({super.key});

//   @override
//   State<Counter> createState() => _CounterState();
// }

// class _CounterState extends State<Counter> {
//   int count = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Counter'),
//       ),
//       body: Center(
//         child: Text('count = $count'),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             count++;
//           });
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: Text(
            'count = ${context.watch<Count>().value}'), //ดูค่าและเปลี่ยนแปลงแบบ real time
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              //add count
              context.read<Count>().add(); //ดูสถานะของ count
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Counter2()),
              );
            },
            child: const Icon(Icons.skip_next),
          )
        ],
      ),
    );
  }
}
