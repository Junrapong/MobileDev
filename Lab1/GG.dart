
void main(List<String> args) {
  // print('hello world');
  // int age = 20;
  // double pi = 3.14;
  // String name = 'Tom';
  // bool check = true;
  // var a = 5, b = false;  //ประกาศตัวแปรหลายๆตัวคนละชนิด

  // print(name +" "+ age.toString() + " year old");
  // print('$name is $age year old');
  // print('$pi is $check');

  // if(age < 20){
  //   print('Teen');

  // }
  // else{
  //   print('Adult');
  // }

  // for(int i = 1; i<=10; i++){
  //   print(i);
  // }

  //Array (List) same name
  // List<int> score = [20, 40, 60];
  // // var score1 = [24, 48, 65];
  // // print(score);
  // for(int i = 0; i < score.length; i++){
  //   print(score[i]);
  // }

  //Map store (key:value)
  // var score = {'Midtrem' : 25, 'Final': 30};
  // print(score['Midtrem']);
  // print(score['Final']);

  //List of Map
  var score = [
    {'Midterm': 20, 'Final': 15},
    {'Midterm': 10, 'Final': 15},
    {'Midterm': 15, 'Final': 20}
  ];

  int total = 0;
  for (int? i = 0; i! < score.length; i++) {
    total = total + score[i]['Final']!;
    print(total);
  }
  //print(score[0]['Final']! + score[1]['Final']! + score[2]['Final']!);
  // print(score[0]['Final']);
  // print(score[2]['Midterm']);
}
