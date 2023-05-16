import 'dart:io';

void main() {
  Map<String, dynamic> student = {'name': '', 'id': 0, 'age': 0};

  stdout.write('Name: ');
  student['name'] = stdin.readLineSync();

  stdout.write('ID: ');
  student['id'] = stdin.readLineSync();

  stdout.write('Age: ');
  student['age'] = stdin.readLineSync();
  // output
  var name = student['name'];
  print('Output: Hi $name this is your Student Object');
  print('Student Name: ${student['name']}');
  print('Student ID: ${student['id']}');
  print('Age: ${student['age']}');
}
