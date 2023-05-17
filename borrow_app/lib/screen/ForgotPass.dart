import 'dart:async';

import 'package:borrow_app/model/utils.dart';
import 'package:borrow_app/screen/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../widget/signup_controller.dart';
import '../widget/validator.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(SignupController());

  Future resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: controller.email.text)
          .then((value) =>
              Navigator.of(context).popUntil(((route) => route.isFirst)));

      controller.email.clear();

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Password reset link sent! Check your email'),
        backgroundColor: Colors.greenAccent,
        elevation: 10, //shadow
      ));
    } on FirebaseAuthException catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${e.message}'),
          backgroundColor: Colors.redAccent,
          elevation: 10, //shadow
        ),
      );
      controller.email.clear();
    }
  }

  Future<bool> onWillPop() async {
    controller.email.clear(); // เครียร์เนื้อหาใน TextField
    return true; // อนุญาตให้ปุ่มลูกศรย้อนกลับทำงานตามปกติ
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: onWillPop,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              leading: const BackButton(
                color: Colors.black, // <-- SEE HERE
              ),
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0.1,
              title: const Text(
                'Forgot Password',
                style: TextStyle(color: Colors.black),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const Center(
                          child:
                              Text('receive an email to reset your password.')),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: controller.email,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(FontAwesomeIcons.envelope),
                          label: Text('Email'),
                          hintText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: validatorEmail,
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black),
                          onPressed: resetPassword,
                          child: Text(
                            'Send Password'.toUpperCase(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
