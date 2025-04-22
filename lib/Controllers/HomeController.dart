import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kissan_hub/Models/Product%20Model%20.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  var userName = ''.obs;
  var products = <Product>[].obs;

  var profilePicUrl = ''.obs;
 var profilePicPath = ''.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseDatabase _realTimeDatabase = FirebaseDatabase.instance;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
    _fetchProductData();
      _loadProfileImage();
  }

  // Fetch user data (name and profile picture) from Firestore and Realtime Database
  void fetchUserData() async {
    User? user = _auth.currentUser;
    if (user != null) {
      String userId = user.uid;

      // Fetch user details (name, email) from Firestore
      _firestore.collection("users").doc(userId).get().then((doc) {
        if (doc.exists) {
          userName.value = doc['name'] ?? 'Guest User';
        } else {
          userName.value = 'Guest User';
        }
      });

      // Fetch profile picture from Realtime Database
      DatabaseReference ref = _realTimeDatabase.ref('users/$userId/profilePicUrl');
      ref.once().then((DatabaseEvent snapshot) {
        if (snapshot.snapshot.exists && snapshot.snapshot.value != null) {
          profilePicUrl.value = snapshot.snapshot.value.toString();
        }
      });
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
        imageUrl: 'assets/images/R3.png',
        description: 'somthing'
      ),
      Product(
        name: 'سیب',
        price: 200,
        rating: 4.1,
        imageUrl: 'assets/images/R4.png',
        description: 'somthing'
      ),
      Product(
        name: 'قدیم گندم',
        price: 30,
        rating: 4.8,
        imageUrl: 'assets/images/R5.png',
        description: 'somthing'
      ),
    ]);
  }

   void _loadProfileImage() async {
    final prefs = await SharedPreferences.getInstance();
    profilePicPath.value = prefs.getString('profileImagePath') ?? '';
  }
}
