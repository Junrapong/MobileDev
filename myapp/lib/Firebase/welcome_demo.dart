import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Firebase/login_demo.dart';

class WelcomeDemo extends StatefulWidget {
  const WelcomeDemo({super.key});

  @override
  State<WelcomeDemo> createState() => _WelcomeDemoState();
}

class _WelcomeDemoState extends State<WelcomeDemo> {
  // === Get name user ===
  final user = FirebaseAuth.instance.currentUser;

  // ===function logout===
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      // sign out complete
      // return to login
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginDemo()),
        );
      }
    } on FirebaseAuthException catch (e) {
      // fail to sign out
      debugPrint('Error $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Title'),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            user == null
                ? const Text('waiting...')
                : Text('Welcome ${user!.email}'),
            const SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: logout,
              child: const Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
