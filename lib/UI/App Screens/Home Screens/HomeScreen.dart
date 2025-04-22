

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kissan_hub/Common%20Components/SearchField.dart';
import 'package:kissan_hub/Controllers/HomeController.dart';
import 'package:kissan_hub/UI/App%20Screens/Product/AllCategoriesScreen.dart';
import 'package:kissan_hub/UI/App%20Widgets/BazariQeematItem.dart';
import 'package:kissan_hub/UI/App%20Widgets/DastyabMasnoatItem.dart';

class HomeScreen extends StatelessWidget {
  final HomeController _homeController = Get.put(HomeController());
  final List<String> products = ['چاول', 'آم','سیب', 'گندم', ];  // List of products (e.g. rice, apple, wheat)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(88),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromRGBO(35, 216, 44, 1),
          flexibleSpace: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Obx(() {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: Text(
                          _homeController.userName.value,
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ],
                  );
                }),
                SizedBox(width: 14),
                // CircleAvatar(backgroundImage: AssetImage('assets/images/R1.png'), radius: 25),
                Obx(() {
  return CircleAvatar(
    radius: 25,
    backgroundImage: _homeController.profilePicPath.value.isNotEmpty
        ? FileImage(File(_homeController.profilePicPath.value))
        : AssetImage('assets/images/R1.png') as ImageProvider,
  );
}),

              ],
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 20),
            // Search Bar
            SearchTextField(hintText: '..... تلاش کریں'),
            SizedBox(height: 10),
            // Header for "Bazari Qeemat"
            Align(
              alignment: Alignment.centerRight,
              child: Text('بازاری قیمت', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10),
            Expanded(
              flex: 5,
              child: Obx(() {
                return ListView.builder(
                  itemCount: _homeController.products.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Navigate to Category Screen with the selected product
                        Get.to(() => CategoryScreen(productName: products[index]));
                      },
                      child: BazariQeematItem(
                        product: _homeController.products[index],
                      ),
                    );
                  },
                );
              }),
            ),
            SizedBox(height: 14),
            Align(
              alignment: Alignment.centerRight,
              child: Text('دستیاب مصنوعات', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10),
            Expanded(
              flex: 3,
              child: Obx(() {
                return GridView.builder(
                  padding: EdgeInsets.only(bottom: 10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.9,
                  ),
                  itemCount: _homeController.products.length,
                  itemBuilder: (context, index) {
                    return DastyabMasnoatItem(
                      product: _homeController.products[index],
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
