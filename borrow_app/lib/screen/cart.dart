import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;
final User? user = _auth.currentUser;

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, // <-- SEE HERE
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        // elevation: 0.1,
        title: const Text(
          "Cart",
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
            backgroundColor: Colors.white,
            color: Colors.black,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('user')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('Pending')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          print(FirebaseAuth.instance.currentUser!.uid);
          List<DocumentSnapshot> snap = snapshot.data!.docs;
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: snap.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Row(
                        children: [
                          Image.network(
                            snap[index]['image'],
                            height: 80,
                            width: 80,
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: Text(
                              snap[index]['name'],
                              style: const TextStyle(fontSize: 15),
                              softWrap: false,
                              maxLines: 2,
                              overflow: TextOverflow.visible, // new
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              FirebaseFirestore.instance
                                  .collection('user')
                                  .doc(FirebaseAuth.instance.currentUser!.uid)
                                  .collection('Pending')
                                  .doc(snap[index]['name'])
                                  .delete();
                            },
                            icon: const Icon(Icons.delete),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              const Divider(color: Colors.grey, thickness: 1),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      onPrimary: Colors.amber,
                    ),
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => (

                      //     ),
                      //   ),
                      // );
                    },
                    child: const Text('Confirm'),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
