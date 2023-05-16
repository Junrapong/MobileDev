import 'package:flutter/material.dart';
import 'package:myapp/provider/cart.dart';
import 'package:myapp/provider/shop2.dart';
import 'package:provider/provider.dart';

class Shop extends StatelessWidget {
  const Shop({super.key});

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            createRow('Apple', context),
            createRow('Banana', context),
            createRow('Orange', context),
            Consumer<Cart>(
              builder: ((context, value, child) =>
                  Text('Total in cart = ${value.cart.length}')),
            ),
            //Text('Total in cart = ${context.watch<Cart>().cart.length}'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Shop2()),
                );
              },
              child: const Text('Show cart'),
            ),
          ],
        ),
      ),
    );
  }

  Widget createRow(String name, BuildContext context) {
    return Row(
      children: [
        Text(name),
        const Spacer(),
        ElevatedButton(
          onPressed: () {
            context.read<Cart>().add(name);
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
