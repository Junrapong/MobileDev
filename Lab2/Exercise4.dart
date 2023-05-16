import 'dart:io';

void main(List<String> args) {
  while (true) {
    stdout.write('Enter temperature or q to quit: ');
    String? temperature = stdin.readLineSync();
    stdout.write('\n');
    int? temp = int.tryParse(temperature!);
    if (temp != null) {
      if (temp < 25) {
        print('Cold');
      } else if (temp <= 30) {
        print('Warm');
      } else if (temp > 30) {
        print('Hot');
      }
    } else if (temperature == "q") {
      break;
    } else {
      print('Error please input only an integer or q');
    }
    stdout.write('\n');
  }
  print('Good bye');
}
