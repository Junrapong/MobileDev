import 'package:borrow_app/screen/Setting.dart';
import 'package:borrow_app/screen/itemDetials.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/utils.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  //List<String> docIDs = [];
  // CollectionReference products =
  //     FirebaseFirestore.instance.collection('products');
  final user = FirebaseAuth.instance.currentUser;

  CollectionReference products =
      FirebaseFirestore.instance.collection('products');

  String _searchQuery = '';

  // Future getDocId() async {
  //   await products.get().then(
  //         (snapshot) => snapshot.docs.forEach(
  //           (document) {
  //             print(document.reference);
  //             docIDs.add(document.reference.id);
  //           },
  //         ),
  //       );
  // }

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
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
                decoration: const InputDecoration(
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
                  ),
                ),
              ),
            ),
            Flexible(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('products')
                    .where('products_name',
                        isGreaterThanOrEqualTo: _searchQuery)
                    .where('products_name',
                        isLessThanOrEqualTo: _searchQuery + '\uf8ff')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    // final docIDs = snapshot.data
                    //     as List<String>; // Adjust the data type if necessary
                    List<DocumentSnapshot> snap = snapshot.data!.docs;

                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: snap.length,
                      itemBuilder: (context, index) {
                        final DocumentSnapshot document = snap[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ItemDetails(document.id),
                              ),
                            );
                          },
                          child: Card(
                            child: Stack(
                              alignment: FractionalOffset.bottomCenter,
                              children: <Widget>[
                                FittedBox(
                                  alignment: Alignment.center,
                                  fit: BoxFit.contain,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10)),
                                        child: Image.network(
                                          snap[index]['image'],
                                          height: 150,
                                          width: 150,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color:
                                        const Color.fromARGB(255, 57, 72, 103),
                                  ),
                                  alignment: Alignment.topCenter,
                                  height: 30.0,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 5),
                                      Text(
                                        '${snap[index]['products_name']}',
                                        maxLines: 1,
                                        softWrap: false,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
