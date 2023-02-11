import 'package:flutter/material.dart';

class AppInterface extends StatelessWidget {
  const AppInterface({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[200],
      // appBar: AppBar(
      //   title: const Text('Title'),
      // ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Container(
                child: const Text(
                  'Wedding Organizer',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: const Text('Pre-wedding, Photo, Party',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {},
                  child: const Text(
                    'Our services',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const Spacer(),
              Container(
                child: const Text('345 Moo 1 Tasud Chiang Rai, Thailand',
                    style:
                        TextStyle(color: Color.fromARGB(255, 240, 237, 237))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
