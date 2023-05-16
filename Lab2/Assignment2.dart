import 'dart:io';

var account = [
  {'Username': 'aaa', 'Password': '1111', 'Role': 'admin'},
  {'Username': 'bbb', 'Password': '2222', 'Role': 'user'},
];
void main(List<String> args) {
  login();
}

void login() {
  print('---Login---');

  stdout.write('Username: ');
  String? user = stdin.readLineSync();

  stdout.write('Password: ');
  String? pass = stdin.readLineSync();

  if (user == account[0]['Username'] && pass == account[0]['Password']) {
    print('Welcome ${account[0]['Role'].toString()}');
      
  } 
  else if(user == account[1]['Username'] && pass == account[1]['Password']){
    print('Welcome ${account[1]['Role'].toString()}');
  }
  else {
    print('Wrong login');
  }
}
