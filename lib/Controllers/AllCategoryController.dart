// import 'package:get/get.dart';

// class CategoryController extends GetxController {
//   // Static categories for each product type (e.g., rice, wheat, mango)
//   var categories = <String>[
//     'Basmati',
//     'Sella',
//     'Super Basmati',
//     'Brown Rice',
//     // You can add more categories based on the selected product
//   ].obs;

//   // Selected category
//   var selectedCategory = ''.obs;

//   // Select category
//   void selectCategory(String category) {
//     selectedCategory.value = category;
//   }
// }

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CategoryController extends GetxController {
  // Dynamically populated categories based on selected product
  var categories = <String>[].obs;

  // Set categories based on product
  void setCategories(String productName) {
    if (productName == 'چاول') {
      categories.value = ['Basmati', 'Sella', 'Super Basmati', 'Brown Rice'];
    } else if (productName == 'سیب') {
      categories.value = ['Red Apple', 'Green Apple', 'Golden Apple'];
    } else if (productName == 'گندم') {
      categories.value = ['White Wheat', 'Red Wheat'];
    } else if (productName == 'مٹر') {
      categories.value = ['Green Peas', 'Yellow Peas'];
    }
  }
}
