import 'package:borrow_app/screen/DashBoard.dart';
import 'package:borrow_app/screen/HomeBar.dart';
import 'package:borrow_app/screen/changepss.dart';
import 'package:borrow_app/screen/faq.dart';
import 'package:borrow_app/screen/history.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        //wrap with PreferredSize
        preferredSize: const Size.fromHeight(100),

        //height of appbar
        child: AppBar(
          title: ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: CachedNetworkImage(
              imageUrl:
                  "https://images.unsplash.com/photo-1509631179647-0177331693ae?ix",
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
          ), //appbar title
          backgroundColor: Color.fromARGB(255, 196, 21, 21),

          //appbar background color
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            'History',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: ListView(children: <Widget>[
              ListTile(
                title: const Text("view history"),
                leading: const Icon(Icons.history_edu),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const History()),
                    );
                  });
                },
              ),
              const Text(
                'Account',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              ListTile(
                title: const Text("Profile"),
                leading: const Icon(Icons.person),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  setState(() {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeBar()),
                      ((route) => false),
                    );
                  });
                },
              ),
              ListTile(
                title: const Text("Change Password"),
                leading: const Icon(Icons.lock),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ChangePassword()),
                    );
                  });
                },
              ),
              // ListTile(
              //   title: const Text("Notification"),
              //   leading: const Icon(Icons.notifications),
              //   trailing: const Icon(Icons.chevron_right),
              //   onTap: () {
              //     setState(() {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const Notificationn()),
              //       );
              //     });
              //   },
              // ),
              const Text(
                'More',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              ListTile(
                title: const Text("Rate & Review"),
                leading: const Icon(Icons.star),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Dashboard()),
                    );
                  });
                },
              ),
              ListTile(
                title: const Text("FAQ"),
                leading: const Icon(Icons.help),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FAQ()),
                    );
                  });
                },
              ),

              //   appBar: AppBar(
              //     leading: const BackButton(
              //       color: Colors.black, // <-- SEE HERE
              //     ),
              //     backgroundColor: Colors.red,
              //     title: const CircleAvatar(
              //       backgroundImage: NetworkImage(
              //           'https://upload.wikimedia.org/wikipedia/commons/0/07/Prayut_2022.jpg'),
              //       radius: 35,
              //     ),
              //     // title: const Text('Profile'),
              //   ),
            ]),
          ),
        ]),
      ),
    );
  }
}
