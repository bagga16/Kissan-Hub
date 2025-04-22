import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kissan_hub/Common%20Components/BottomNavBar.dart';
import 'package:kissan_hub/Controllers/DashboardController.dart';
import 'package:kissan_hub/UI/App%20Screens/Home%20Screens/HomeScreen.dart';
import 'package:kissan_hub/UI/App%20Screens/Product/AddToCartScreen.dart';
import 'package:kissan_hub/UI/App%20Screens/User%20Screens/UserProfileScreen.dart';
import 'package:kissan_hub/UI/App%20Screens/Orders/MyOrderScreen.dart';

class DashboardScreen extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());

  final screens = [
     
   UserProfileScreen(),
   TokeryScreen(),
   MyOrdersScreen(),
   
   HomeScreen(),
   
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      body: Obx(() => screens[controller.selectedIndex.value]),
      bottomNavigationBar: CustomBottomNavbar(),
    );
  }
}
