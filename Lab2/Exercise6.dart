import 'dart:io';
import 'dart:math';

String myDail = '''
===Area calculator===
Shape
1.Square
2.Circle
''';

void main(List<String> args) {
  // print('===Area calculator===');
  // print('Shape');
  // print('1.Square');
  // print('2.Circle');
  
  stdout.write(myDail);
  stdout.write('Choose 1-2...');
  String? shape = stdin.readLineSync();

  if (shape == '1') {
    square();
  } else if (shape == '2') {
    circle();
  } else {
    print('Please input only integer 1 or 2');
  }
}

void square() {
  stdout.write('Enter size: ');
  String? s = stdin.readLineSync();

  if (s != null) {
    int? size = int.tryParse(s);

    if (size != null) {
      int? area_square = size * size;
      stdout.write('Area of square = ${area_square.toStringAsFixed(2)}');
    } else {
      print('Error please input only an integer');
    }
  } else {
    print('Error please input only an integer');
  }
}

void circle() {
  stdout.write('Enter radius: ');
  String? r = stdin.readLineSync();

  if (r != null) {
    int? radius = int.tryParse(r);

    if (radius != null) {
      double area_circle = pi * (radius * radius);
      stdout.write('Area of circle = ${area_circle.toStringAsFixed(2)}');
    } else {
      print('Error please input only an integer');
    }
  } else {
    print('Error please input only an integer');
  }
}
