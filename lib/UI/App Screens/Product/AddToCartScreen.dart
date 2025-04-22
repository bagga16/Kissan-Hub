

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kissan_hub/Common%20Components/CommonButton.dart';

class TokeryScreen extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(249, 249, 249, 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('میری ٹوکری'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: _firestore.collection('cart').orderBy('timestamp', descending: true).snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            final cartItems = snapshot.data!.docs;
            double totalPrice = 0;
            double shippingCharges = 150.0;

            // Calculate total price
            for (var cartItem in cartItems) {
              final price = cartItem['price'] ?? 0;
              final quantity = cartItem['quantity'] ?? 1;
              totalPrice += price * quantity;
            }

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final cartItem = cartItems[index];
                      final price = cartItem['price'];
                      final quantity = cartItem['quantity'];
                      final weight = cartItem['weight'];
                      final image = cartItem['image'];
                      final name = cartItem['name'];

                      return Card(
                        color: Colors.white,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: image.isNotEmpty
                                    ? Image.asset(
                                        image, // Product image
                                        width: 70,
                                        height: 70,
                                        fit: BoxFit.cover,
                                      )
                                    : Icon(Icons.image, size: 70), // Placeholder if no image
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                                    SizedBox(height: 4),
                                    Text('Rs ${price} x ${weight}'),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.remove, color: Colors.green),
                                        onPressed: () async {
                                          int newQuantity = quantity - 1;
                                          if (newQuantity <= 0) {
                                            await _firestore.collection('cart').doc(cartItem.id).delete();
                                          } else {
                                            await _firestore.collection('cart').doc(cartItem.id).update({
                                              'quantity': newQuantity,
                                            });
                                          }
                                        },
                                      ),
                                      Text(quantity.toString(), style: TextStyle(fontSize: 18)),
                                      IconButton(
                                        icon: Icon(Icons.add, color: Colors.green),
                                        onPressed: () async {
                                          int newQuantity = quantity + 1;
                                          await _firestore.collection('cart').doc(cartItem.id).update({
                                            'quantity': newQuantity,
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  Text('Rs ${(price * quantity).toStringAsFixed(2)}'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // Total Price and Checkout Button
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('کل: Rs ${totalPrice.toStringAsFixed(2)}', style: TextStyle(fontSize: 15)),
                          Icon(Icons.add, color: const Color.fromARGB(255, 43, 238, 50),),
                          Text('شپنگ چارجز: Rs ${shippingCharges.toStringAsFixed(2)}', style: TextStyle(fontSize: 15)),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Text('کل رقم: Rs ${(totalPrice + shippingCharges).toStringAsFixed(2)}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(height: 8),
                      CommonButton(title: ('چیک آؤٹ'), onPressed: () async {
                          for (var cartItem in cartItems) {
                            await _firestore.collection('MyOrders').add({
                              'name': cartItem['name'] ?? "Unknown Product",
                              'price': cartItem['price'] ?? 0,
                              'image': cartItem['image'] ?? "",
                              'quantity': cartItem['quantity'] ?? 1,
                              'timestamp': FieldValue.serverTimestamp(),
                            });
                          }

                          // Empty the cart after successful checkout
                          await _firestore.collection('cart').get().then((querySnapshot) {
                            for (var doc in querySnapshot.docs) {
                              doc.reference.delete();
                            }
                          });

                          // Show confirmation
                          Get.snackbar('چیک آؤٹ کامیاب', 'آپ کا آرڈر کامیابی سے مکمل ہوگیا',
                              snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);

                      }),
                     
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
