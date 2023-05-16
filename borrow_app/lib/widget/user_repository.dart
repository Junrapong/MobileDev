// import 'package:borrow_app/model/user_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';

// class UserRepository extends GetxController {
//   static UserRepository get instance => Get.find();

//   final _db = FirebaseFirestore.instance;

//   createUser(UserModel user) async {
//     await _db.collection('user').add(user.toJson().then(
//         (value) => print('Adding done!'),
//         onError: (e) => print('Error $e')));
//   }

//   Future<UserModel> getUserDetails(String email) async {
//     final snapshot =
//         await _db.collection("Users").where("Email", isEqualTo: email).get();
//     final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
//     return userData;
//   }

//   Future<List<UserModel>> allUser() async {
//     final snapshot = await _db.collection("Users").get();
//     final userData =
//         snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
//     return userData;
//   }

//   Future<void> updateUserRecord(UserModel user) async {
//     await _db.collection("Users").doc(user.id).update(user.toJson());
//   }
// }
