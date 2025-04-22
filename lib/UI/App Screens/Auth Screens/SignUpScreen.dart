

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:kissan_hub/Controllers/auth_controller.dart';
// import 'package:kissan_hub/Utils%20and%20Services/app_routes.dart';


// import '../../../Common Components/CommonButton.dart';
// import '../../../Common Components/CommonTextField.dart';
// import '../../../Common Components/SocialButton.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({Key? key}) : super(key: key);

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   final AuthController _authController = Get.find();
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//      backgroundColor: Color.fromRGBO(243, 243, 243, 1),
//         body: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 24.0),
//           child: Column(
//             children: [
//               const SizedBox(height: 60),
//               Image.asset(
//                 'assets/images/logo.png',
//                 height: 80,
//               ),
//               const SizedBox(height: 20),
//               const Text(
//                 'اکاؤنٹ بنائیں',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 8),
//               const Text(
//                 'براہ کرم اپنی تفصیلات درج کریں',
//                 style: TextStyle(fontSize: 14),
//               ),
//               const SizedBox(height: 24),
//               CommonTextField(
//                 hintText: 'اپنا نام درج کریں',
//                 controller: nameController,
//               ),
//               const SizedBox(height: 16),
              // CommonTextField(

              //   hintText: 'ای میل درج کریں',
              //   controller: emailController,
              // ),
//               TextField(
//                 textDirection: TextDirection.ltr,
//                 controller: emailController,
//                 decoration: InputDecoration(
//                   hintText: 'ای میل درج کریں',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   prefixIcon: Icon(Icons.email),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               CommonTextField(
//                 hintText: 'پاس ورڈ درج کریں',
//                 controller: passwordController,
//                 isPassword: true,
//               ),
//               const SizedBox(height: 24),
             
                
//                 CommonButton(
//                 title: 'رجسٹر کریں',
//                 onPressed: () {
//                   _authController.register(
//                     emailController.text.trim(),
//                     passwordController.text.trim(),
//                     nameController.text.trim()
//                   );
//                 },
              

//               ),
//               const SizedBox(height: 16),
//                TextButton( 
//                  onPressed: () {
//                   Get.toNamed(AppRoutes.login);
//                 },
//                 child: Text('یا', style: TextStyle(fontSize: 14)),),
              
//               const SizedBox(height: 16),
//               SocialButton(
//                 title: 'گوگل کے ساتھ سائن اپ کریں',
//                 assetPath: 'assets/images/google.png',
//                 onPressed: () {
//                   // Google signup
//                 },
//               ),
//               const SizedBox(height: 10),
//               SocialButton(
//                 title: 'فیس بک کے ساتھ سائن اپ کریں',
//                 assetPath: 'assets/images/fb.png',
//                 onPressed: () {
//                   // Facebook signup
//                 },
//               ),
//               const SizedBox(height: 10),
//               SocialButton(
//                 title: 'ایپل کے ساتھ سائن اپ کریں',
//                 assetPath: 'assets/images/apple.png',
//                 onPressed: () {
//                   // Apple signup
//                 },
//               ),
//               const SizedBox(height: 30),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kissan_hub/Controllers/auth_controller.dart';
import 'package:kissan_hub/Utils%20and%20Services/app_routes.dart';

import '../../../Common Components/CommonButton.dart';
import '../../../Common Components/CommonTextField.dart';
import '../../../Common Components/SocialButton.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final AuthController _authController = Get.find();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Email Validation function
  bool _isValidEmail(String email) {
    // Simple regex for email validation
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(243, 243, 243, 1),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 60),
              Image.asset(
                'assets/images/logo.png',
                height: 80,
              ),
              const SizedBox(height: 20),
              const Text(
                'اکاؤنٹ بنائیں',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'براہ کرم اپنی تفصیلات درج کریں',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 24),
              CommonTextField(
                hintText: 'اپنا نام درج کریں',
                controller: nameController,
              ),
              const SizedBox(height: 16),
              // Email Input with validation
               CommonTextField(

                hintText: 'ای میل درج کریں',
                controller: emailController,
              ),
              // TextField(
              //   textDirection: TextDirection.ltr,
              //   controller: emailController,
              //   decoration: InputDecoration(
              //     hintText: 'ای میل درج کریں',
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(12),
              //     ),
              //     prefixIcon: Icon(Icons.email),
              //   ),
              // ),
              const SizedBox(height: 16),
              CommonTextField(
                hintText: 'پاس ورڈ درج کریں',
                controller: passwordController,
                isPassword: true,
              ),
              const SizedBox(height: 24),
              CommonButton(
                title: 'رجسٹر کریں',
                onPressed: () {
                  // Check if the email is valid
                  if (_isValidEmail(emailController.text.trim())) {
                    _authController.register(
                      nameController.text.trim(),
                      emailController.text.trim(),
                      passwordController.text.trim(),
                    );
                  } else {
                    Get.snackbar('Invalid Email', 'Please enter a valid email address.');
                  }
                },
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.login);
                },
                child: Text('یا', style: TextStyle(fontSize: 14)),
              ),
              const SizedBox(height: 16),
              SocialButton(
                title: 'گوگل کے ساتھ سائن اپ کریں',
                assetPath: 'assets/images/google.png',
                onPressed: () {
                  // Google signup
                },
              ),
              const SizedBox(height: 10),
              SocialButton(
                title: 'فیس بک کے ساتھ سائن اپ کریں',
                assetPath: 'assets/images/fb.png',
                onPressed: () {
                  // Facebook signup
                },
              ),
              const SizedBox(height: 10),
              SocialButton(
                title: 'ایپل کے ساتھ سائن اپ کریں',
                assetPath: 'assets/images/apple.png',
                onPressed: () {
                  // Apple signup
                },
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

