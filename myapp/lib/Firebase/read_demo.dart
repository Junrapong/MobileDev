import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ReadDemo extends StatelessWidget {
  const ReadDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Read form Firebase'),
      ),
      body: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  MyWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String output = 'data';
  TextEditingController tcName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          children: [
            TextField(
              controller: tcName,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Input name',
                suffixIcon: IconButton(
                  onPressed: () {
                    tcName.clear();
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection('user')
                      .where('name', isEqualTo: tcName.text)
                      .limit(1)
                      .get()
                      .then((QuerySnapshot query) {
                    var docs = query.docs;

                    if (docs.isNotEmpty) {
                      setState(() {
                        output = '${docs[0]['name']} : ${docs[0]['age']}';
                      });
                    } else {
                      setState(() {
                        output = 'No result found';
                      });
                    }
                  });
                  // var db = FirebaseFirestore.instance;
                  // var docRef =
                  //     db.collection('user').doc('AE52i1rmltNmIYKhDT3L');

                  // docRef.get().then((DocumentSnapshot doc) {
                  //   if (doc.exists) {
                  //     var data = doc.data() as Map<String, dynamic>;

                  //     setState(() {
                  //       output = '${data['name']} : ${data['age']}';
                  //     });
                  //   } else {
                  //     setState(() {
                  //       output = 'No document in DB';
                  //     });
                  //   }
                  // });
                },
                onHover: (e) => debugPrint('Error $e'),
                child: const Text('Search'),
              ),
            ),
            Text(output),
          ],
        ),
      ),
    );
  }
}
