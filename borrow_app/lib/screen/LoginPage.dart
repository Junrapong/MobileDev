import 'package:borrow_app/screen/ForgotPass.dart';
import 'package:borrow_app/screen/HomeBar.dart';
import 'package:borrow_app/screen/RegisterPage.dart';
import 'package:borrow_app/screen/admin_page.dart';
import 'package:borrow_app/screen/cart.dart';
import 'package:borrow_app/widget/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../model/school.dart';
import '../widget/signup_controller.dart';
import '../widget/validator.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final controller = Get.put(SignupController());
  final formKey = GlobalKey<FormState>();

  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    var x = FirebaseFirestore.instance
        .collection('user')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('role') == "Admin") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const AdminPage(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeBar(),
            ),
          );
        }
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  void signIn() async {
    final email = controller.email.text.trim();
    final password = controller.password.text.trim();

    if (formKey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        route();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }
  }

  bool _obscureText = true;

  void clearText() {
    controller.fullName.clear();
    controller.email.clear();
    controller.studentId.clear();
    controller.phoneNumber.clear();
    controller.password.clear();
    selectedValue = null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            child: Container(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Image.asset('lib/assets/log/logoScreen.png'),
                  Form(
                    key: formKey,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: validatorEmail,
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            obscureText: _obscureText,
                            controller: controller.password,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(FontAwesomeIcons.lock),
                              label: const Text('Password'),
                              hintText: 'Password',
                              border: const OutlineInputBorder(),
                              suffixIcon: IconButton(
                                icon: Icon(_obscureText
                                    ? FontAwesomeIcons.eye
                                    : FontAwesomeIcons.eyeSlash),
                                onPressed: () {
                                  setState(
                                    () {
                                      _obscureText = !_obscureText;
                                    },
                                  );
                                },
                              ),
                            ),
                            // autovalidateMode:
                            //     AutovalidateMode.onUserInteraction,
                            // validator: passwordValidator,
                          ),
                          const SizedBox(height: 5),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgotPasswordPage(),
                                  ),
                                );
                              },
                              child: const Text('Forgot Password?'),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black),
                              onPressed: () {
                                final isValidForm =
                                    formKey.currentState!.validate();
                                if (isValidForm) {
                                  signIn();
                                  clearText();
                                }
                              },
                              child: Text(
                                'Login'.toUpperCase(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      const Text('OR'),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.black,
                            shadowColor: Colors.black,
                            side:
                                const BorderSide(color: Colors.black, width: 2),
                          ),
                          icon:
                              //Icon(FontAwesomeIcons.google),
                              const Image(
                            image: AssetImage('lib/assets/log/google_logo.png'),
                            width: 20,
                          ),
                          label: const Text('Sign-In with Google'),
                          onPressed: () {
                            AuthService().signInWithGoogle(context);
                          },
                        ),
                      ),
                      const SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          text: "Don't have an Account? ",
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Sign up'.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.cyan,
                                fontWeight: FontWeight.w500,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  clearText();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Register(),
                                    ),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
