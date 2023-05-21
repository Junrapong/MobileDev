import 'package:borrow_app/model/school.dart';
import 'package:borrow_app/widget/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> getData() async {
    try {
      final DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('user')
          .doc(_auth.currentUser!.uid)
          .get();

      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>;
        setState(() {
          email = data['Email'];
          name = data['FullName'];
        });
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> getItem(String id) async {
    //final uid = FirebaseFirestore.instance.collection('UserRequest').id;
    try {
      final QuerySnapshot mainCollectionSnapshot =
          await FirebaseFirestore.instance.collectionGroup('UserRequest').get();

      final QuerySnapshot subCollectionSnapshot = await FirebaseFirestore
          .instance
          .collection('UserRequest/${id}/Item')
          .get();

      for (QueryDocumentSnapshot subDocument in subCollectionSnapshot.docs) {
        items.add(subDocument);
        print('Sub-Collection Doc ID: ${subDocument.id}');
        print('Sub-Collection Doc Data: ${subDocument.data()}');
      }

      setState(() {}); // Trigger rebuild after data retrieval

    } catch (e) {
      print('Error: $e');
    }
  }

  List<QueryDocumentSnapshot> items = [];
  String? name;
  String? email;

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, // Set the background color to amber
        title: const Text(
          'Admin Page',
          style: TextStyle(color: Colors.amber),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance.collection('UserRequest').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          List<DocumentSnapshot> snap = snapshot.data!.docs;
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: snap.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot document = snap[index];

                    return SizedBox(
                      height: 150,
                      child: Card(
                        elevation: 3,
                        margin: const EdgeInsets.all(5),
                        child: Column(
                          children: [
                            // Image.network(
                            //   items[index]['image'],
                            //   height: 80,
                            //   width: 80,
                            // ),
                            // const SizedBox(width: 16.0),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                snap[index]['email'],
                                style: const TextStyle(fontSize: 15),
                                softWrap: false,
                                maxLines: 2,
                                overflow: TextOverflow.visible, // new
                              ),
                            ),
                            Text(
                              'Borrow for: ${snap[index]['diff']} days',
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Start: ${snap[index]['start']}',
                            ),
                            Text(
                              'End: ${snap[index]['end']}',
                            ),
                            const Spacer(),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.black,
                                    onPrimary: Colors.amber,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetialRequest(
                                          id: document.id,
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Text('See more')),
                            ),
                          ],
                        ),
                      ),
                    );
                  },

                  // children: items.map((QueryDocumentSnapshot item) {
                  //   final data = item.data() as Map<String, dynamic>?;

                  //   if (data != null) {
                  //     final name = data['name'] as String?;
                  //     return ListTile(
                  //       title: Text(name ?? 'No name'),
                  //     );
                  //   }

                  //   return const ListTile(
                  //     title: Text('Invalid data'),
                  //   );
                  // }).toList(),
                ),
              ),
            ],
          );
        },
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
            // ListTile(
            //   title: const Text('Borrowing'),
            //   onTap: () {
            //     // Update the state of the app
            //     // ...
            //     // Then close the drawer
            //     Navigator.pop(context);
            //   },
            // ),
            // ListTile(
            //   title: const Text('History'),
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => const HistoryPage(),
            //       ),
            //     );
            //   },
            // ),
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
                child: const Text('LOGOUT'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//==============================================================================
class DetialRequest extends StatefulWidget {
  final String id;
  const DetialRequest({super.key, required this.id});

  @override
  State<DetialRequest> createState() => _DetialRequestState();
}

class _DetialRequestState extends State<DetialRequest> {
  Future<void> getItem(String id) async {
    //final uid = FirebaseFirestore.instance.collection('UserRequest').id;
    try {
      final QuerySnapshot mainCollectionSnapshot =
          await FirebaseFirestore.instance.collectionGroup('UserRequest').get();

      final QuerySnapshot subCollectionSnapshot = await FirebaseFirestore
          .instance
          .collection('UserRequest/${id}/Item')
          .get();

      for (QueryDocumentSnapshot subDocument in subCollectionSnapshot.docs) {
        items.add(subDocument);
        print('Sub-Collection Doc ID: ${subDocument.id}');
        print('Sub-Collection Doc Data: ${subDocument.data()}');
      }

      setState(() {}); // Trigger rebuild after data retrieval

    } catch (e) {
      print('Error: $e');
    }
  }

  CollectionReference<Map<String, dynamic>> getFirestoreCollection() {
    return FirebaseFirestore.instance.collection('UserRequest');
  }

  List<QueryDocumentSnapshot> items = [];
  @override
  void initState() {
    getItem(widget.id);
    super.initState();
  }

  deleteData() async {
    await FirebaseFirestore.instance
        .collection('UserRequest')
        .doc(widget.id)
        .collection('Item')
        .get()
        .then(
      (QuerySnapshot query) {
        var docs_item = query.docs;
        for (var j in docs_item) {
          FirebaseFirestore.instance
              .collection('UserRequest')
              .doc(widget.id)
              .collection('Item')
              .doc(j.id)
              .delete();
        }
      },
    );
    //==========\\
    await FirebaseFirestore.instance
        .collection('UserRequest')
        .doc(widget.id)
        .delete();
    setState(() {
      items = [];
      getItem(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Request',
          style: TextStyle(color: Colors.amber),
        ),
        backgroundColor: Colors.black,
      ),
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: getFirestoreCollection().doc(widget.id).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return const Text("Connection error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading. . . ");
          }
          final data = snapshot.data!.data();

          return Column(
            children: [
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return items == null
                        ? const Text('No data')
                        : SizedBox(
                            child: Card(
                              elevation: 10,
                              margin: const EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Image.network(
                                    items[index]['image'],
                                    height: 80,
                                    width: 80,
                                  ),
                                  const SizedBox(width: 16.0),
                                  Expanded(
                                    child: Text(
                                      items[index]['name'],
                                      style: const TextStyle(fontSize: 15),
                                      softWrap: false,
                                      maxLines: 2,
                                      overflow: TextOverflow.visible, // new
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (data!['status'] == 'pending')
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          await FirebaseFirestore.instance
                              .collection('UserRequest')
                              .doc(widget.id)
                              .update({'status': 'approve'});
                        },
                        child: const Text('Approve'),
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                      ),
                    ),
                  if (data['status'] == 'pending')
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          await FirebaseFirestore.instance
                              .collection('UserRequest')
                              .doc(widget.id)
                              .update({'status': 'reject'});
                        },
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                        child: const Text('Rejected'),
                      ),
                    ),
                  if (data['status'] == 'approve')
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text(
                            'Approving Completed',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                          const SizedBox(height: 10.0),
                          ElevatedButton(
                            onPressed: () async {
                              Navigator.pop(context);
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('การคืนสินค้า'),
                                    content: const Text('ได้รับสินค้าคืนแล้ว'),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text('CANCLE'),
                                        onPressed: () async {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      TextButton(
                                        child: const Text('OK'),
                                        onPressed: () async {
                                          //Navigator.of(context).push(MaterialPageRoute(builder: AdminPage()));
                                          Navigator.of(context).pop();
                                          await deleteData();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                              return;
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              onPrimary: Colors.black,
                            ),
                            child: const Text(
                              'Delete Data',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (data['status'] == 'reject')
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text(
                            'Rejecting Completed ',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                          const SizedBox(height: 10.0),
                          ElevatedButton(
                            onPressed: () async {
                              Navigator.pop(context);
                              await deleteData();
                            },
                            style:
                                ElevatedButton.styleFrom(primary: Colors.red),
                            child: const Text(
                              'Delete Data',
                              style: TextStyle(color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

// class Borrowing extends StatefulWidget {
//   const Borrowing({super.key});

//   @override
//   State<Borrowing> createState() => _BorrowingState();
// }

// class _BorrowingState extends State<Borrowing> {
//   Future<void> getItem(String id) async {
//     //final uid = FirebaseFirestore.instance.collection('UserRequest').id;
//     try {
//       final QuerySnapshot mainCollectionSnapshot =
//           await FirebaseFirestore.instance.collectionGroup('UserRequest').get();

//       final QuerySnapshot subCollectionSnapshot = await FirebaseFirestore
//           .instance
//           .collection('UserRequest/${id}/Item')
//           .get();

//       for (QueryDocumentSnapshot subDocument in subCollectionSnapshot.docs) {
//         items.add(subDocument);
//         print('Sub-Collection Doc ID: ${subDocument.id}');
//         print('Sub-Collection Doc Data: ${subDocument.data()}');
//       }

//       setState(() {}); // Trigger rebuild after data retrieval

//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   List<QueryDocumentSnapshot> items = [];
//   String? name;
//   String? email;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Title'),
//       ),
//       body: Container(),
//     );
//   }
// }

//==============================================================================
// Future<void> createHistoryCollection() async {
//   try {
//     // ดึงข้อมูลจาก collection UserRequest ที่ถูก reject หรือ approve ทั้งหมด
//     final QuerySnapshot userRequestsSnapshot = await FirebaseFirestore.instance
//         .collection('UserRequest')
//         .where('status', whereIn: ['reject', 'approve']).get();

//     // สร้าง collection ใหม่ชื่อ history
//     final CollectionReference historyCollection =
//         FirebaseFirestore.instance.collection('history');

//     // เพิ่มข้อมูลจาก userRequestsSnapshot เข้าคอลเลกชัน history
//     userRequestsSnapshot.docs.forEach((DocumentSnapshot document) {
//       historyCollection.add(
//         document.data(),
//       );
//     });

//     print('History collection created successfully.');
//   } catch (e) {
//     print('Error: $e');
//   }
// }

// class HistoryPage extends StatefulWidget {
//   const HistoryPage({Key? key}) : super(key: key);

//   @override
//   State<HistoryPage> createState() => _HistoryPageState();
// }

// class _HistoryPageState extends State<HistoryPage> {
//   @override
//   void initState() {
//     createHistoryCollection();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('History'),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection('history').snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (!snapshot.hasData) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Text("Loading. . . ");
//           }
//           if (snapshot.hasError) {
//             return const Text("Connection error");
//           }

//           List<QueryDocumentSnapshot> documents = snapshot.data!.docs;

//           return ListView.builder(
//             itemCount: documents.length,
//             itemBuilder: (context, index) {
//               final DocumentSnapshot document = documents[index];

//               // Map<String, dynamic> data =
//               //     snapshot.data!.docs[index].data() as Map<String, dynamic>;

//               return ListTile(
//                 title: Text(document['email']),
//                 subtitle: Text('Borrowed for: ${document['diff']} days'),
//                 trailing: Text('Status: ${document['status']}'),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
