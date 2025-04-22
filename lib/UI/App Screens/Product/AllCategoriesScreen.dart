


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kissan_hub/Controllers/AllCategoryController.dart';
import 'package:kissan_hub/Controllers/HomeController.dart';
import 'package:kissan_hub/Common%20Components/SearchField.dart';
import 'package:kissan_hub/UI/App%20Screens/Home%20Screens/CompanyListScreen.dart';

class CategoryScreen extends StatelessWidget {
  final String productName;  // The name of the selected product (e.g. Rice, Mango, etc.)

  CategoryScreen({required this.productName});

  @override
  Widget build(BuildContext context) {
    final CategoryController categoryController = Get.put(CategoryController());
    final HomeController _homeController = Get.put(HomeController());

    // Set categories dynamically based on the selected product
    categoryController.setCategories(productName);

    return Scaffold(
        backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('$productName کی اقسام'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            SearchTextField(hintText: '..... تلاش کریں'),
            SizedBox(height: 25),
            // Category List
            Expanded(
              child: Obx(() {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: categoryController.categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                      Get.to(() => CompanyListScreen(productName: productName)); 
                        //Get.to(() => CompanyListScreen(productName: categoryController.categories[index]));
                      },
                      child: CategoryItem(category: categoryController.categories[index]),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String category;

  CategoryItem({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // Category Image (you can replace this with actual data)
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/images/R1.png',  // Placeholder image
              width: double.infinity,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8),
          // Category Name
          Text(
            category,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

