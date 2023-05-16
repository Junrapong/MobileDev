// import 'package:borrow_app/model/user_model.dart';
// import 'package:borrow_app/widget/auth_repository.dart';
// import 'package:borrow_app/widget/user_repository.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ProfileController extends GetxController {
//   static ProfileController get instance => Get.find();
//     final email = TextEditingController();
//     final password = TextEditingController();
//     final fullName = TextEditingController();
//     final phoneNumber = TextEditingController();
//     final major = TextEditingController();
//     final studentId = TextEditingController();



//   final _authRepo = Get.put(AuthenticationRepository());
//   final _userRepo = Get.put(UserRepository());
//   getUserData() {
//     final email = _authRepo.firebaseUser.value?.email;
//     if (email != null) {
//       return _userRepo.getUserDetails(email);
//     } else {
//       Get.snackbar("Error", "Login to continue");
//     }
//   }

//   Future<List<UserModel>> getAllUser() async => await _userRepo.allUser();

//   updateRecord(UserModel user) async {
//     await _userRepo.updateUserRecord(user);
//   }
// }
