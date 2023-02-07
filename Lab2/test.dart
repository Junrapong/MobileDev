import 'dart:io'; //io = input output   void ไม่จำเป็นต้องมีค่า

void main(List<String> args) {
  // stdout.write('Enter name : ');
  // String? name = stdin.readLineSync(); //
  // // print('Hello $name');
  // // String? name;  //? เก็บตัวแปรได้ทั้ง 2 แบบ
  // // name = null;
  // // name = 'Peter';
  // String name2 = ' ';
  // //? ให้ตัวแปรส่งค่า null และไม่ null (เก็บได้ 2 ค่า)
  // //! ให้ตัวแปรส่งค่าไม่เป็นค่า null เสมอ *มีความเสี่ยง
  // if (name != null) {
  //   name2 = name;
  // }

  // String? name;
  // // if (name != null) { //check null
  // //   print(name.length);
  // // }
  // name = null;
  // print(name?.length); //เรียกใช้ก็ต่อเมื่อ name ไม่เป็นค่า null

  stdout.write('Enter age : ');
  String? age = stdin.readLineSync();
  if (age != null) {
    int? a = int.tryParse(age);
    if (a != null) {
      print('Next year you will be ${a + 1} year old');
    } else {
      print('Enter only numner');
    }
  } else {
    print('Enter only numner');
  }
}
