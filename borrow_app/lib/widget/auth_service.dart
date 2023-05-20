// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import '../screen/HomeBar.dart';

// class AuthService {
//   final FirebaseAuth auth = FirebaseAuth.instance;
//   final GoogleSignIn _googleSignIn = GoogleSignIn();

//   Future signInWithGoogle(BuildContext context) async {
//     try {
//       // Trigger the authentication flow
//       final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//       // final GoogleSignInAccount? googleUser = await GoogleSignIn(
//       //         scopes: <String>["email"], signInOption: SignInOption.standard)
//       //     .signIn();

//       if (googleUser != null) {
//         // Obtain the authentication details from the Google user object
//         final GoogleSignInAuthentication googleAuth =
//             await googleUser.authentication;

//         // Create a new credential using the authentication details
//         final credential = GoogleAuthProvider.credential(
//           accessToken: googleAuth.accessToken,
//           idToken: googleAuth.idToken,
//         );

//         // finally, lets sign in
//         UserCredential userCredential =
//             await auth.signInWithCredential(credential);

//         // Get.off(HomeBar);
//         Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (context) => const HomeBar()));

//         print(userCredential.user?.displayName);
//         print(userCredential.user?.email);
//         print(userCredential.user?.emailVerified);
//       } else {
//         // User cancelled the sign-in flow
//         return null;
//       }
//     } on FirebaseAuthException catch (e) {
//       print('Failed with error code: ${e.code}');
//       print(e.message);
//     }
//   }

//   //Sign out
//   signOut() async {
//     await auth.signOut();
//   }
// }

import 'package:borrow_app/screen/HomeBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

final AuthService authService = AuthService();

class AuthService {
  // Dependencies
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Shared State for Widgets
  late Stream<User?> user; // firebase user
  late Stream<Map<String, dynamic>> profile; // custom user data in Firestore
  final PublishSubject<bool> loading = PublishSubject<bool>();

  // constructor
  AuthService() {
    user = _auth.authStateChanges();

    profile = user.switchMap(
      (User? u) {
        if (u != null) {
          return _db.collection('user').doc(u.uid).snapshots().map((snap) {
            Map<String, dynamic> data = snap.data() as Map<String, dynamic>;
            data['photoURL'] = u.photoURL;
            return data;
          });
        } else {
          return Stream.value({});
        }
      },
    );
  }

  Future<User?> googleSignIn(BuildContext context) async {
    // Start
    loading.add(true);

    try {
      // Step 1
      GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser != null) {
        // Step 2
        GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        User? user = userCredential.user;

        if (user != null) {
          // Step 3
          await updateUserData(user);

          // Get.off(HomeBar);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeBar()),
          );

          // Retrieve the email from Firebase user
          String? email = user.email ?? googleUser.email;

          // Done
          loading.add(false);
          print("signed in " + user.displayName!);
          print("Email: $email");
          return user;
        }
      }
    } catch (error) {
      print("Error signing in with Google: $error");
    }

    loading.add(false);
    return null;
  }

  Future<void> updateUserData(User user) async {
    DocumentReference ref = _db.collection('user').doc(user.uid);
    GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    String email = googleUser!.email;

    return ref.set({
      'uid': user.uid,
      'Email': email,
      'role': 'Student',
      'ProfileImageUrl': user.photoURL,
      'Phone': user.phoneNumber,
      'FullName': user.displayName,
      'lastSeen': DateTime.now()
    }, SetOptions(merge: true));
  }

  Future<void> signOut() async {
    _auth.signOut();
    _googleSignIn.signOut();
  }
}
