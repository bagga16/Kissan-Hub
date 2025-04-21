

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kissan_hub/Common%20Components/SearchField.dart';
import 'package:kissan_hub/Controllers/CompanyListController.dart';
import 'package:kissan_hub/Controllers/HomeController.dart';
import 'package:kissan_hub/UI/App%20Widgets/CompanyListCard.dart';
import 'package:kissan_hub/UI/App%20Widgets/DastyabMasnoatItem.dart';

class ListOfAllItems extends StatelessWidget {
  final String productName;  // The name of the product (e.g. Rice, Wheat, etc.)

  ListOfAllItems({required this.productName});

  @override
  Widget build(BuildContext context) {
    
  final HomeController _homeController = Get.put(HomeController());
    final CompanyController companyController = Get.put(CompanyController()); // Get instance of CompanyController

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          // backgroundColor:   Color.fromRGBO(35, 216, 44, 1),
          title: Text(productName),
          centerTitle: true,
           shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(23),
              bottomRight: Radius.circular(23),
            ),
          ),
         
        ),
        
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SearchTextField(hintText: '..... تلاش کریں'),
           
            SizedBox(height: 18),
            // Company List
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: companyController.companies.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // // When a company is tapped, navigate to Product Detail Screen
                        // companyController.selectCompany(companyController.companies[index]);
                        // Get.toNamed('/productDetail');
                      },
                      child:  Obx(() {
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
