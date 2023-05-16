import 'package:borrow_app/screen/HomeBar.dart';
import 'package:flutter/material.dart';

class UI22 extends StatefulWidget {
  @override
  _UI22State createState() => _UI22State();
}

class _UI22State extends State<UI22> {
  List<bool> isTypeSelected = [false, false, false, true, true];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.1,
        centerTitle: true,
        title: Text(
          "Feedback",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Please select the type of the feedback",
              style: TextStyle(
                color: Color(0xFFC5C5C5),
              ),
            ),
            SizedBox(height: 25.0),
            Expanded(
              child: ListView.builder(
                itemCount: isTypeSelected.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: buildCheckItem(
                        title: _getTypeTitle(index),
                        isSelected: isTypeSelected[index]),
                    onTap: () {
                      setState(() {
                        _toggleTypeSelection(index);
                      });
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            buildFeedbackForm(),
            SizedBox(height: 20.0),
            buildNumberField(),
            Spacer(),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeBar()),
                    );
                  },
                  child: Text(
                    "SUBMIT",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  // color: Color(0xFFE5E5E5),
                  // padding: EdgeInsets.all(16.0),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  String _getTypeTitle(int index) {
    switch (index) {
      case 0:
        return "Login trouble";
      case 1:
        return "Phone number related";
      case 2:
        return "Personal profile";
      case 3:
        return "Other issues";
      case 4:
        return "Suggestions";
      default:
        return "";
    }
  }

  void _toggleTypeSelection(int index) {
    for (int i = 0; i < isTypeSelected.length; i++) {
      if (i == index) {
        isTypeSelected[i] = true;
      } else {
        isTypeSelected[i] = false;
      }
    }
  }

  buildNumberField() {
    return TextField(
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0.0),
            prefixIcon: Row(mainAxisSize: MainAxisSize.min, children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      width: 1.0,
                      color: Color(0xFFC5C5C5),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 10.0,
                    ),
                  ],
                ),
                // hintStyle: TextStyle(
                //   fontSize: 14.0,
                //   color: Color(0xFFC5C5C5),
                // ),
                // hintText: "Phone Number",
                // border: OutlineInputBorder(),
              ),
            ])));
  }

  buildFeedbackForm() {
    return Container(
      height: 200,
      child: Stack(
        children: [
          TextField(
            maxLines: 10,
            decoration: InputDecoration(
              hintText: "Please briefly describe the issue",
              hintStyle: TextStyle(
                fontSize: 13.0,
                color: Color(0xFFC5C5C5),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFE5E5E5),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 1.0,
                    color: Color(0xFFA6A6A6),
                  ),
                ),
              ),
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFE5E5E5),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.add,
                        color: Color(0xFFA5A5A5),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildCheckItem({required String title, required bool isSelected}) {
    return Container(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        children: [
          Icon(
            isSelected ? Icons.check_circle : Icons.circle,
            color: isSelected ? Colors.blue : Colors.grey,
          ),
          SizedBox(width: 10.0),
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.blue : Colors.grey),
          ),
        ],
      ),
    );
  }
}
