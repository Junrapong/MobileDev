import 'package:flutter/material.dart';
import 'package:myapp/Example/myapp.dart';

class Recive extends StatelessWidget {
  Recive({Key? key, required this.data}) : super(key: key);
  var data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Text('${data['name']} ${data['description']}'),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              },
              child: Text('back'))
        ],
      ),
    );
  }
}
