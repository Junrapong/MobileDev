import 'package:borrow_app/screen/HomeBar.dart';
import 'package:borrow_app/screen/LoginPage.dart';
import 'package:borrow_app/screen/admin_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CheckUser extends StatelessWidget {
  const CheckUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          final User? user = snapshot.data;
          if (snapshot.hasData) {
            // User is logged in
            final CollectionReference users =
                FirebaseFirestore.instance.collection('user');
            return StreamBuilder<DocumentSnapshot>(
              stream: users.doc(user!.uid).snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                final DocumentSnapshot document = snapshot.data!;
                final String role = document.get('role');
                if (role == 'Admin') {
                  // User is an admin
                  return const AdminPage();
                } else {
                  // User is a regular user
                  return const HomeBar();
                }
              },
            );
          } else {
            // User is not logged in
            return const Login();
          }
        },
      ),
    );
  }
}
