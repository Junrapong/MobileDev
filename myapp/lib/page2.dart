import 'package:flutter/material.dart';
import 'package:myapp/page1.dart';
import 'package:myapp/page3.dart';

class page2 extends StatelessWidget {
  const page2({super.key});

  @override
  Widget build(BuildContext context) {
    //get passing data รับค่าที่ส่งมา
    var data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.00),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                Navigator.pop(
                  context,
                );
                // MaterialPageRoute(builder: ((context) => const page1())));
              },
              child: const Text('Back'),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => const page3())));
              },
              child: const Text('Next'),
            ),
            Text('Data = ${data['grade']['mobile']}'),
          ],
        ),
      ),
    );
  }
}

//push เก็บหน้า
//pop เด้งหน้าออก
