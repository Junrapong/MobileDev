import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: Colors.black,
        centerTitle: true, //ทำให้อยู่ตรงกลาง
      ),
      body: SafeArea(
        child: Column(
          children: [
            //https://cdn-icons-png.flaticon.com/512/1946/1946392.png
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://cdn-icons-png.flaticon.com/512/1946/1946392.png'),
              radius: 30,
            ),
            Divider(
              height: 20,
              color: Colors.grey[400],
            ), //ผลักให้ column เต็มหน้าจอ
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name',
                        style: TextStyle(fontSize: 12, color: Colors.grey[300]),
                      ),
                      Text(
                        'JohnDo',
                        style: TextStyle(fontSize: 25, color: Colors.yellow),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Age',
                        style: TextStyle(fontSize: 12, color: Colors.grey[300]),
                      ),
                      Text(
                        '26',
                        style: TextStyle(fontSize: 25, color: Colors.yellow),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.email,
                            color: Colors.grey[300],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'JohnDo@gmail.com',
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey[300]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
