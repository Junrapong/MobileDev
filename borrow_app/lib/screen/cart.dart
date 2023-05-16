import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widget/picker_date.dart';

class Cart extends StatefulWidget {
  final String productName;
  final String productImage;
  const Cart({Key? key, required this.productName, required this.productImage});

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
                                  .doc(snap[index].id)
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
              DatePickerPage(
                productName: widget.productName,
                productImage: widget.productImage,
              )
            ],
          );
        },
      ),
    );
  }
}
