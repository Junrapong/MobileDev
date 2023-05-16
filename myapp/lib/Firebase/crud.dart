//CRUD

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CurdDemo extends StatefulWidget {
  const CurdDemo({super.key});

  @override
  State<CurdDemo> createState() => _CurdDemoState();
}

class _CurdDemoState extends State<CurdDemo> {
  //data will be form db
  // final List users = [
  //   {'name': 'Logan', 'age': 45},
  //   {'name': 'Laura', 'age': 14}
  // ];

  //Data form Firestore
  final _userStream = FirebaseFirestore.instance.collection('user').snapshots();

  // text controllers
  final _tcName = TextEditingController();
  final _tcAge = TextEditingController();

  //============================= CRUD functions ===========================
  // --- delete ---
  Future<void> deleteData(String docID) async {
    //ShowDialog
    String? answer = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Sure to delete data?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.red),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop('OK');
                },
                child: const Text(
                  'OK',
                  style: TextStyle(color: Colors.green),
                ),
              )
            ],
          );
        });

    //Delete the data
    if (answer == 'OK') {
      FirebaseFirestore.instance.collection('user').doc(docID).delete().then(
            (value) => print('Document delete!'),
            onError: (e) => print('Error $e'),
          );
    }
  }

  // --- Add ---
  Future<void> addData() async {
    // clear inputs
    _tcName.text = '';
    _tcAge.text = '';

    // show alert dialog
    String? answer = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add new user'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _tcName,
                decoration: const InputDecoration(hintText: 'Name'),
              ),
              TextField(
                controller: _tcAge,
                decoration: const InputDecoration(hintText: 'Age'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop('OK');
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );

    // add data to db
    if (answer == 'OK') {
      String name = _tcName.text;
      int age = int.parse(_tcAge.text);
      var data = {'name': name, 'age': age};
      // print(name);
      // print(age.toString());
      FirebaseFirestore.instance.collection('user').add(data).then(
          (value) => print('Adding done!'),
          onError: (e) => print('Error $e'));
    }
  }

  // --- edit ---
  Future<void> editData(String docsID) async {
    // clear inputs
    _tcName.text = '';
    _tcAge.text = '';

    // show alert dialog
    String? answer = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add new user'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _tcName,
                decoration: const InputDecoration(hintText: 'Name'),
              ),
              TextField(
                controller: _tcAge,
                decoration: const InputDecoration(hintText: 'Age'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop('OK');
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );

    // edit data to db
    if (answer == 'OK') {
      String name = _tcName.text;
      int age = int.parse(_tcAge.text);
      var data = {'name': name, 'age': age};
      // print(name);
      // print(age.toString());
      FirebaseFirestore.instance
          .collection('user')
          .doc(docsID)
          .update(data)
          .then((value) => print('Updating done!'),
              onError: (e) => print('Error $e'));
    }
  }
  //========================================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD demo'),
        actions: [
          IconButton(
            onPressed: addData,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _userStream,
        builder: (context, snapshot) {
          //connection erroo
          if (snapshot.hasError) {
            return const Text('Connection Erroe');
          }
          //connecting...
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading');
          }
          //Data is read
          //convert snapshot to List
          //docs['0']['name']
          var docs = snapshot.data!.docs;
          // return Text('${docs[0]['name']}');
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: ((context, index) {
              return ListTile(
                leading: IconButton(
                  onPressed: () {
                    editData(docs[index].id);
                    _tcName.text = docs[index]['name'];
                    _tcAge.text = docs[index]['age'].toString();
                  },
                  icon: const Icon(Icons.edit),
                ),
                title: Text(docs[index]['name']),
                subtitle: Text("${docs[index]['age'].toString()} years old"),
                trailing: IconButton(
                  onPressed: () {
                    //delete the item
                    deleteData(docs[index].id);
                  },
                  icon: const Icon(Icons.delete),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
