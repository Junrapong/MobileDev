import 'dart:io';

int add(int n1, int n2) => n1 + n2;
int sub(int n1, int n2) => n1 - n2;
int mul(int n1, int n2) => n1 * n2;
double div(int n1, int n2) => n1 / n2;
int int_div(int n1, int n2) => n1 ~/ n2;
int mod(int n1, int n2) => n1 % n2;

void main(List<String> args) {
  stdout.write('Name : ');
  String? name = stdin.readLineSync();

  stdout.write('Number 1: ');
  int? number1 = int.parse(stdin.readLineSync()!);

  stdout.write('Number 2: ');
  int? number2 = int.parse(stdin.readLineSync()!);

  print('Output: Hi $name> $number1 + $number2 = ${add(number1, number2)}');
  print('Output: Hi $name> $number1 - $number2 = ${sub(number1, number2)}');
  print('Output: Hi $name> $number1 * $number2 = ${mul(number1, number2)}');
  print('Output: Hi $name> $number1 / $number2 = ${div(number1, number2).toStringAsFixed(2)}');
  print('Output: Hi $name> $number1 ~/ $number2 = ${int_div(number1, number2)}');
  print('Output: Hi $name> $number1 % $number2 = ${mod(number1, number2)}');
}




  // int? num1 = int.parse(number1!);
  // int? num2 = int.parse(number2!);
  //print(divide.toStringAsFixed(2));