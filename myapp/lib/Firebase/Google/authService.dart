import 'package:firebase_auth/firebase_auth.dart';
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
          return _db.collection('users').doc(u.uid).snapshots().map((snap) {
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

  Future<User?> googleSignIn() async {
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

          // Done
          loading.add(false);
          print("signed in " + user.displayName!);
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
    DocumentReference ref = _db.collection('users').doc(user.uid);

    return ref.set({
      'uid': user.uid,
      'email': user.email,
      'role': 'Student',
      'photoURL': user.photoURL,
      'phoneNumber': user.phoneNumber,
      'displayName': user.displayName,
      'lastSeen': DateTime.now()
    }, SetOptions(merge: true));
  }

  void signOut() {
    _auth.signOut();
    _googleSignIn.signOut();
  }
}
