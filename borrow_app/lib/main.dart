import 'dart:io';

import 'package:borrow_app/screen/Home.dart';
import 'package:borrow_app/screen/SignIn.dart';
import 'package:borrow_app/model/auth_page.dart';
import 'package:borrow_app/model/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    scaffoldMessengerKey: Utils.messengerKey,
    navigatorKey: navigatorKey,
    debugShowCheckedModeBanner: false,
    // theme: ThemeData.dark().copyWith(secondaryHeaderColor: Colors.tealAccent),
    darkTheme: ThemeData(
      brightness: Brightness.dark,
    ),
    theme: ThemeData(
      brightness: Brightness.dark,
    ),
    themeMode: ThemeMode.system,
    home: MainPage(),
  ));
}

// class MyApp extends StatelessWidget {
//   static final String title = 'Firebase Auth';

//   @override
//   Widget build(BuildContext context) => MaterialApp(
//       scaffoldMessengerKey: Utils.messengerKey,
//       navigatorKey: navigatorKey,
//       debugShowCheckedModeBanner: false,
//       title: title,
//       // theme: ThemeData.dark().copyWith(
//       //     colorScheme: ColorScheme.fromSwatch(
//       //         primarySwatch:
//       //            primaryFocus!().copyWith(Secondary: Colors.tealAccent))),
//       home: MainPage());
// }

final navigatorKey = GlobalKey<NavigatorState>();

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        // backgroundColor: Colors.grey,
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Someting went wrong'),
              );
            } else if (snapshot.hasData) {
              return const HomePage();
            } else {
              return const AuthPage();
            }
          },
        ),
      );
}
