import 'package:flutter/material.dart';
import 'package:myapp/design/baking_login.dart';



class Baking extends StatelessWidget {
  const Baking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: bgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //images
          Expanded(
            flex: 2,
            child: Image.asset(
              'assets/images/baking.jpg',
              fit: BoxFit.cover,
            ),
          ),

          //text + button
          Expanded(
            flex: 1,
            child: Column(
              children: [
                const Spacer(),
                Text(
                  'Baking lesson'.toUpperCase(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  'Master the art of baking'.toUpperCase(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Spacer(),
                ElevatedButton.icon(
                  // style: ElevatedButton.styleFrom(
                  //     backgroundColor: primaryColor,
                  //     foregroundColor: Colors.black,
                  //     shape: const StadiumBorder(side: BorderSide.none),
                  //     padding: const EdgeInsets.all(16)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BakingLogin()));
                  },
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text('START LEANING'),
                ),
                const SizedBox(height: 16)
              ],
            ),
          )
        ],
      ),
    );
  }
}
