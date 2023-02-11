import 'dart:math';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

final fieldText = TextEditingController();

class _CalculatorState extends State<Calculator> {
  int num1 = 0;
  int num2 = 0;
  int result = 0;
  TextEditingController number1 = TextEditingController();
  TextEditingController number2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: number1,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(90.0)),
                    hintText: 'Number 1'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: number2,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(90.0)),
                    hintText: 'Number 2'),
              ),
            ),
            Column(
              children: [
                Container(
                  //padding: EdgeInsets.all(20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 255, 183, 76)),
                    onPressed: () {
                      setState(() {
                        num1 = int.tryParse(number1.text)!;
                        num2 = int.tryParse(number2.text)!;
                        result = num1 + num2;
                      });
                    },
                    child: Text('Sum'),
                  ),
                ),
                Container(
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () {
                      setState(() {
                        num1 = int.tryParse(number1.text)!;
                        num2 = int.tryParse(number2.text)!;
                        result = (pow(num1, num2) as int);
                      });
                    },
                    child: Text('Power'),
                  ),
                ),
                Container(
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red)),
                    onPressed: () {
                      setState(() {
                        result = 0;
                        number1.clear();
                        number2.clear();
                      });
                    },
                    child: Text('Clear'),
                  ),
                ),
                Text(
                  'Reselt = $result',
                  style: TextStyle(color: Colors.red),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
