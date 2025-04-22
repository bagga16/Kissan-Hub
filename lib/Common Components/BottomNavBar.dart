import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kissan_hub/Controllers/DashboardController.dart';

class CustomBottomNavbar extends StatelessWidget {
  final DashboardController controller = Get.find();

  final List<IconData> icons = [
    Icons.person_outline,
    Icons.shopping_cart_outlined,
    Icons.list_alt_outlined,
    Icons.home_outlined,
  ];

  final List<IconData> selectedIcons = [
    Icons.person,
    Icons.shopping_cart,
    Icons.list,
    Icons.home,
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.green.shade100),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(4, (index) {
              final isSelected = controller.selectedIndex.value == index;
              return IconButton(
                icon: Icon(
                  isSelected ? selectedIcons[index] : icons[index],
                  color: isSelected ? Colors.green : Colors.black,
                ),
                onPressed: () => controller.changeTabIndex(index),
              );
            }),
          ),
        ));
  }
}
