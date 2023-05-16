import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Firebase/login_demo.dart';
import 'package:myapp/Firebase/welcome_demo.dart';

class AuthCheck extends StatelessWidget {
  const AuthCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            // already logged in
            return const WelcomeDemo();
          } else {
            // not logged in yet
            return const LoginDemo();
          }
        }),
      ),
    );
  }
}
