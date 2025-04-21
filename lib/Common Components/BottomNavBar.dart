import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.green),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search, color: Colors.green),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart, color: Colors.green),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, color: Colors.green),
          label: '',
        ),
      ],
      currentIndex: 0,
      selectedItemColor: Colors.green,
      onTap: (index) {
        if (index == 0) {
          // Go to home screen (current)
        } else if (index == 1) {
          // Go to search screen
        } else if (index == 2) {
          // Go to cart screen
        } else if (index == 3) {
          // Go to profile screen
        }
      },
    );
  }
}
