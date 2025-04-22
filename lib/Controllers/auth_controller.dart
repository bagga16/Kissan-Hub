import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kissan_hub/Models/user_model.dart';
import 'package:kissan_hub/Utils%20and%20Services/app_routes.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
    FirebaseDatabase _realTimeDatabase = FirebaseDatabase.instance;

  Rxn<User> firebaseUser = Rxn<User>();
  Rxn<UserModel> firestoreUser = Rxn<UserModel>();

  @override
  void onInit() {
    firebaseUser.bindStream(_auth.authStateChanges());
    ever(firebaseUser, _setInitialScreen);
    super.onInit();
  }

  void _setInitialScreen(User? user) async {
    if (user == null) {
      Get.offAllNamed(AppRoutes.login);
    } else {
      DocumentSnapshot doc = await _firestore.collection('users').doc(user.uid).get();
      if (doc.exists) {
        firestoreUser.value = UserModel.fromMap(doc.data() as Map<String, dynamic>);
      }
      Get.offAllNamed(AppRoutes.dashboard);
    }
  }

  Future<void> register(String name, String email, String password) async {
    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      UserModel newUser = UserModel(
        uid: cred.user!.uid,
        name: name,
        email: email,
        profilePicUrl: '',
      );
      await _firestore.collection('users').doc(cred.user!.uid).set(newUser.toMap());
      firestoreUser.value = newUser;
    } catch (e) {
      Get.snackbar('Registration Error', e.toString());
    }
  }
  
 // Stream to fetch user data in real-time
  Stream<UserModel?> fetchUserData() {
    User? user = _auth.currentUser;
    if (user != null) {
      return _firestore
          .collection('users')
          .doc(user.uid)
          .snapshots()
          .map((doc) => doc.exists ? UserModel.fromMap(doc.data()!) : null);
    }
    return Stream.value(null); // Return null if no user is logged in
  }

 // Save updated user info to Firestore
  Future<void> saveAdditionalUserInfo(String name, String phone, String city, String bio) async {
    try {
      String uid = _auth.currentUser!.uid;
      await _firestore.collection('users').doc(uid).update({
        'name': name,
        'phone': phone,
        'city': city,
        'bio': bio,
      });

      // Update the local user model
      firestoreUser.value = UserModel(
        uid: uid,
        name: name,
        email: firestoreUser.value?.email ?? '',
        profilePicUrl: firestoreUser.value?.profilePicUrl ?? '',
        phone: phone,
        city: city,
        bio: bio,
      );

      Get.snackbar('Success', 'Profile updated successfully');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

 
 // Save user profile picture URL (base64) to Firestore and Realtime DB
  Future<void> saveProfilePicUrl(String base64Image) async {
    User? user = _auth.currentUser;
    if (user != null) {
      // Save to Firestore
      await _firestore.collection('users').doc(user.uid).update({
        'profilePicUrl': base64Image,
      });

      // Save to Realtime Database
      DatabaseReference ref = _realTimeDatabase.ref('users/${user.uid}/profilePicUrl');
      await ref.set(base64Image);
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar('Login Error', e.toString());
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

    Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      Get.snackbar('Success', 'Password reset link sent to your email');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> confirmPasswordReset(String newPassword) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await user.updatePassword(newPassword);
        Get.snackbar('Success', 'Password updated successfully');
        // Optionally, redirect to login screen after password change
        Get.offAllNamed('/login');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
