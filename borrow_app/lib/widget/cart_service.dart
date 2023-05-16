// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// final FirebaseAuth _auth = FirebaseAuth.instance;
// Future addBorrow(String start, String end, String productName,
//     String productImage, int day) async {
//   final User? user = _auth.currentUser;
//   final uid = user!.uid;
//   await FirebaseFirestore.instance
//       .collection('user')
//       .doc(uid)
//       .collection('Pending')
//       .doc(productName)
//       .set({
//     'date_start': start,
//     'date_end': end,
//     'name': productName,
//     'image': productImage,
//     'day': day,
//     'status': 'pending',
//   });
// }
