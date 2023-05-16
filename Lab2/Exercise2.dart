import 'dart:io';

void main(List<String> args) {
  stdout.write('Name : ');
  String? name = stdin.readLineSync();

  stdout.write('Star row: ');
  String? num1 = stdin.readLineSync();

  stdout.write('Star col: ');
  String? num2 = stdin.readLineSync();

  int row = int.parse(num1!);
  int col = int.parse(num2!);

  print('Hi $name this is your star');
  for (int i = 1; i <= row; i++) {
    for (int x = 1; x <= col; x++) {
      stdout.write('* ');
    }
    stdout.writeln();
  }
}
