import 'dart:io';

int count = 0;
void main(List<String> args) {
  String? input;

  while (true) {
    stdout.write('Increase(+) or decrease(-) or exit(0): ');
    input = stdin.readLineSync();
    if (input != null) {
      if (input == '+') {
        count++;
        print('Count = $count');
      } else if (input == '-') {
        count--;
        print('Count = $count');
      } 
      else if (input == "0") {
        break;
      } else {
        print('Error enter only (+) or (-) or (0)');
      }
      stdout.write('\n');
    }
  }
  print('Good bye');
}
