import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Quiz2Sec3 extends StatefulWidget {
  const Quiz2Sec3({super.key});
  @override
  State<Quiz2Sec3> createState() => _Quiz2Sec3State();
}

class _Quiz2Sec3State extends State<Quiz2Sec3> {
  List<Map<String, dynamic>> products = [
    {'name': 'hat', 'price': 180},
    {'name': 'bag', 'price': 300},
    {'name': 'sock', 'price': 50},
  ];

  List carts = [];
  List price = [];

  void add(String productName) {
    carts.add(productName);
  }

  void remove() {
    carts.remove(carts);
  }

  void clear() {
    carts.clear();
  }

  void addCart() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListTile(
          title: Text('${products[0]['name']}'),
          subtitle: Text('${products[0]['price']} bath'),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('MFU Shop'),
        ),
        // body: ListView(
        //   children: [
        //     const SizedBox(height: 10),
        //     const Center(child: Text('Products')),
        //     ListTile(
        //       title: Text('${products[0]['name']}'),
        //       subtitle: Text('${products[0]['price']} bath'),
        //       trailing: IconButton(
        //         onPressed: () {},
        //         icon: const Icon(Icons.add),
        //       ),
        //     ),
        //     ListTile(
        //       title: Text('${products[1]['name']}'),
        //       subtitle: Text('${products[1]['price']} bath'),
        //       trailing: IconButton(
        //         onPressed: () {},
        //         icon: const Icon(Icons.add),
        //       ),
        //     ),
        //     ListTile(
        //       title: Text('${products[2]['name']}'),
        //       subtitle: Text('${products[2]['price']} bath'),
        //       trailing: IconButton(
        //         onPressed: () {
        //           //carts[int.tryParse(products['price'])];
        //         },
        //         icon: const Icon(Icons.add),
        //       ),
        //     ),
        //     const SizedBox(height: 10),
        //     const Center(child: Text('Cart')),
        //     ListTile(
        //       title: Text('${products[1]['name']}'),
        //       subtitle: Text('${products[1]['price']} bath'),
        //       trailing: IconButton(
        //         onPressed: () {},
        //         icon: const Icon(Icons.delete),
        //       ),
        //     ),
        //     ElevatedButton(
        //       onPressed: () {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //             builder: (context) => Summary(
        //               product: carts,
        //               price: price,
        //             ),
        //           ),
        //         );
        //       },
        //       child: const Text('Check Out'),
        //     ),
        //   ],
        // ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 8),
              const Text('Products'),
              Expanded(
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int index) {
                    // final carts = products[index];
                    final item = products[index];

                    //const Text('Products');
                    return ListTile(
                      title: Text(item['name']),
                      subtitle: Text('${item['price']} bath'),
                      trailing: IconButton(
                        onPressed: () {
                          setState(
                            () {
                              carts.add(item);
                              // showModalBottomSheet(
                              //   context: context,
                              //   builder: (context) {
                              //     return ListTile(
                              //       title: Text('${products[index]['name']}'),
                              //       subtitle: Text(
                              //           '${products[index]['price']} bath'),
                              //       trailing: IconButton(
                              //         onPressed: () {
                              //           setState(() {
                              //             carts.remove(products);
                              //           });
                              //         },
                              //         icon: const Icon(Icons.delete),
                              //       ),
                              //     );
                              //   },
                              // );
                            },
                          );
                        },
                        icon: const Icon(Icons.add),
                      ),
                    );
                  },
                ),
              ),
              const Divider(
                color: Colors.grey,
                thickness: 1,
                //indent: 20,
                //endIndent: 20,
              ),
              const Text('Cart'),
              Expanded(
                child: ListView.builder(
                  itemCount: carts.length,
                  itemBuilder: (context, index) {
                    final item = carts[index];

                    return ListTile(
                      title: Text(item['name']),
                      subtitle: Text('${item['price']} bath'),
                      trailing: IconButton(
                        onPressed: () {
                          setState(
                            () {
                              carts.remove(item);
                            },
                          );
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    );
                  },
                ),
              ),
              Text('Total: ${carts.length}'),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Summary(
                        product: carts.toString(),
                        price: price.toString(),
                      ),
                    ),
                  );
                },
                child: const Text('Check Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// =============== Summary page ===========
class Summary extends StatelessWidget {
  Summary({Key? key, required this.product, required this.price})
      : super(key: key);
  final product, price;

  //Summary({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Summary'),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              'Total products = ${product.length} \n Total price = ${price['price']} bath',
            ),
          ),
        ],
      ),
    );
  }
}
