// import 'package:borrow_app/model/profile.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:form_field_validator/form_field_validator.dart';

// class Check_firebase extends StatefulWidget {
//   Check_firebase({super.key});

//   @override
//   State<Check_firebase> createState() => _Check_firebaseState();
// }

// class _Check_firebaseState extends State<Check_firebase> {
//   final Future<FirebaseApp> firebase = Firebase.initializeApp();

//   final formkey = GlobalKey<FormState>();

//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();

//   // final TextEditingController email = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: firebase,
//       builder: ((context, snapshot) {
//         if (snapshot.hasError) {
//           return Scaffold(
//             appBar: AppBar(
//               title: const Text('Error'),
//             ),
//             body: Center(
//               child: Text('${snapshot.error}'),
//             ),
//           );
//         }
//         if (snapshot.connectionState == ConnectionState.done) {
//           return Scaffold(
//             // backgroundColor: Colors.grey,
//             appBar: AppBar(
//               title: const Text('Register account'),
//             ),
//             body: Column(
//               children: [
//                 // const Text('Enail'),
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: TextFormField(
//                     keyboardType: TextInputType.emailAddress,
//                     validator: EmailValidator(
//                         errorText: 'enter a valid email address'),
//                     //text input
//                     controller: emailController,
//                     textInputAction: TextInputAction.next,
//                     cursorColor: Colors.white,
//                     decoration: InputDecoration(
//                         border: OutlineInputBorder(), labelText: 'Email'),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: TextFormField(
//                     //text input
//                     controller: passwordController,
//                     textInputAction: TextInputAction.done,
//                     decoration: InputDecoration(
//                         border: OutlineInputBorder(), labelText: 'Password'),
//                     obscureText: true,
//                   ),
//                 ),
//                 ElevatedButton(onPressed: signIn, child: const Text('Register'))
//               ],
//             ),
//           );
//         }
//         return const Scaffold(
//           body: Center(
//             child: CircularProgressIndicator(),
//           ),
//         );
//       }),
//     );

//     Future signIn() async {
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: emailController.text.trim(),
//         password: passwordController.text.trim(),
//       );
//     }
//   }
// }
