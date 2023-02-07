void main() {
  var products = [
    {'name': 'apple', 'price': 10},
    {'name': 'banana', 'price': 8},
    {'name': 'orange', 'price': 6},
  ];

  String search = 'banana';

  print(search + ' is ' + products[1]['price'].toString() + ' baht');
}
