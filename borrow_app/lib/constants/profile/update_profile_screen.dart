import 'package:borrow_app/constants/profile/profile_screen.dart';
import 'package:borrow_app/constants/text_strings.dart';
import 'package:borrow_app/screen/HomeBar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../widget/validator.dart';

class UpdateProfileScreen extends StatefulWidget {
  final String imgurl;

  UpdateProfileScreen({required this.imgurl});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

final formKey = GlobalKey<FormState>();

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  String _imageUrl = '';

  void updateProfileData() async {
    try {
      final String uid = FirebaseAuth.instance.currentUser!.uid;

      await FirebaseFirestore.instance.collection('user').doc(uid).update({
        'FullName': _nameController.text,
        'Phone': _phoneNumberController.text,
        'ProfileImageUrl': _imageUrl,
      });

      print('Profile data updated successfully.');
    } catch (e) {
      print('Error updating profile data: $e');
    }
  }

  Future<void> _showImageUploadDialog(BuildContext context) async {
    TextEditingController urlController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Upload Image'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: urlController,
                decoration: InputDecoration(labelText: 'Image URL'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  _imageUrl = urlController.text;
                });
                Navigator.pop(dialogContext);
              },
              child: Text('Upload'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.1,
        title: const Text(
          tEditProfile,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: CachedNetworkImage(
                        imageUrl: widget.imgurl, // Updated to use _imageUrl
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.black,
                      ),
                      child: IconButton(
                        icon: const Icon(
                          LineAwesomeIcons.camera,
                          color: Colors.amber,
                          size: 20,
                        ),
                        onPressed: () {
                          _showImageUploadDialog(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: validateFullName,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _phoneNumberController,
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: validatorPhoneNumber,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          final isValidForm = formKey.currentState!.validate();
                          if (isValidForm) {
                            updateProfileData();
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeBar()),
                                (route) => false);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          side: BorderSide.none,
                          shape: const StadiumBorder(),
                        ),
                        child: const Text(
                          'Save Profile',
                          style: TextStyle(color: Colors.amber),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
