import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Title'),
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
          ),
          //Spacer(), //ใช้พื้นที่ที่เหลือให้เต็มพื้นที่
          Expanded(
            flex: 3,
            child: Container(
              width: 200,
              height: 100,
              color: Colors.green,
            ),
          ),
          //Spacer(),
          Expanded(
            flex: 2,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.yellow,
            ),
          ),
          //single child layout
        ],
      ),
    );
  }
}
