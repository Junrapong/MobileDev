import 'dart:io';

void main(List<String> args) {
  stdout.write('Name : ');
  String? name = stdin.readLineSync();

  stdout.write('Star Tri Size: ');
  String? num1 = stdin.readLineSync();

  int row = int.parse(num1!);

  print('Hi $name this is your tri star');
  for (int i = 1; i <= row; i++) {
    for (int x = 1; x <= i; x++) {
      stdout.write('* ');
    }
    stdout.writeln();
  }
}
