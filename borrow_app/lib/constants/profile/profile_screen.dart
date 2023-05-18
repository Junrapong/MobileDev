import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:borrow_app/constants/profile/update_profile_screen.dart';
import 'package:borrow_app/constants/text_strings.dart';
import 'package:borrow_app/screen/faq.dart';
import 'package:borrow_app/screen/history.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../screen/intro_screen.dart';
import '../../widget/auth_service.dart';

FirebaseAuth auth = FirebaseAuth.instance;
// get the current user

//final user = FirebaseAuth.instance.currentUser;

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? name;
  String? email;
  String? phone;
  String? school;
  String? studentid;
  String? profileurl;
  // get user info
  Future<void> getData() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      FirebaseFirestore.instance
          .collection('user')
          .doc(currentUser.uid)
          .get()
          .then((value) async {
        if (value.exists) {
          setState(() {
            email = value.data()!["Email"];
            name = value.data()!["FullName"];
            phone = value.data()!["Phone"];
            school = value.data()!["school"];
            studentid = value.data()!["studentId"];
            profileurl = value.data()!["ProfileImageUrl"];
          });
        }
      });
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, // <-- SEE HERE
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.1,
        title: const Text(
          tProfile,
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
            backgroundColor: Colors.white,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: CachedNetworkImage(
                    imageUrl: profileurl ?? "",
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text('Name: $name'),
              Text('ID: $studentid'),
              Text('Phone: $phone'),
              Text('School: $school'),
              Text('Email: ${FirebaseAuth.instance.currentUser?.email ?? ""}'),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UpdateProfileScreen(
                                    imgurl: profileurl ?? '',
                                  )));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      side: BorderSide.none,
                      shape: const StadiumBorder(),
                    ),
                    child: const Text(
                      tEditProfile,
                      style: TextStyle(color: Colors.amber),
                    ),
                  )),
              const SizedBox(
                height: 30,
              ),
              const Divider(),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                  title: "History",
                  icon: LineAwesomeIcons.history,
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const History()),
                    );
                  }),
              ProfileMenuWidget(
                  title: "FAQ",
                  icon: LineAwesomeIcons.exclamation_circle,
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FAQ()),
                    );
                  }),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      AuthService().signOut();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const IntroScreen()),
                        ((route) => false),
                      );
                    });
                  },
                  child: Text('Logout'.toUpperCase()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textcolor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textcolor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.yellow.withOpacity(0.1),
        ),
        child: Icon(
          icon,
          color: const Color.fromARGB(255, 100, 8, 238),
        ),
      ),
      title: Text(title, style: Theme.of(context).textTheme.bodyText1),
      trailing: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.grey.withOpacity(0.1)),
        child: const Icon(LineAwesomeIcons.angle_right,
            size: 18.0, color: Colors.grey),
      ),
    );
  }
}
