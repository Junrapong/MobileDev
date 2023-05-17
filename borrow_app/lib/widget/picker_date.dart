import 'package:borrow_app/screen/history.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerPage extends StatefulWidget {
  final String productName;
  final String productImage;

  DatePickerPage({
    required this.productName,
    required this.productImage,
  });

  @override
  _DatePickerPageState createState() => _DatePickerPageState();
}

// class _DatePickerPageState extends State<DatePickerPage> {
//   DateTimeRange dateRange =
//       DateTimeRange(start: DateTime(2023, 5, 22), end: DateTime(2023, 5, 28));
class _DatePickerPageState extends State<DatePickerPage> {
  DateTimeRange dateRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now().add(Duration(days: 1)),
  );

  // Future<QuerySnapshot> getData() async {
  //   final User? user = _auth.currentUser;
  //   final _uid = user!.uid;
  //   QuerySnapshot querySnapshot = await FirebaseFirestore.instance
  //       .collection('user')
  //       .doc(_uid)
  //       .collection('Pending')
  //       .get();
  //   return querySnapshot;
  // }
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> sendCollectionToAnotherCollection(
      String start, String end, int diff) async {
    final User? user = _auth.currentUser;
    final _uid = user!.uid;

    // Get the documents from the source collection
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('user')
        .doc(_uid)
        .collection('Pending')
        .get();

    snapshot.docs.forEach(
      (DocumentSnapshot doc) async {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        //print(data);
        // สร้างเอกสารใน collection "UserRequest" และเก็บข้อมูลภายในเอกสารด้วย .set()

        await FirebaseFirestore.instance
            .collection('UserRequest')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('Item')
            .doc(data['name'])
            .set(
          {
            'name': data['name'],
            'image': data['image'],
          },
        );
        await FirebaseFirestore.instance
            .collection('UserRequest')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .set(
          {
            'email': FirebaseAuth.instance.currentUser!.email,
            'start': start,
            'end': end,
            'diff': diff,
            'status': 'pending',
          },
        );
        FirebaseFirestore.instance
            .collection('user')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('Pending')
            .doc(data['name'])
            .delete();
      },
    );
  }

  // Future addBorrow(
  //   String start,
  //   String end,
  //   String productName,
  //   String productImage,
  //   int day,
  // ) async {
  //   final User? user = _auth.currentUser;
  //   final _uid = user!.uid;
  //   await FirebaseFirestore.instance
  //       .collection('user')
  //       .doc(_uid)
  //       .collection('Pending')
  //       .doc(productName)
  //       .set({
  //     'date_start': start,
  //     'date_end': end,
  //     'name': productName,
  //     'image': productImage,
  //     'day': day,
  //     'status': 'pending',
  //   });
  // }

  // Future addRequestAdmin(String productName, String productImage) async {
  //   final User? user = _auth.currentUser;
  //   final _uid = user!.uid;
  //   final _email = user.email;
  //   await FirebaseFirestore.instance
  //       .collection('UserRequest')
  //       .doc(productName)
  //       .set({
  //     // 'date_start': start,
  //     // 'date_end': end,
  //     'name': productName,
  //     'image': productImage,
  //     // 'day': day,
  //     'userId': _uid,
  //     'useremail': _email,
  //   });
  //   //sendCollectionToAnotherCollection();
  // }

  // Future updateData() async {
  //   final productsQuery = FirebaseFirestore.instance
  //       .collection('products')
  //       .where('products_name', isEqualTo: widget.productName);

  //   final querySnapshot = await productsQuery.get();
  //   final documentSnapshot = querySnapshot.docs.first;
  //   final documentId = documentSnapshot.id;

  //   final documentReference =
  //       FirebaseFirestore.instance.collection('products').doc(documentId);

  //   documentReference.update({
  //     'status': 'pending',
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;
    final diff = dateRange.duration;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      final picked = await pickerDate(context);
                      setState(() {
                        dateRange = DateTimeRange(
                            start: picked ?? dateRange.start,
                            end: dateRange.end);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      onPrimary: Colors.amber,
                    ),
                    child: Text(
                      DateFormat('yyyy/MM/dd').format(start),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final picked = await pickerDate(context);
                      setState(() {
                        dateRange = DateTimeRange(
                            start: dateRange.start,
                            end: picked ?? dateRange.end);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      onPrimary: Colors.amber,
                    ),
                    child: Text(
                      DateFormat('yyyy/MM/dd').format(end),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Text(
              'Borrow for: ${diff.inDays} days \nStart: ${DateFormat('yyyy/MM/dd').format(start)} End: ${DateFormat('yyyy/MM/dd').format(end)}',
              style: const TextStyle(fontSize: 15),
            ),
          ),
          const Divider(color: Colors.grey, thickness: 1),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  onPrimary: Colors.amber,
                ),
                onPressed: () async {
                  if (diff.inDays > 7) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor:
                              const Color.fromARGB(255, 245, 243, 243),
                          title: const Text('Wrong Condition!'),
                          content: const Text('You can borrow only 1-7 days'),
                          actions: <Widget>[
                            TextButton(
                              child: const Text(
                                'OK',
                                style: TextStyle(color: Colors.black),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    await sendCollectionToAnotherCollection(
                      DateFormat('yyyy/MM/dd').format(start),
                      DateFormat('yyyy/MM/dd').format(end),
                      diff.inDays,
                    );

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const History(),
                      ),
                    );
                  }
                },
                // style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                child: const Text('Confirm'),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<DateTime?> pickerDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: dateRange.start,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.dark(
              surface: Colors.black,
              primary: Colors.grey,
            ),
          ),
          child: child ?? Container(),
        );
      },
    );

    if (picked != null) {
      return DateTime(picked.year, picked.month, picked.day);
    }

    return null;
  }
}
