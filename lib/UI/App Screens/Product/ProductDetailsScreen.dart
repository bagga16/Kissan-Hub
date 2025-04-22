
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kissan_hub/Common%20Components/CommonButton.dart';
import 'package:kissan_hub/Controllers/CompanyListController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CompanyController controller = Get.put(CompanyController());
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('مصنوعات کی تفصیل'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Obx(() {
          final company = controller.selectedCompany.value;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,  // Align content to the right
            children: [
              SizedBox(height: 18),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  company.logoUrl,
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
                textAlign: TextAlign.right,  // Align product name to the right
              ),
              SizedBox(height: 10),
              // Weight
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  
                
                  Text('وزن: ${company.weight}', textAlign: TextAlign.right),
                    SizedBox(width: 10),
                  Icon(Icons.line_weight, color: Colors.green),
                ],
              ),
              SizedBox(height: 10),
              // Price
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('قیمت: Rs ${company.price}/kg', textAlign: TextAlign.right),
                    SizedBox(width: 10),
                  Icon(Icons.monetization_on, color: Colors.green),
                 
                  
                ],
              ),
              SizedBox(height: 10),
              // Location
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  
                  Text('مقام: ${company.location}', textAlign: TextAlign.right),
                   SizedBox(width: 10),
                  Icon(Icons.location_on, color: Colors.green),
                 
                ],
              ),
              SizedBox(height: 20),
              // Description
              Text(
                'تفصیل: ${company.description}',
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.right,  // Align text to the right
              ),
              SizedBox(height: 34),
              
              // Add to Cart Button
              CommonButton(
                title: ('ٹوکری میں شامل کریں'),
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
                }
              ),
            ],
          );
        }),
      ),
    );
  }
}
