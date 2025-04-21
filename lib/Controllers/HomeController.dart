import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kissan_hub/Models/Product%20Model%20.dart';

class HomeController extends GetxController {
  var userName = ''.obs;
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    _fetchUserData();
    _fetchProductData();
  }

  void _fetchUserData() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userName.value = user.displayName ?? 'نام نہیں';
    }
  }

  void _fetchProductData() {
    // Simulating data fetching
    products.addAll([
      Product(
        name: 'چاول کا پتہ',
        price: 55,
        rating: 4.8,
        imageUrl: 'assets/images/R1.png',
        description: 'somthing'
      ),
      Product(
        name: 'ام',
        price: 40,
        rating: 4.8,
        imageUrl: 'assets/images/R1.png',
        description: 'somthing'
      ),
      Product(
        name: 'قدیم گندم',
        price: 30,
        rating: 4.8,
        imageUrl: 'assets/images/R1.png',
        description: 'somthing'
      ),
    ]);
  }
}
