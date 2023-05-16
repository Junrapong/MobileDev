// import 'package:cloud_firestore/cloud_firestore.dart';

// class UserModel {
//   final String? id;
//   final String fullName;
//   final String email;
//   final String studentId;
//   final String phoneNumber;
//   final String school;
//   final String password;

//   UserModel({
//     this.id,
//     required this.fullName,
//     required this.email,
//     required this.studentId,
//     required this.phoneNumber,
//     required this.school,
//     required this.password,
//   });

//   toJson() {
//     return {
//       "FullName": fullName,
//       "Email": email,
//       "studentId": studentId,
//       "Phone": phoneNumber,
//       "school": school,
//       "Password": password,
//     };
//   }

//   factory UserModel.fromSnapshot(
//       DocumentSnapshot<Map<String, dynamic>> document) {
//     final data = document.data()!;
//     return UserModel(
//         id: document.id,
//         fullName: data["fullName"],
//         email: data["email"],
//         studentId: data["studentId"],
//         phoneNumber: data["phoneNumber"],
//         school: data["school"],
//         password: data["password"]);
//   }
// }
