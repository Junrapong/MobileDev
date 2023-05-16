// import 'package:borrow_app/screen/HomeBar.dart';
// import 'package:borrow_app/screen/intro_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';

// class AuthenticationRepository extends GetxController {
//   static AuthenticationRepository get instance => Get.find();

//   //Variables
//   final _auth = FirebaseAuth.instance;
//   late final Rx<User?> firebaseUser;

//   //Will be load when app launches this func will be called and set the firebaseUser state
//   @override
//   void onReady() {
//     firebaseUser = Rx<User?>(_auth.currentUser);
//     firebaseUser.bindStream(_auth.userChanges());
//     ever(firebaseUser, _setInitialScreen);
//   }

//   /// If we are setting initial screen from here
//   /// then in the main.dart => App() add CircularProgressIndicator()
//   _setInitialScreen(User? user) {
//     user == null
//         ? Get.offAll(() => const IntroScreen())
//         : Get.offAll(() => const HomeBar());
//   }

//   //FUNC
//   Future<String?> createUserWithEmailAndPassword(
//       String email, String password) async {
//     try {
//       await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       firebaseUser.value != null
//           ? Get.offAll(() => const HomeBar())
//           : Get.to(() => const IntroScreen());
//     } on FirebaseAuthException catch (e) {
//       final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
//       return ex.message;
//     } catch (_) {
//       const ex = SignUpWithEmailAndPasswordFailure();
//       return ex.message;
//     }
//     return null;
//   }

//   Future<String?> loginWithEmailAndPassword(
//       String email, String password) async {
//     try {
//       await _auth.signInWithEmailAndPassword(email: email, password: password);
//     } on FirebaseAuthException catch (e) {
//       final ex = LogInWithEmailAndPasswordFailure.code(e.code);
//       return ex.message;
//     } catch (_) {
//       const ex = LogInWithEmailAndPasswordFailure();
//       return ex.message;
//     }
//     return null;
//   }

//   Future<void> logout() async => await _auth.signOut();
// }

// class SignUpWithEmailAndPasswordFailure {
//   final String message;

//   const SignUpWithEmailAndPasswordFailure(
//       [this.message = "An Unknow error occurred."]);

//   factory SignUpWithEmailAndPasswordFailure.code(String code) {
//     switch (code) {
//       case 'weak-password':
//         return const SignUpWithEmailAndPasswordFailure(
//             'Please enter a strong password.');
//       case 'invalid-email':
//         return const SignUpWithEmailAndPasswordFailure(
//             'Email is not valid or badly formatted.');
//       case 'email-already-in-use':
//         return const SignUpWithEmailAndPasswordFailure(
//             'An account already exists for that mail.');
//       case 'operation-not-allowed':
//         return const SignUpWithEmailAndPasswordFailure(
//             'Operation is not allowed.');
//       case 'user-disabled':
//         return const SignUpWithEmailAndPasswordFailure(
//             'This user has been disabled.');
//       default:
//         return const SignUpWithEmailAndPasswordFailure();
//     }
//   }
// }

// class LogInWithEmailAndPasswordFailure {
//   final String message;

//   const LogInWithEmailAndPasswordFailure(
//       [this.message = "An Unknow error occurred."]);

//   factory LogInWithEmailAndPasswordFailure.code(String code) {
//     switch (code) {
//       case 'weak-password':
//         return const LogInWithEmailAndPasswordFailure(
//             'Please enter a strong password.');
//       case 'invalid-email':
//         return const LogInWithEmailAndPasswordFailure(
//             'Email is not valid or badly formatted.');
//       case 'email-already-in-use':
//         return const LogInWithEmailAndPasswordFailure(
//             'An account already exists for that mail.');
//       case 'operation-not-allowed':
//         return const LogInWithEmailAndPasswordFailure(
//             'Operation is not allowed.');
//       case 'user-disabled':
//         return const LogInWithEmailAndPasswordFailure(
//             'This user has been disabled.');
//       default:
//         return const LogInWithEmailAndPasswordFailure();
//     }
//   }
// }
