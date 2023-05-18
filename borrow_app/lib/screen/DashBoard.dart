import 'package:borrow_app/screen/Setting.dart';
import 'package:borrow_app/screen/itemDetials.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/utils.dart';
import '../widget/get_products_info.dart';
import 'catagory_display_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<String> docIDs = [];
  // CollectionReference products =
  //     FirebaseFirestore.instance.collection('products');
  final user = FirebaseAuth.instance.currentUser;

  CollectionReference products =
      FirebaseFirestore.instance.collection('products');

  Future getDocId() async {
    await products.get().then(
          (snapshot) => snapshot.docs.forEach(
            (document) {
              print(document.reference);
              docIDs.add(document.reference.id);
            },
          ),
        );
  }

  late final String? fontFamily;
  @override
  Color myColor = const Color(0xFFB92B27);
  Color myColor1 = const Color(0xFF1565C0);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Hello! ',
              style: kNormalStyle.copyWith(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                fontFamily: 'Raleway',
              ),
            ),
            const Spacer(flex: 10),
          ],
        ),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         setState(() {
        //           Navigator.pushAndRemoveUntil(
        //             context,
        //             MaterialPageRoute(builder: (context) => const Setting()),
        //             ((route) => false),
        //           );
        //         });
        //       },
        //       icon: const Icon(
        //         FontAwesomeIcons.gear,
        //         color: Colors.black87,
        //         size: 20,
        //       ))
        // ],
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 8),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Search all products',
                    suffixIcon: Icon(Icons.search_outlined),
                    suffixIconColor: Colors.black,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 0, 0, 0),
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 0, 0, 0),
                        width: 2.0,
                      ),
                    )),
              ),
            ),
            Flexible(
              child: FutureBuilder(
                future: getDocId(),
                builder: (context, snapshot) {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemCount: docIDs.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  ItemDetails(docIDs[index], documentId: '')));
                        },
                        child: Card(
                          child: Stack(
                            alignment: FractionalOffset.bottomCenter,
                            children: <Widget>[
                              GetImages(documentId: docIDs[index]),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: const Color.fromARGB(255, 57, 72, 103),
                                ),
                                alignment: Alignment.topCenter,
                                height: 30.0,
                                child: Column(
                                  children: [
                                    const SizedBox(height: 3),
                                    GetInfoProducts(documentId: docIDs[index]),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                  //return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
        //     // bottom: false,
        //     child: Column(
        //       children: [
        //         Container(
        //           margin: const EdgeInsets.only(left: 40.0, right: 40.0),
        //           child: SizedBox(
        //             child: TextFormField(
        //               //textAlign: TextAlign.center,
        //               decoration: InputDecoration(
        //                 hintText: 'Search',
        //                 hintStyle: const TextStyle(fontSize: 15),
        //                 border: OutlineInputBorder(
        //                   borderRadius: BorderRadius.circular(30.0),
        //                 ),
        //                 // contentPadding: EdgeInsets.symmetric(vertical: 2),
        //                 contentPadding:
        //                     const EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
        //                 suffixIcon: const Icon(
        //                   FontAwesomeIcons.magnifyingGlass,
        //                   size: 20,
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ),
        //         const SizedBox(
        //           height: 8,
        //         ),
        //         Container(
        //           height: 50,
        //           child: ListView(
        //             scrollDirection: Axis.horizontal,
        //             children: <Widget>[
        //               Padding(
        //                 padding: const EdgeInsets.all(8.0),
        //                 child: Container(
        //                   child: ElevatedButton(
        //                     onPressed: () {
        //                       setState(() {
        //                         Navigator.push(
        //                             context,
        //                             MaterialPageRoute(
        //                               builder: (context) => const AllItem(),
        //                             ));
        //                       });
        //                     },
        //                     style: ElevatedButton.styleFrom(
        //                       shape: const StadiumBorder(),
        //                       backgroundColor: Colors.purple[800],
        //                     ),
        //                     child: const Text('ALL'),
        //                   ),
        //                 ),
        //               ),
        //               Padding(
        //                 padding: const EdgeInsets.all(8.0),
        //                 child: Container(
        //                   child: ElevatedButton(
        //                     onPressed: () {},
        //                     style: ElevatedButton.styleFrom(
        //                       shape: const StadiumBorder(),
        //                       backgroundColor: Colors.purple[800],
        //                     ),
        //                     child: const Text('เครื่องใช้ไฟฟ้า'),
        //                   ),
        //                 ),
        //               ),
        //               Padding(
        //                 padding: const EdgeInsets.all(8.0),
        //                 child: Container(
        //                   child: ElevatedButton(
        //                     onPressed: () {},
        //                     style: ElevatedButton.styleFrom(
        //                       shape: const StadiumBorder(),
        //                       backgroundColor: Colors.purple[800],
        //                     ),
        //                     child: const Text('อุปกรณ์เครื่องเสียง'),
        //                   ),
        //                 ),
        //               ),
        //               Padding(
        //                 padding: const EdgeInsets.all(8.0),
        //                 child: Container(
        //                   child: ElevatedButton(
        //                     onPressed: () {},
        //                     style: ElevatedButton.styleFrom(
        //                       shape: const StadiumBorder(),
        //                       backgroundColor: Colors.purple[800],
        //                     ),
        //                     child: const Text('Tech'),
        //                   ),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Column(
        //             children: [
        //               Row(
        //                 children: [
        //                   const SizedBox(width: 15),
        //                   Center(
        //                     // add an elevation
        //                     child: Material(
        //                       elevation: 6,
        //                       // Size the button
        //                       child: SizedBox(
        //                         width: 150,
        //                         height: 150,
        //                         // Inkwell
        //                         child: InkWell(
        //                           radius: 100,
        //                           // display a snackbar on tap
        //                           onTap: () {
        //                             ScaffoldMessenger.of(context).clearSnackBars();
        //                             ScaffoldMessenger.of(context).showSnackBar(
        //                               const SnackBar(
        //                                 content: Text('Hello There!'),
        //                                 duration: Duration(milliseconds: 1500),
        //                               ),
        //                             );
        //                           },
        //                           // implement the image with Ink.image
        //                           child: Ink.image(
        //                             fit: BoxFit.cover,
        //                             image: const NetworkImage(
        //                                 'https://www.atprosound.com/wp-content/uploads/2020/03/BEHRINGER-FBQ-6200-1.jpg'),
        //                           ),
        //                         ),
        //                       ),
        //                     ),
        //                   ),
        //                   const SizedBox(width: 15),
        //                   Center(
        //                     // add an elevation
        //                     child: Material(
        //                       elevation: 6,
        //                       // Size the button
        //                       child: SizedBox(
        //                         width: 150,
        //                         height: 150,
        //                         // Inkwell
        //                         child: InkWell(
        //                           radius: 100,
        //                           // display a snackbar on tap
        //                           onTap: () {
        //                             ScaffoldMessenger.of(context).clearSnackBars();
        //                             ScaffoldMessenger.of(context).showSnackBar(
        //                               const SnackBar(
        //                                 content: Text('Hello There!'),
        //                                 duration: Duration(milliseconds: 1500),
        //                               ),
        //                             );
        //                           },
        //                           // implement the image with Ink.image
        //                           child: Ink.image(
        //                             fit: BoxFit.cover,
        //                             image: const NetworkImage(
        //                                 'https://musicspace.co.th/wp-content/uploads/2017/03/focusrite_Scarlett-Solo-studio-pack_Gen2.jpg'),
        //                           ),
        //                         ),
        //                       ),
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ],
        //           ),
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Row(
        //             children: [
        //               const SizedBox(width: 15),
        //               Center(
        //                 // add an elevation
        //                 child: Column(
        //                   children: [
        //                     Material(
        //                       elevation: 6,
        //                       // Size the button
        //                       child: SizedBox(
        //                         width: 150,
        //                         height: 150,
        //                         // Inkwell
        //                         child: InkWell(
        //                           radius: 100,
        //                           // display a snackbar on tap
        //                           onTap: () {
        //                             ScaffoldMessenger.of(context).clearSnackBars();
        //                             ScaffoldMessenger.of(context).showSnackBar(
        //                               const SnackBar(
        //                                 content: Text('Hello There!'),
        //                                 duration: Duration(milliseconds: 1500),
        //                               ),
        //                             );
        //                           },
        //                           // implement the image with Ink.image
        //                           child: Ink.image(
        //                             fit: BoxFit.cover,
        //                             image: const NetworkImage(
        //                                 'https://musicspace.co.th/wp-content/uploads/2017/03/focusrite_Scarlett-Solo-studio-pack_Gen2.jpg'),
        //                           ),
        //                         ),
        //                       ),
        //                     ),
        //                     Text('data')
        //                   ],
        //                 ),
        //               ),
        //               const SizedBox(width: 15),
        //               Center(
        //                 child: Column(
        //                   children: [
        //                     GestureDetector(
        //                       onTap: () {
        //                         setState(() {
        //                           Navigator.pushAndRemoveUntil(
        //                             context,
        //                             MaterialPageRoute(
        //                                 builder: (context) => const Login()),
        //                             ((route) => false),
        //                           );
        //                         });
        //                       },
        //                       child: SizedBox(
        //                         width: 150,
        //                         height: 150,
        //                         child: Image.network(
        //                           'https://www.atprosound.com/wp-content/uploads/2020/03/BEHRINGER-FBQ-6200-1.jpg',
        //                           fit: BoxFit.cover,
        //                         ),
        //                       ),
        //                     ),
        //                     const Text('data'),
        //                   ],
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //         // Positioned(
        //         //   bottom: 20,
        //         //   left: 20,
        //         //   right: 20,
        //         //   child: Container(
        //         //     alignment: Alignment.center,
        //         //     height: 50,
        //         //     decoration: BoxDecoration(
        //         //       color: kBackgroundColor,
        //         //       borderRadius: BorderRadius.circular(40.0),
        //         //     ),
        //         //   ),
        //         // ),
        //       ],
        //     ),
      ),
    );
  }
}
