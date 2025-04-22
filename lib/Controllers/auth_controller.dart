import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kissan_hub/Models/user_model.dart';
import 'package:kissan_hub/UI/App%20Screens/Auth%20Screens/ResetPasswordScreen.dart';
import 'package:kissan_hub/UI/App%20Screens/User%20Screens/UserInfoScreen.dart';
import 'package:kissan_hub/Utils%20and%20Services/app_routes.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
         Get.to(() => UserInfoScreen());
    } catch (e) {
      Get.snackbar('Registration Error', e.toString(),backgroundColor: Color.fromRGBO(35, 216, 44, 1), colorText: Colors.white);
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
  Future<void> saveAdditionalUserInfo(String name, String phone, String land, String bio) async {
    try {
      String uid = _auth.currentUser!.uid;
      await _firestore.collection('users').doc(uid).update({
        'name': name,
        'phone': phone,
        'land': land,
        'bio': bio,
      });

      // Update the local user model
      firestoreUser.value = UserModel(
        uid: uid,
        name: name,
        email: firestoreUser.value?.email ?? '',
        profilePicUrl: firestoreUser.value?.profilePicUrl ?? '',
        phone: phone,
        land: land,
        bio: bio,
      );

      Get.snackbar('Success', 'Profile updated successfully');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

 
 

  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar('Login Error', e.toString(), backgroundColor: Color.fromRGBO(35, 216, 44, 1), colorText: Colors.white);
      
      
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

   // Function to send password reset email
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      Get.snackbar('Success', 'Password reset link sent to your email');
      // Navigate to the reset password screen (or another screen)
      Get.to(() => ResetPasswordConfirmScreen());
    } catch (e) {
      Get.snackbar('Error', e.toString(), backgroundColor: Color.fromRGBO(35, 216, 44, 1), colorText: Colors.white);
    }
  }

  // Function to confirm password reset
  Future<void> confirmPasswordReset(String newPassword) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await user.updatePassword(newPassword);
        Get.snackbar('Success', 'Password updated successfully');
        // Optionally, navigate to the login screen after password change
        Get.offAllNamed('/login');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), backgroundColor: Color.fromRGBO(35, 216, 44, 1), colorText: Colors.white);
    }
  }
}
