import 'package:flutter/material.dart';
import 'package:myapp/page1.dart';

class page3 extends StatelessWidget {
  const page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 3'),
      ),
      body: Container(
        //color: Colors.yellow,
        alignment: Alignment.topCenter, //alignment เซตตำแหน่ง
        padding: EdgeInsets.only(top: 16.00), //padding ขอบใน
        //margin: EdgeInsets.only(top: 16.00), //margin ขอบนอก
        child: ElevatedButton(
          onPressed: () {
            //back to page 1
            //Navigator.pop(context);
            //pushReplacement ไม่เก็บข้อมูลหน้าก่อนไว้ใน Stack ไปแล้วย้อนกลับมาไม่ได้
            //pushAndRemoveUntil ลบทุกอย่างใน Stack
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const page1()),
              ((route) => false),
            );
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}

//push เก็บหน้า
//pop เด้งหน้าออก
