

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kissan_hub/Common%20Components/SearchField.dart';
import 'package:kissan_hub/Controllers/CompanyListController.dart';
import 'package:kissan_hub/UI/App%20Widgets/CompanyListCard.dart';

// class CompanyListScreen extends StatelessWidget {
//   final String productName;  // The name of the product (e.g. Rice, Wheat, etc.)

//   CompanyListScreen({required this.productName});

//   @override
//   Widget build(BuildContext context) {
//     final CompanyController companyController = Get.put(CompanyController()); // Get instance of CompanyController

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(60),
//         child: AppBar(
//            backgroundColor:   Color.fromRGBO(35, 216, 44, 1),
//           title: Text('$productName کی کمپنیاں'),
//           centerTitle: true,
//            shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(23),
//               bottomRight: Radius.circular(23),
//             ),
//           ),
         
//         ),
        
        
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             SearchTextField(hintText: '..... تلاش کریں'),
           
//             SizedBox(height: 18),
//             // Company List
//             Expanded(
//               child: Obx(() {
//                 return ListView.builder(
//                   itemCount: companyController.companies.length,
//                   itemBuilder: (context, index) {
//                     return GestureDetector(
//                       onTap: () {
//                         // When a company is tapped, navigate to Product Detail Screen
//                         companyController.selectCompany(companyController.companies[index]);
//                         Get.toNamed('/productDetail');
//                       },
//                       child: CompanyItem(
//                         company: companyController.companies[index],
//                       ),
//                     );
//                   },
//                 );
//               }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


class CompanyListScreen extends StatelessWidget {
  final String productName;

  CompanyListScreen({required this.productName});

  @override
  Widget build(BuildContext context) {
    final CompanyController companyController = Get.put(CompanyController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(35, 216, 44, 1),
        title: Text('$productName کی کمپنیاں'),
        centerTitle: true,
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
                        // When a company is tapped, navigate to Product Detail Screen
                        companyController.selectCompany(companyController.companies[index]);
                        Get.toNamed('/productDetail');
                      },
                      child: CompanyItem(company: companyController.companies[index]),
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
