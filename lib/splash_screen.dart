import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kissan_hub/Utils%20and%20Services/app_routes.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () async {
      // Check if the user is already logged in
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // If logged in, navigate to Home
        Get.offNamed(AppRoutes.home);
      } else {
        // If not logged in, navigate to Login
        Get.offNamed(AppRoutes.login);
      }
    });

    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/Splash.png', fit: BoxFit.fill,
        height: double.infinity,
          width: double.infinity,)
        ,  // Replace with your splash image
      ),
    );
  }
}
