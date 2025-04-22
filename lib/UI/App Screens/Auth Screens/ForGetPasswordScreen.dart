import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kissan_hub/Common%20Components/CommonButton.dart';
import 'package:kissan_hub/Controllers/auth_controller.dart';

class ResetPasswordScreen extends StatelessWidget {
  final AuthController authController = AuthController.instance;
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('پاس ورڈ ری سیٹ کریں'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
             
               const SizedBox(height: 80),
              Image.asset(
                  'assets/images/logo.png',
                  height: 80,
                ),
                const SizedBox(height: 40),
              Text(
                'پاس ورڈ ری سیٹ کرنے کے لئے اپنا ای میل درج کریں۔',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              TextField(
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'ای میل ایڈریس',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 30),
              CommonButton(title: ('بھیجیں'), onPressed: (){
                 String email = emailController.text.trim();
                  if (email.isNotEmpty) {
                    authController.resetPassword(email);
                  } else {
                    Get.snackbar('خرابی', 'براہ کرم درست ای میل درج کریں',
           backgroundColor: Color.fromRGBO(35, 216, 44, 1), colorText: Colors.white);
                  }
              })
              
            ],
          ),
        ),
      ),
    );
  }
}
