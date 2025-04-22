


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
    final CompanyController controller = Get.put(CompanyController());
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
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  company.logoUrl, 
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              Text(company.productName, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
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
              Text('تفصیل: ${company.description}', style: TextStyle(fontSize: 14)),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  var querySnapshot = await _firestore
                      .collection('cart')
                      .where('name', isEqualTo: company.productName)
                      .get();

                  if (querySnapshot.docs.isEmpty) {
                    // Add product with quantity 1 if it's not already in the cart
                    await _firestore.collection('cart').add({
                      'name': company.productName,
                      'price': company.price,
                      'image': company.logoUrl,
                      'weight': company.weight,
                      'location': company.location,
                      'description': company.description,
                      'timestamp': FieldValue.serverTimestamp(),
                      'quantity': 1,  // Ensure quantity starts as 1
                    });

                    Get.snackbar('ٹوکری میں شامل', 'پروڈکٹ کو آپ کی ٹوکری میں شامل کر دیا گیا ہے',
                        snackPosition: SnackPosition.TOP, backgroundColor: Colors.green, colorText: Colors.white);
                  } else {
                    // If the product is already in the cart, update the quantity
                    var docId = querySnapshot.docs[0].id;
                    var existingQuantity = querySnapshot.docs[0]['quantity'];

                    await _firestore.collection('cart').doc(docId).update({
                      'quantity': existingQuantity + 1,  // Increment quantity by 1
                    });

                    Get.snackbar('ٹوکری میں اضافہ', 'پروڈکٹ کی مقدار بڑھا دی گئی ہے',
                        snackPosition: SnackPosition.TOP, backgroundColor: Colors.green, colorText: Colors.white);
                  }
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
