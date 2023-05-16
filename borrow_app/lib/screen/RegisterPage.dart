import 'package:borrow_app/screen/LoginPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../model/utils.dart';
import '../widget/auth_service.dart';
import '../widget/school.dart';
import '../widget/signup_controller.dart';
import '../widget/validator.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final controller = Get.put(SignupController());
  final formKey = GlobalKey<FormState>();
  //final GlobalKey<FormFieldState> _key = GlobalKey<FormFieldState>();

  // ===function register===  firebase auth
  Future<void> register() async {
    try {
      if (mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const Login()),
          (route) => false,
        );
      }
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: controller.email.text, password: controller.password.text);
      addData();
    } on FirebaseAuthException catch (e) {
      debugPrint('Error $e');
    }
  }

  // --- Add --- firebase store
  Future<void> addData() async {
    // clear inputss
    // controller.fullName.text = '';
    // controller.email.text = '';
    // controller.studentId.text = '';
    // controller.phoneNumber.text = '';
    // controller.password.text = '';

    // // add data to db
    // String fullName = controller.fullName.text;
    // String email = controller.fullName.text;
    // String studentId = controller.fullName.text;
    // String phoneNumber = controller.fullName.text;
    // String password = controller.fullName.text;

    var data = {
      "FullName": controller.fullName.text,
      "Email": controller.email.text,
      "studentId": controller.studentId.text,
      "school": selectedValue,
      "Phone": controller.phoneNumber.text,
      "Password": controller.password.text,
      "role": 'Student',
    };
    // final FirebaseAuth _auth = FirebaseAuth.instance;
    // final User? user = _auth.currentUser;
    final uid = FirebaseAuth.instance.currentUser!.uid;

    try {
      FirebaseFirestore.instance.collection('user').doc(uid).set(data).then(
          (value) => print('Adding done!'),
          onError: (e) => print('Error $e'));
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar(e.message);
    }
  }

  bool _obscureText = true;

  void clearText() {
    controller.fullName.clear();
    controller.email.clear();
    controller.studentId.clear();
    controller.phoneNumber.clear();
    controller.password.clear();
    selectedValue = null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.black, // <-- SEE HERE
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.1,
          title: const Text(
            'Register',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Image.asset('lib/assets/log/logoScreen.png'),
                Form(
                  key: formKey,
                  //autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: controller.fullName,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(FontAwesomeIcons.userSecret),
                            label: Text('Full Name'),
                            hintText: 'Full Name',
                            border: OutlineInputBorder(),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: validateFullName,
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: controller.email,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(FontAwesomeIcons.envelope),
                            label: Text('Email'),
                            hintText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: validatorEmail,
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: controller.studentId,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(FontAwesomeIcons.idCard),
                            label: Text('Student ID'),
                            hintText: 'Student ID',
                            border: OutlineInputBorder(),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: validatorStudentId,
                        ),
                        const SizedBox(height: 10),
                        DropdownButtonFormField(
                          //key: _key,
                          decoration: const InputDecoration(
                            hintText: 'Select school',
                            labelText: 'Select school',
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                            ),
                            //filled: true,
                            //fillColor: Colors.greenAccent,
                          ),
                          value: selectedValue,
                          onChanged: (newValue) {
                            setState(() {
                              selectedValue = newValue!;
                            });
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (newValue) => newValue == null
                              ? 'Please seletc your school'
                              : null,
                          // items: List.generate(
                          //     8,
                          //     (index) => DropdownMenuItem(
                          //         value: index, child: Text("$index"))),
                          items: items
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: controller.phoneNumber,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(FontAwesomeIcons.phone),
                            label: Text('Phone Number'),
                            hintText: 'Phone Number',
                            border: OutlineInputBorder(),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: validatorPhoneNumber,
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          obscureText: _obscureText,
                          controller: controller.password,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(FontAwesomeIcons.lock),
                            label: const Text('Password'),
                            hintText: 'Password',
                            border: const OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: Icon(_obscureText
                                  ? FontAwesomeIcons.eye
                                  : FontAwesomeIcons.eyeSlash),
                              onPressed: () {
                                setState(
                                  () {
                                    _obscureText = !_obscureText;
                                  },
                                );
                              },
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: passwordValidator,
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black),
                            onPressed: () async {
                              final isValidForm =
                                  formKey.currentState!.validate();
                              if (isValidForm) {
                                await register();

                                //addData();

                                clearText();
                              }
                            },
                            child: Text(
                              'Register'.toUpperCase(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    const Text('OR'),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.black,
                          shadowColor: Colors.black,
                          side: const BorderSide(color: Colors.black, width: 2),
                        ),
                        icon:
                            //Icon(FontAwesomeIcons.google),
                            const Image(
                          image: AssetImage('lib/assets/log/google_logo.png'),
                          width: 20,
                        ),
                        onPressed: () {
                          AuthService().signInWithGoogle(context);
                        },
                        label: const Text('Sign-In with Google'),
                      ),
                    ),
                    const SizedBox(height: 8),
                    RichText(
                      text: TextSpan(
                        text: "Aleady have an Account? ",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Login'.toUpperCase(),
                            style: const TextStyle(
                              color: Colors.cyan,
                              fontWeight: FontWeight.w500,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                clearText();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Login(),
                                  ),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
