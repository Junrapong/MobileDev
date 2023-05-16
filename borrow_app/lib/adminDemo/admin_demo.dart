import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widget/auth_service.dart';

class AdminDemo extends StatefulWidget {
  const AdminDemo({super.key});

  @override
  State<AdminDemo> createState() => _AdminDemoState();
}

class _AdminDemoState extends State<AdminDemo> {
  String? name;
  String? email;

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
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text(
            "Request & Brrowing",
            style: TextStyle(color: Colors.amber),
          ),
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: <Widget>[
          Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          )
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.amber,
          child: const Center(
            child: Text(
              'Request',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
          ),
        ),
      ),
      endDrawer: Drawer(
        child: Container(
          color: Colors.amber,
          child: const Center(
            child: Text(
              "Borrowing",
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          const Center(
              child: Text(
            "Welcome",
            style: TextStyle(
              color: Colors.amber,
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          )),
          Center(
            child: Text(
              "$name",
              style: const TextStyle(
                color: Colors.amber,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: Text(
              "Email: $email",
              style: const TextStyle(
                color: Colors.amber,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
            ),
            onPressed: () {
              AuthService().signOut();
            },
            child: const Text(
              'Sign Out',
              style: TextStyle(
                color: Colors.amber,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
