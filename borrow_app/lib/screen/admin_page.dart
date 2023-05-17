import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // Future<QuerySnapshot> getData() async {
  //   final User? user = _auth.currentUser;
  //   final _uid = user!.uid;

  //   // Get the documents from the source collection
  //   QuerySnapshot snapshot = await FirebaseFirestore.instance
  //       .collection('user')
  //       .doc(_uid)
  //       .collection('Pending')
  //       .get();

  //   snapshot.docs.forEach(
  //     (DocumentSnapshot doc) async {
  //       Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
  //     },
  //   );
  // }

  Future updateData(String productName, String status) async {
    final productQuery = FirebaseFirestore.instance
        .collection('products')
        .where('products_name', isEqualTo: productName);
    final querySnapshot = await productQuery.get();
    final documentSnapshot = querySnapshot.docs.first;
    final documentId = documentSnapshot.id;

    final documentReference =
        FirebaseFirestore.instance.collection('products').doc(documentId);

    documentReference.update(
      {'status': status},
    );
  }

  Future updateUserData(String productName, String status, String _uid) async {
    FirebaseFirestore.instance
        .collection('user')
        .doc(_uid)
        .collection('Pending')
        .doc(productName)
        .update(
      {'status': status},
    );
  }

  Future addData(String start, String end, String productName,
      String productImage, day, String _uid, String _email) async {
    FirebaseFirestore.instance.collection('Borrow').doc(productName).set(
      {
        'date_start': start,
        'date_end': end,
        'name': productName,
        'image': productImage,
        'day': day,
        'status': 'pending',
      },
    );
  }

  String? name;
  String? email;

  Future<void> getData() async {
    try {
      final DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('user')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>;
        setState(() {
          email = data['Email'];
          name = data['FullName'];
          // phone = data[“Phone”];
          // school = data[“school”];
          // studentid = data[“studentId”];
          // profileurl = data[“ProfileImageUrl”];
        });
      }
    } catch (e) {
      print('Error: $e');
    }
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
      body: Center(
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("UserRequest")
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                // if (snapshot.connectionState == ConnectionState.waiting) {
                //   return const Center(child: CircularProgressIndicator());
                // }
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text('Loading...');
                }

                if (!snapshot.hasData) {
                  return const Text('Collection is empty');
                }

                List<DocumentSnapshot> snap = snapshot.data!.docs;
                print(snap);
                //Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

                // for (QueryDocumentSnapshot document in documents) {
                //   // Access the subcollections within each document
                //   CollectionReference subcollectionRef =
                //       document.reference.collection('Item');

                //   subcollectionRef
                //       .get()
                //       .then((QuerySnapshot subcollectionSnapshot) {
                //     List<QueryDocumentSnapshot> subcollectionDocs =
                //         subcollectionSnapshot.docs;

                //     Map<String, dynamic> data =
                //         subcollectionDocs.data() as Map<String, dynamic>;
                //   });
                // }
                return SizedBox(
                  height: 400,
                  child: ListView.builder(
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
                                ),
                              ),

                              // Column(
                              //   children: <Widget>[
                              //     ElevatedButton(
                              //         onPressed: () {
                              //           showDialog(
                              //             context: context,
                              //             builder: (BuildContext context) {
                              //               return AlertDialog(
                              //                 title:
                              //                     const Text('Confirm Accept'),
                              //                 actions: <Widget>[
                              //                   ElevatedButton(
                              //                       onPressed: () {
                              //                         Navigator.pop(context);
                              //                         updateData(
                              //                             snap[index]['name'],
                              //                             'borrowing');
                              //                         updateUserData(
                              //                           snap[index]['name'],
                              //                           'borrowing',
                              //                           snap[index]['userId'],
                              //                         );

                              //                         FirebaseFirestore.instance
                              //                             .collection(
                              //                                 'UserRequest')
                              //                             .doc(snap[index].id)
                              //                             .delete();

                              //                         addData(
                              //                           snap[index]
                              //                               ['date_start'],
                              //                           snap[index]['date_end'],
                              //                           snap[index]['name'],
                              //                           snap[index]['image'],
                              //                           snap[index]['day'],
                              //                           snap[index]['userId'],
                              //                           snap[index]
                              //                               ['userEmail'],
                              //                         );
                              //                       },
                              //                       child: const Text('data'))
                              //                 ],
                              //               );
                              //             },
                              //           );
                              //         },
                              //         child: const Text('data'))
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
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
