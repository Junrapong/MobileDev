import 'package:flutter/material.dart';

import 'authService.dart';

class UserProfile extends StatefulWidget {
  @override
  UserProfileState createState() => UserProfileState();
}

class UserProfileState extends State<UserProfile> {
  late Map<String, dynamic> _profile;
  bool _loading = false;

  @override
  initState() {
    super.initState();

    // Subscriptions are created here
    authService.profile.listen((state) => setState(() => _profile = state));

    authService.loading.listen((state) => setState(() => _loading = state));
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Center(
        child: Container(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
                width: 200, height: 150, child: Text(_profile.toString()))),
      ),
      Text(_loading.toString())
    ]);
  }
}


//หน้านี้แค่โชว์ค่าที่ get ได้จากตอน signin