// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class TokeryScreen extends StatelessWidget {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//         title: Text('میری ٹوکری'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: StreamBuilder<QuerySnapshot>(
//           stream: _firestore.collection('cart').orderBy('timestamp', descending: true).snapshots(),
//           builder: (context, snapshot) {
//             if (!snapshot.hasData) {
//               return Center(child: CircularProgressIndicator());
//             }

//             final cartItems = snapshot.data!.docs;
//             double totalPrice = 0;

//             return Column(
//               children: [
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: cartItems.length,
//                     itemBuilder: (context, index) {
//                       final cartItem = cartItems[index];
//                       final price = cartItem['price'];
//                       totalPrice += price;

//                       return Card(
//                         margin: EdgeInsets.symmetric(vertical: 10),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: ListTile(
//                           contentPadding: EdgeInsets.all(10),
//                           leading: ClipRRect(
//                             borderRadius: BorderRadius.circular(8),
//                             child: Image.network(
//                               cartItem['image'], // Product image
//                               width: 70,
//                               height: 70,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           title: Text(cartItem['name']),
//                           subtitle: Text('Rs ${cartItem['price']} x ${cartItem['weight']}'),
//                           trailing: Text('Rs ${cartItem['price']}'),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 // Total Price
//                 Padding(
//                   padding: const EdgeInsets.only(top: 20.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text('کل: Rs ${totalPrice.toStringAsFixed(2)}', style: TextStyle(fontSize: 18)),
//                       ElevatedButton(
//                         onPressed: () {
//                           // Navigate to checkout or other functionality
//                         },
//                         child: Text('چیک آؤٹ'),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.green,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TokeryScreen extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
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

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final cartItem = cartItems[index];

                      // Use null-aware operators to safely access fields
                      final price = cartItem['price'] ?? 0;  // Default to 0 if null
                      final quantity = cartItem['quantity'] ?? 1;  // Default to 1 if null
                      final weight = cartItem['weight'] ?? "Unknown Weight"; // Default if null
                      final image = cartItem['image'] ?? ""; // Default if null
                      final name = cartItem['name'] ?? "Unknown Product"; // Default if null

                      totalPrice += price * quantity;

                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.all(10),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: image.isNotEmpty
                                ? Image.network(
                                    image, // Product image
                                    width: 70,
                                    height: 70,
                                    fit: BoxFit.cover,
                                  )
                                : Icon(Icons.image, size: 70), // Placeholder if no image
                          ),
                          title: Text(name),
                          subtitle: Text('Rs ${price} x ${weight}'),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Item Count Control
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.remove, color: Colors.green),
                                    onPressed: () async {
                                      // Decrease item count
                                      int newQuantity = quantity - 1;
                                      if (newQuantity <= 0) {
                                        // Remove item from cart if quantity is 0 or less
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
                                      // Increase item count
                                      int newQuantity = quantity + 1;
                                      await _firestore.collection('cart').doc(cartItem.id).update({
                                        'quantity': newQuantity,
                                      });
                                    },
                                  ),
                                ],
                              ),
                              // Total price for this item
                              Text('Rs ${(price * quantity).toStringAsFixed(2)}'),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('کل: Rs ${totalPrice.toStringAsFixed(2)}', style: TextStyle(fontSize: 18)),
                      ElevatedButton(
                        onPressed: () async {
                          // Handle checkout: Move items to MyOrders and empty the cart
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
                        },
                        child: Text('چیک آؤٹ'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
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
