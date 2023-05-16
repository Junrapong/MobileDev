import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../widget/auth_service.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  // Future updateData() async {
  //   final productsQuery = FirebaseFirestore.instance
  //       .collection('products')
  //       .where('products_name', isEqualTo: widget.productName);

  //   final querySnapshot = await productsQuery.get();
  //   final documentSnapshot = querySnapshot.docs.first;
  //   final documentId = documentSnapshot.id;

  //   final documentReference =
  //       FirebaseFirestore.instance.collection('products').doc(documentId);

  //   documentReference.update({
  //     'status': 'pending',
  //   });
  // }

  String? name;
  String? email;
  // String? phone;
  // String? school;
  // String? studentid;
  // String? profileurl;
// get user info
  Future<void> getData() async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) async {
      if (value.exists) {
        setState(() {
          email = value.data()!["Email"];
          name = value.data()!["FullName"];
          // phone = value.data()!["Phone"];
          // school = value.data()!["school"];
          // studentid = value.data()!["studentId"];
          // profileurl = value.data()!["ProfileImageUrl"];
        });
      }
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[700], // Set the background color to amber
      ),
      body: ListView(
        children: [
          Center(
            // child: Text('โย่วววว นี่คือเสียงจากกิ้งงงงง'),
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("UserRequest")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return CircularProgressIndicator();
                  }
                  List<DocumentSnapshot> snap = snapshot.data!.docs;
                  return ListView.builder(
                      itemCount: snap.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                Image.network(
                                  snap[index]['image'],
                                  height: 80,
                                  width: 80,
                                ),
                                const SizedBox(width: 16.0),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snap[index]['name'],
                                      style: const TextStyle(fontSize: 15),
                                      softWrap: false,
                                      maxLines: 2,
                                      overflow: TextOverflow.visible, // new
                                    ),
                                  ],
                                ))
                              ],
                            ),
                          ),
                        );
                      });
                }),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: -1,
              child: Container(
                color: Colors.black,
                alignment: Alignment.center,
                // height: 100,
                //width: 300,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    '$email',
                    style: const TextStyle(fontSize: 20, color: Colors.amber),
                  ),
                ),
              ),
            ),

            ListTile(
              title: const Text('User Request'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Borrowing'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            const Expanded(
                child:
                    SizedBox()), // Added Expanded widget to fill the remaining space
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  onPrimary: Colors.amber,
                ),
                onPressed: () {
                  AuthService().signOut();
                },
                child: const Text('Sign Out'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
