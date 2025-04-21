import 'package:flutter/material.dart';
import 'package:kissan_hub/Models/Product%20Model%20.dart';

class DastyabMasnoatItem extends StatelessWidget {
  final Product product;

  DastyabMasnoatItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF23D82C)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              product.imageUrl,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Column(
              children: [
                Text(
                  product.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Rs ${product.price}/kg',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          SizedBox(height: 6),
        ],
      ),
    );
  }
}
