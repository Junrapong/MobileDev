import 'package:flutter/material.dart';
import 'package:myapp/provider/cart.dart';
import 'package:provider/provider.dart';

class Shop2 extends StatelessWidget {
  const Shop2({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('${context.watch<Cart>().cart.length}'),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    context.read<Cart>().clear();
                  },
                  child: const Text('Clear'))
            ],
          ),
        ),
      ),
    );
  }
}
