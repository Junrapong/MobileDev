void main() {
  // change this to your ID
  String id = '6431501013';

  int sum = 0;
  for (int i = 0; i < id.length; i++) {
    int value = int.parse(id[i]);
    sum = sum + value;
  }
  print('Sum of $id = $sum');
}
