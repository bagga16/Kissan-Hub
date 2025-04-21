// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:kissan_hub/Controllers/auth_controller.dart';

// class SignUpScreen extends StatelessWidget {
//   final AuthController _authController = Get.find();
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         backgroundColor: Colors.white,
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
//               TextField(
//                 controller: nameController,
//                 decoration: InputDecoration(
//                   hintText: 'اپنا نام درج کریں',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   prefixIcon: Icon(Icons.person),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               TextField(
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
//               TextField(
//                 controller: passwordController,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   hintText: 'پاس ورڈ درج کریں',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   prefixIcon: Icon(Icons.lock),
//                 ),
//               ),
//               const SizedBox(height: 24),
//               SizedBox(
//                 width: double.infinity,
//                 height: 50,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   onPressed: () {
//                     _authController.register(
//                       nameController.text.trim(),
//                       emailController.text.trim(),
//                       passwordController.text.trim(),
//                     );
//                   },
//                   child: const Text(
//                     'رجسٹر کریں',
//                     style: TextStyle(color: Colors.white, fontSize: 16),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               const Text('یا', style: TextStyle(fontSize: 14)),
//               const SizedBox(height: 16),
//               SocialButton(
//                 icon: Icons.g_mobiledata,
//                 label: 'گوگل کے ساتھ سائن اپ کریں',
//                 onPressed: () {
//                   // Google signup
//                 },
//               ),
//               const SizedBox(height: 10),
//               SocialButton(
//                 icon: Icons.facebook,
//                 label: 'فیس بک کے ساتھ سائن اپ کریں',
//                 onPressed: () {
//                   // Facebook signup
//                 },
//               ),
//               const SizedBox(height: 10),
//               SocialButton(
//                 icon: Icons.apple,
//                 label: 'ایپل کے ساتھ سائن اپ کریں',
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

// class SocialButton extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final VoidCallback onPressed;

//   const SocialButton({
//     required this.icon,
//     required this.label,
//     required this.onPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return OutlinedButton.icon(
//       onPressed: onPressed,
//       icon: Icon(icon, size: 20),
//       label: Text(label),
//       style: OutlinedButton.styleFrom(
//         minimumSize: Size(double.infinity, 48),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
              CommonTextField(
                hintText: 'ای میل درج کریں',
                controller: emailController,
              ),
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
                  _authController.register(
                    emailController.text.trim(),
                    passwordController.text.trim(),
                    nameController.text.trim()
                  );
                },
              

              ),
              const SizedBox(height: 16),
               TextButton( 
                 onPressed: () {
                  Get.toNamed(AppRoutes.login);
                },
                child: Text('یا', style: TextStyle(fontSize: 14)),),
              
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
