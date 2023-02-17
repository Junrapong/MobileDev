import 'package:flutter/material.dart';
import 'package:myapp/page2.dart';

class page1 extends StatelessWidget {
  const page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
      ),
      body: Container(
        //color: Colors.yellow,
        alignment: Alignment.topCenter, //alignment เซตตำแหน่ง
        padding: const EdgeInsets.only(top: 16.00), //padding ขอบใน
        //margin: EdgeInsets.only(top: 16.00), //margin ขอบนอก
        child: ElevatedButton(
          onPressed: () {
            //String data = 'I love U';
            var data = {
              'name': 'Lara',
              'age': 19,
              'isFemale': true,
              'score': [10, 20, 30],
              'grade': {'mobile': 'A', 'web': 'C+'}
            };

            //jump to page 2
            Navigator.push(
              context,
              //arrow function
              MaterialPageRoute(
                builder: (context) => const page2(),
                settings: RouteSettings(arguments: data),
              ),
            );
            // MaterialPageRoute(builder: (context) {
            //   return const page2();
            // }),
            // );
          },
          child: const Text('Next'),
        ),
      ),
    );
  }
}
