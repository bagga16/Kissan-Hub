import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kissan_hub/Common%20Components/CommonButton.dart';
import 'package:kissan_hub/Controllers/auth_controller.dart';

class ResetPasswordConfirmScreen extends StatelessWidget {
  final AuthController authController = AuthController.instance;
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
         backgroundColor: Colors.white,
        title: Text('پاس ورڈ ری سیٹ کریں'),
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
             
              SizedBox(height: 70),
          Image.asset(
                    'assets/images/logo.png',
                    height: 80,
                  ),
          
              SizedBox(height: 50),
          
              Text(
                'نیا پاس ورڈ درج کریں',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              TextField(
                controller: newPasswordController,
                decoration: InputDecoration(
                  labelText: 'نیا پاس ورڈ',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              TextField(
                controller: confirmPasswordController,
                decoration: InputDecoration(
                  labelText: 'پاس ورڈ کی تصدیق کریں',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              CommonButton(title: 'تصدیق کریں', onPressed: (){
                  String newPassword = newPasswordController.text.trim();
                  String confirmPassword = confirmPasswordController.text.trim();
          
                  if (newPassword == confirmPassword && newPassword.isNotEmpty) {
                    authController.confirmPasswordReset(newPassword);
                  } else {
                    Get.snackbar('Error', 'پاس ورڈ میل نہیں کھاتے', backgroundColor: Color.fromRGBO(35, 216, 44, 1), colorText: Colors.white);
                  }
          
              })
             
            ],
          ),
        ),
      ),
    );
  }
}
