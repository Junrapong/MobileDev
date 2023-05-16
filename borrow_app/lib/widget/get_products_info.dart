import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetInfoProducts extends StatelessWidget {
  const GetInfoProducts({super.key, required this.documentId});
  final String documentId;
  @override
  Widget build(BuildContext context) {
    CollectionReference products =
        FirebaseFirestore.instance.collection('products');

    return FutureBuilder<DocumentSnapshot>(
        future: products.doc(documentId).get(),
        builder: ((context, snapshot) {
          //Error Handling conditions
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return const Text("Document does not exist");
          }
          //Data is output to the user
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '${data['products_name']}',
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  // Text(
                  //   '   ${data['products_id']} ',
                  //   style: const TextStyle(
                  //       color: Color.fromARGB(255, 254, 110, 100),
                  //       fontSize: 20,
                  //       fontWeight: FontWeight.bold),
                  // ),
                ],
              ),
            );
          }
          return const Text(
            'Loading...',
            style: TextStyle(color: Colors.white, fontSize: 20),
          );
        }));
  }
}

class GetImages extends StatelessWidget {
  const GetImages({super.key, required this.documentId});
  final String documentId;

  @override
  Widget build(BuildContext context) {
    CollectionReference products =
        FirebaseFirestore.instance.collection('products');
    return FutureBuilder<DocumentSnapshot>(
      future: products.doc(documentId).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return FittedBox(
            alignment: Alignment.center,
            fit: BoxFit.contain,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  child: Image.network(
                    data['image'],
                    height: 150,
                    width: 150,
                  ),
                ),
              ],
            ),
          );
        }
        return const CircularProgressIndicator();
      }),
    );
  }
}
