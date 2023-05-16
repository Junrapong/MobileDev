import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Firebase/login_demo.dart';

class RegisterDemo extends StatefulWidget {
  const RegisterDemo({super.key});

  @override
  State<RegisterDemo> createState() => _RegisterDemoState();
}

class _RegisterDemoState extends State<RegisterDemo> {
  final _tcEmail = TextEditingController();
  final _tcPassword = TextEditingController();

  // ===function register===
  Future<void> register() async {
    try {
      if (mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginDemo()),
          (route) => false,
        );
      }
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _tcEmail.text, password: _tcPassword.text);
    } on FirebaseAuthException catch (e) {
      debugPrint('Error $e');
    }

    //debugPrint(email);
    //debugPrint(password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _tcEmail,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                hintText: 'Email',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _tcPassword,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                hintText: 'Password',
              ),
            ),
          ),
          SizedBox(
            width: 100.0,
            height: 50.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: register,
              child: const Text('Register'),
            ),
          ),
        ],
      ),
    );
  }
}
