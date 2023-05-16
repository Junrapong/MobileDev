import 'package:borrow_app/screen/Setting.dart';
import 'package:flutter/material.dart';

class AllItem extends StatefulWidget {
  const AllItem({super.key});

  @override
  State<AllItem> createState() => _AllItemState();
}

class _AllItemState extends State<AllItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        iconTheme: const IconThemeData(
          color: Colors.black, // <-- SEE HERE
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Setting(),
                      ));
                });
              },
              icon: const Icon(Icons.settings))
        ],
        backgroundColor: Colors.white,
        elevation: 0.1,
        title: Center(
          child: const Text(
            'All item',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            const SizedBox(width: 15),
            Center(
              // add an elevation
              child: Column(
                children: [
                  Material(
                    elevation: 6,
                    // Size the button
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      // Inkwell
                      child: InkWell(
                        radius: 100,
                        // display a snackbar on tap
                        onTap: () {
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Hello There!'),
                              duration: Duration(milliseconds: 1500),
                            ),
                          );
                        },
                        // implement the image with Ink.image
                        child: Ink.image(
                          fit: BoxFit.cover,
                          image: const NetworkImage(
                              'https://musicspace.co.th/wp-content/uploads/2017/03/focusrite_Scarlett-Solo-studio-pack_Gen2.jpg'),
                        ),
                      ),
                    ),
                  ),
                  Text('data')
                ],
              ),
            ),
            Row(children: [
              const SizedBox(width: 15),
              Center(
                // add an elevation
                child: Column(
                  children: [
                    Material(
                      elevation: 6,
                      // Size the button
                      child: SizedBox(
                        width: 150,
                        height: 150,
                        // Inkwell
                        child: InkWell(
                          radius: 100,
                          // display a snackbar on tap
                          onTap: () {
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Hello There!'),
                                duration: Duration(milliseconds: 1500),
                              ),
                            );
                          },
                          // implement the image with Ink.image
                          child: Ink.image(
                            fit: BoxFit.cover,
                            image: const NetworkImage(
                                'https://musicspace.co.th/wp-content/uploads/2017/03/focusrite_Scarlett-Solo-studio-pack_Gen2.jpg'),
                          ),
                        ),
                      ),
                    ),
                    const Text('data'),
                  ],
                ),
              ),
            ]),
          ])),
    );
  }
}
