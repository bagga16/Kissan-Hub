import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kissan_hub/Controllers/CompanyListController.dart';
class ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CompanyController controller = Get.find();

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
              // Product Image
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  company.logoUrl,  // You can replace with actual product image URL
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
              // Buy Now Button
              ElevatedButton(
                onPressed: () {
                  // Add your buying logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('اب خریدیں'),
              ),
            ],
          );
        }),
      ),
    );
  }
}
