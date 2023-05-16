import 'package:borrow_app/constants/profile/profile_screen.dart';
import 'package:borrow_app/screen/DashBoard.dart';

import 'package:borrow_app/screen/cart.dart';
import 'package:borrow_app/screen/history.dart';
import 'package:borrow_app/utils/color.dart';
import 'package:flutter/material.dart';

class HomeBar extends StatefulWidget {
  const HomeBar({super.key});

  @override
  State<HomeBar> createState() => _HomeBarState();
}

class _HomeBarState extends State<HomeBar> {
  int currentIndex = 0;
  final List<Widget> screens = [
    const Dashboard(),
    const Cart(),
    const History(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  // final PageStorageBucket bucket = PageStorageBucket();
  // Widget currenScreen = Dashboard();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Bottom'),
        //   centerTitle: true,
        // ),
        body: screens[currentIndex],
        bottomNavigationBar: Container(
          clipBehavior:
              Clip.hardEdge, //or better look(and cost) using Clip.antiAlias,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(24),
              topLeft: Radius.circular(24),
            ),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: false,
            iconSize: 22,
            selectedItemColor: Colors.white,
            backgroundColor: kBackgroundColor,
            currentIndex: currentIndex,
            onTap: _onItemTapped,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.white60,
                ),
                label: 'Home',
                backgroundColor: Colors.blue,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white60,
                ),
                label: 'Cart',
                backgroundColor: Colors.red,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.note_alt_sharp,
                  color: Colors.white60,
                ),
                label: 'View History',
                backgroundColor: Colors.green,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Colors.white60,
                ),
                label: 'Profile',
                backgroundColor: Colors.yellow,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
