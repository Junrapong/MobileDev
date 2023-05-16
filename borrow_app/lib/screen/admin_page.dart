import 'package:borrow_app/widget/auth_service.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AdminPage'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              AuthService().signOut();
            },
            child: const Text('SignOut')),
      ),
    );
  }
}
