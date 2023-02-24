void main(List<String> args) {
  Fruit fruit1 = Fruit();
  fruit1.setName('apple');
  fruit1.setPrice(12);
  print(fruit1.getName);
  print(fruit1.getPrice);

  Fruit fruit2 = Fruit();
  fruit2.setName('banana');
  fruit2.setPrice(6);
  print(fruit2.getName);
  print(fruit2.getPrice);
}

class Fruit {
  String name = '';
  int price = 0;

  //getter
  String get getName => name;
  int get getPrice => price;
  // String getName() {
  //   return name;
  // }

  // int getPrice() {
  //   return price;
  // }

  //setter

  // set setName(String fruitName) => name = fruitName;
  // set setPrice(int fruitPrice) => price = fruitPrice;

  void setName(String fruitName) {
    name = fruitName; //เปลี่ยน name เป็น fruitName
    this.name;
  }

  void setPrice(int fruitPrice) {
    price = fruitPrice;
    this.price;
  }
}
