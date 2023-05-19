import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class History extends StatefulWidget {
  const History({Key? key});

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
        title: Center(
          child: const Text(
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
          final data = snapshot.data?.data();
          return Container(
            color: Colors.red[300],
            child: Column(
              children: [
                const SizedBox(height: 15),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Email : '),
                        Text(
                          '${data?['email'] ?? 'Wait for info'}',
                          style: const TextStyle(fontSize: 15),
                          softWrap: false,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text('Borrow : ${data?['diff'] ?? '-- -- ----'} days'),
                        Text(
                            'Start :  ${data?['start'] ?? 'Wait for request'}'),
                        Text('End :  ${data?['end'] ?? 'Wait for start days'}'),
                      ],
                    ),
                  ],
                ),
                if (data?['status'] == 'pending')
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary:
                          Colors.amber, // Set the background color to green
                    ),
                    child: Text(data?['status'] ?? 'Wait for info'),
                  ),
                if (data?['status'] == 'complete')
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary:
                          Colors.green, // Set the background color to green
                    ),
                    child: Text(data?['status'] ?? 'Wait for info'),
                  ),
                if (data?['status'] == 'reject')
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red, // Set the background color to green
                    ),
                    child: Text(data?['status'] ?? 'Wait for info'),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
