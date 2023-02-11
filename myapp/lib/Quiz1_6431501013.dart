import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Quiz1 extends StatefulWidget {
  const Quiz1({super.key});

  @override
  State<Quiz1> createState() => _Quiz1State();
}

class _Quiz1State extends State<Quiz1> {
  int num1 = 0;
  int num2 = 0;
  int num3 = 0;
  int max = 0;
  int min = 0;
  TextEditingController number1 = TextEditingController();
  TextEditingController number2 = TextEditingController();
  TextEditingController number3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz1'),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: TextField(
                  controller: number1,
                  decoration: InputDecoration(hintText: 'Number 1')),
            ),
            Container(
              child: TextField(
                  controller: number2,
                  decoration: InputDecoration(hintText: 'Number 2')),
            ),
            Container(
              child: TextField(
                  controller: number3,
                  decoration: InputDecoration(hintText: 'Number 3')),
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    num1 = int.tryParse(number1.text)!;
                    num2 = int.tryParse(number2.text)!;
                    num3 = int.tryParse(number3.text)!;

                    if (num1 > num2 && num1 > num3) {
                      max = num1;
                    } else if (num2 > num1 && num2 > num3) {
                      max = num2;
                    } else if (num3 > num1 && num3 > num2) {
                      max = num3;
                    }

                    if (num1 < num2) {
                      min = num1;
                    } else if (num1 < num3) {
                      min = num1;
                    } else if (num2 < num1) {
                      min = num2;
                    } else if (num2 < num3) {
                      min = num2;
                    } else if (num3 < num1) {
                      min = num3;
                    } else if (num3 < num2) {
                      min = num3;
                    }
                  });

                  //Text('Max = $max and Min = $min ');
                },
                child: Text('Compute'),
              ),
            ),
            Text('Max = $max and Min = $min ')
          ],
        ),
      ),
    );
  }
}
