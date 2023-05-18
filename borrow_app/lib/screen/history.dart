import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

CollectionReference<Map<String, dynamic>> getFirestoreCollection() {
  return FirebaseFirestore.instance.collection('UserRequest');
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, // <-- SEE HERE
        ),
        backgroundColor: Colors.white,
        title: const Text(
          'History',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
            backgroundColor: Colors.white,
            color: Colors.black,
          ),
        ),
      ),
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: getFirestoreCollection()
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text("Connection error");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading. . . ");
            }
            final data = snapshot.data!.data();
            return Container(
              color: Color.fromARGB(255, 233, 216, 166),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Email : '),
                      Text(
                        '${data!['email']}',
                        style: const TextStyle(fontSize: 15),
                        softWrap: false,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Detail : '),
                      Text('Borrow ${data['diff']} days'),
                      Text('Start ${data['start']}'),
                      Text('Start ${data['end']}'),
                    ],
                  ),
                  ElevatedButton(onPressed: () {}, child: Text(data['status']))
                ],
              ),
            );
          }),
    );
  }
}
