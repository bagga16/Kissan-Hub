


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:kissan_hub/Controllers/CompanyListController.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class ProductDetailScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final CompanyController controller = Get.find(); // Get the selected company details from controller
//     final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//         title: Text('مصنوعات کی تفصیل'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Obx(() {
//           final company = controller.selectedCompany.value;

//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Product Image (Company logo or product image)
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(12),
//                 child: Image.asset(
//                   company.logoUrl,  // Replace with actual product or company image URL
//                   height: 200,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               SizedBox(height: 20),
//               // Product Name
//               Text(
//                 company.productName,
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 10),
//               // Product Info
//               Row(
//                 children: [
//                   Icon(Icons.line_weight, color: Colors.green),
//                   SizedBox(width: 6),
//                   Text('Weight: ${company.weight}'),
//                 ],
//               ),
//               SizedBox(height: 10),
//               Row(
//                 children: [
//                   Icon(Icons.monetization_on, color: Colors.green),
//                   SizedBox(width: 6),
//                   Text('Price: Rs ${company.price}/kg'),
//                 ],
//               ),
//               SizedBox(height: 10),
//               Row(
//                 children: [
//                   Icon(Icons.location_on, color: Colors.green),
//                   SizedBox(width: 6),
//                   Text('Location: ${company.location}'),
//                 ],
//               ),
//               SizedBox(height: 20),
//               // Product Description
//               Text(
//                 'تفصیل: ${company.description}',
//                 style: TextStyle(fontSize: 14),
//               ),
//               SizedBox(height: 20),
//               // Add to Cart Button
//               ElevatedButton(
//                 onPressed: () async {
//                   // Add the product to Firestore when the user taps "Add to Cart"
//                   await _firestore.collection('cart').add({
//                     'name': company.productName,
//                     'price': company.price,
//                     'image': company.logoUrl,
//                     'weight': company.weight,
//                     'location': company.location,
//                     'description': company.description,
//                     'timestamp': FieldValue.serverTimestamp(),
//                   });

//                   // Show confirmation message
//                   Get.snackbar('ٹوکری میں شامل ', 'پروڈکٹ کو آپ کی ٹوکری میں شامل کر دیا گیا ہے۔',
//                       snackPosition: SnackPosition.TOP, backgroundColor: Colors.green, colorText: Colors.white);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.green,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//                 child: Text('ٹوکری میں شامل کریں'),
//               ),
//             ],
//           );
//         }),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kissan_hub/Controllers/CompanyListController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CompanyController controller = Get.put(CompanyController()); // Get the selected company details from controller
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('مصنوعات کی تفصیل'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          final company = controller.selectedCompany.value;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image (Company logo or product image)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  company.logoUrl,  // Replace with actual product or company image URL
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              // Product Name
              Text(
                company.productName,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              // Product Info
              Row(
                children: [
                  Icon(Icons.line_weight, color: Colors.green),
                  SizedBox(width: 6),
                  Text('Weight: ${company.weight}'),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.monetization_on, color: Colors.green),
                  SizedBox(width: 6),
                  Text('Price: Rs ${company.price}/kg'),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.green),
                  SizedBox(width: 6),
                  Text('Location: ${company.location}'),
                ],
              ),
              SizedBox(height: 20),
              // Product Description
              Text(
                'تفصیل: ${company.description}',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 20),
              // Add to Cart Button
              ElevatedButton(
                onPressed: () async {
                  // Add the product to Firestore with quantity set to 1 by default
                  await _firestore.collection('cart').add({
                    'name': company.productName,
                    'price': company.price,
                    'image': company.logoUrl,
                    'weight': company.weight,
                    'location': company.location,
                    'description': company.description,
                    'timestamp': FieldValue.serverTimestamp(),
                    'quantity': 1,  // Default quantity is set to 1
                  });

                  // Show confirmation message
                  Get.snackbar('ٹوکری میں شامل ', 'پروڈکٹ کو آپ کی ٹوکری میں شامل کر دیا گیا ہے۔',
                      snackPosition: SnackPosition.TOP, backgroundColor: Colors.green, colorText: Colors.white);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('ٹوکری میں شامل کریں'),
              ),
            ],
          );
        }),
      ),
    );
  }
}
