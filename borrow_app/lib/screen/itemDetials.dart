import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  ItemDetails(this.itemId, {Key? key, required String documentId})
      : super(key: key) {
    _reference = FirebaseFirestore.instance.collection('products').doc(itemId);
    _futureData = _reference.get();
  }

  String itemId;
  late DocumentReference _reference;

  //_reference.get()  --> returns Future<DocumentSnapshot>
  //_reference.snapshots() --> Stream<DocumentSnapshot>
  late Future<DocumentSnapshot> _futureData;
  late Map data;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future addBorrow(
      String productName, String productImage, BuildContext context) async {
    final User? user = _auth.currentUser;
    final uid = user!.uid;

    final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('user')
        .doc(uid)
        .collection('Pending')
        .get();
    if (querySnapshot.size >= 3) {
      // User has already selected 3 products, show an error message or handle accordingly
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Product Limit Exceeded'),
            content: const Text('You can select up to 3 products.'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return;
    }

    await FirebaseFirestore.instance
        .collection('user')
        .doc(uid)
        .collection('Pending')
        .doc(productName)
        .set({
      'name': productName,
      'image': productImage,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item details'),
        backgroundColor: const Color.fromARGB(255, 57, 72, 103),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         // //add the id to the map
        //         // data['id'] = itemId;

        //         // Navigator.of(context).push(
        //         //     MaterialPageRoute(builder: (context) => EditItem(data)));
        //       },
        //       icon: const Icon(Icons.edit)),
        //   IconButton(
        //       onPressed: () {
        //         //Delete the item
        //         _reference.delete();
        //       },
        //       icon: const Icon(Icons.delete))
        // ],
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: _futureData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Some error occurred ${snapshot.error}'));
          }

          if (snapshot.hasData) {
            //Get the data
            DocumentSnapshot documentSnapshot = snapshot.data;
            data = documentSnapshot.data() as Map;

            //display the data
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      FittedBox(
                        alignment: Alignment.center,
                        fit: BoxFit.contain,
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            image: DecorationImage(
                              image: NetworkImage(
                                '${data['image']}',
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'Product name: ${data['products_name']}',
                        style: const TextStyle(fontSize: 15),
                        softWrap: false,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis, // new
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text('Product quantity: ${data['quantity']}',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 10,
                      ),
                      Text('Product price: ${data['price']}',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 10,
                      ),
                      Text('Product detail: ${data['detail']}',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 15),
                      Center(
                        child: InkWell(
                          onTap: () {
                            addBorrow(
                                data['products_name'], data['image'], context);
                            print('add');
                            Navigator.pop(context);
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.pink, Colors.lightBlue],
                                  begin: FractionalOffset(0.0, 0.0),
                                  end: FractionalOffset(1.0, 0.0),
                                  stops: [0.0, 1.0],
                                  tileMode: TileMode.mirror),
                            ),
                            width: MediaQuery.of(context).size.width - 40.0,
                            height: 50.0,
                            child: const Center(
                              child: Text(
                                'Add to cart',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
