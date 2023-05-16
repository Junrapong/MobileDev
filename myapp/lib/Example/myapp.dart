import 'package:flutter/material.dart';
import 'package:myapp/Example/recive.dart';

class MyApp extends StatelessWidget {
  final List<Map<String, String>> _items = [
    {'name': 'Item 1', 'description': 'Description for Item 1'},
    {'name': 'Item 2', 'description': 'Description for Item 2'},
    {'name': 'Item 3', 'description': 'Description for Item 3'},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter List and Map Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('List and Map Example'),
        ),
        body: ListView.builder(
          //ListView.separated
          // separatorBuilder: (context, index) => SizedBox(
          //   height: 8,
          // ),
          itemCount: _items.length,
          itemBuilder: (BuildContext context, int index) {
            //{'name': 'Item 1', 'description': 'Description for Item 1'}
            final item = _items[index];
            return ListTile(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => Recive(data: item))));
              },
              title: Text(item['name']!),
              subtitle: Text(item['description']!),
            );
          },
        ),
      ),
    );
  }
}
