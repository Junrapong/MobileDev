import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../screen/HomeBar.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future signInWithGoogle(BuildContext context) async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      // final GoogleSignInAccount? googleUser = await GoogleSignIn(
      //         scopes: <String>["email"], signInOption: SignInOption.standard)
      //     .signIn();

      if (googleUser != null) {
        // Obtain the authentication details from the Google user object
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        // Create a new credential using the authentication details
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // finally, lets sign in
        UserCredential userCredential =
            await auth.signInWithCredential(credential);

        // Get.off(HomeBar);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomeBar()));

        print(userCredential.user?.displayName);
        print(userCredential.user?.email);
        print(userCredential.user?.emailVerified);
      } else {
        // User cancelled the sign-in flow
        return null;
      }
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
    }
  }

  //Sign out
  signOut() async {
    await auth.signOut();
  }
}
