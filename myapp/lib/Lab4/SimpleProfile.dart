import 'package:flutter/material.dart';

class SimpleProfile extends StatelessWidget {
  const SimpleProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[500],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://w0.peakpx.com/wallpaper/535/290/HD-wallpaper-iron-man-mask-super-heroes-behance-digital-art-artist-art-minimalism-iron-man-avenger-thumbnail.jpg'),
              radius: 40,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: Text(
                'Iron Man',
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 25),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text('FLUTTER DEVELOPER',
                  style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(right: 5, left: 5),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.phone,
                      color: Colors.red[500],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '+66 012 345 6789',
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(right: 5, left: 5),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.email,
                      color: Colors.red[500],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'iron.man@lamduan.mfu.ac.th',
                      style: TextStyle(color: Colors.black54),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
