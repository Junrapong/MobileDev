import 'package:flutter/material.dart';
import 'package:myapp/Example/myapp.dart';

class Listviews extends StatefulWidget {
  const Listviews({Key? key}) : super(key: key);

  @override
  _ListviewsState createState() => _ListviewsState();
}

class _ListviewsState extends State<Listviews> {
  List<Map> x = [
    {'name': 'Mes', 'age': 20},
    {'name': 'Maysa', 'age': 40},
  ];

  List<int> y = [1, 2, 3, 4];
  Map z = {'name': 'Mes', 'age': 20};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listview'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            ListTile(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: ((context) => MyApp())));
                },
                title: Text('${x[1]['name']} ${x[1]['age']} '),
                subtitle: const Text("The battery is full."),
                leading: const CircleAvatar(),
                trailing: const Icon(Icons.star)),
            const ListTile(
                title: Text("Battery Full"),
                subtitle: Text("The battery is full."),
                leading: CircleAvatar(),
                trailing: Icon(Icons.star)),
            const ListTile(
                title: Text("Battery Full"),
                subtitle: Text("The battery is full."),
                leading: CircleAvatar(),
                trailing: Icon(Icons.star)),
            const ListTile(
                title: Text("Battery Full"),
                subtitle: Text("The battery is full."),
                leading: CircleAvatar(),
                trailing: Icon(Icons.star)),
            const ListTile(
                title: Text("Battery Full"),
                subtitle: Text("The battery is full."),
                leading: CircleAvatar(),
                trailing: Icon(Icons.star)),
            const ListTile(
                title: Text("Battery Full"),
                subtitle: Text("The battery is full."),
                leading: CircleAvatar(),
                trailing: Icon(Icons.star)),
            const ListTile(
                title: Text("Battery Full"),
                subtitle: Text("The battery is full."),
                leading: CircleAvatar(),
                trailing: Icon(Icons.star)),
            const ListTile(
                title: Text("Battery Full"),
                subtitle: Text("The battery is full."),
                leading: CircleAvatar(),
                trailing: Icon(Icons.star)),
            const ListTile(
                title: Text("Battery Full"),
                subtitle: Text("The battery is full."),
                leading: CircleAvatar(),
                trailing: Icon(Icons.star)),
            const ListTile(
                title: Text("Battery Full"),
                subtitle: Text("The battery is full."),
                leading: CircleAvatar(),
                trailing: Icon(Icons.star)),
          ],
        ),
      ),
    );
  }
}
