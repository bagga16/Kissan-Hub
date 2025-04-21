// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:kissan_hub/Controllers/auth_controller.dart';
// import 'package:kissan_hub/Utils%20and%20Services/app_routes.dart';

// class LoginScreen extends StatelessWidget {
//   final AuthController _authController = Get.find();
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
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'کسان حب میں خوش آمدید!',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 8),
//               Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'براہ کرم اپنی معلومات درج کریں',
//                     style: TextStyle(fontSize: 14),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 24),
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
//               const SizedBox(height: 12),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: TextButton(
//                   onPressed: () {},
//                   child: const Text('پاس ورڈ بھول گئے؟'),
//                 ),
//               ),
//               const SizedBox(height: 8),
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
//                     _authController.login(
//                       emailController.text.trim(),
//                       passwordController.text.trim(),
//                     );
//                   },
//                   child: const Text(
//                     'لاگ ان کریں',
//                     style: TextStyle(color: Colors.white, fontSize: 16),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               TextButton(
//                 onPressed: () {
//                   Get.toNamed(AppRoutes.register);
//                 },
//                 child: const Text('اکاؤنٹ بنائیں'),
//               ),
//               const SizedBox(height: 16),
//               const Text('یا', style: TextStyle(fontSize: 14)),
//               const SizedBox(height: 16),
//               SocialButton(
//                 icon: Icons.g_mobiledata,
//                 label: 'گوگل کے ساتھ سائن ان کریں',
//                 onPressed: () {
//                   // Google Sign-In Logic
//                 },
//               ),
//               const SizedBox(height: 10),
//               SocialButton(
//                 icon: Icons.facebook,
//                 label: 'فیس بک کے ساتھ سائن ان کریں',
//                 onPressed: () {
//                   // Facebook Sign-In Logic
//                 },
//               ),
//               const SizedBox(height: 10),
//               SocialButton(
//                 icon: Icons.apple,
//                 label: 'ایپل کے ساتھ سائن ان کریں',
//                 onPressed: () {
//                   // Apple Sign-In Logic
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

class LoginScreen extends StatelessWidget {
  final AuthController _authController = Get.find();
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
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'کسان حب میں خوش آمدید!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'براہ کرم اپنی معلومات درج کریں',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              const SizedBox(height: 24),

              /// Email Field
              CommonTextField(
                hintText: 'ای میل درج کریں',
                controller: emailController,
              
              ),
              const SizedBox(height: 16),

              /// Password Field
              CommonTextField(
                hintText: 'پاس ورڈ درج کریں',
                controller: passwordController,
                isPassword: true,
              
              ),

              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    // forgot password logic
                  },
                  child: const Text('پاس ورڈ بھول گئے؟'),
                ),
              ),
              const SizedBox(height: 8),

              /// Login Button
              CommonButton(
                title: 'لاگ ان کریں',
                onPressed: () {
                  _authController.login(
                    emailController.text.trim(),
                    passwordController.text.trim(),
                  );
                },
              ),

              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.register);
                },
                child: const Text('اکاؤنٹ بنائیں'),
              ),
              const SizedBox(height: 16),
              const Text('یا', style: TextStyle(fontSize: 14)),
              const SizedBox(height: 16),

              /// Social Buttons
              SocialButton(
                title: 'گوگل کے ساتھ سائن ان کریں',
                assetPath:'assets/images/google.png',
                onPressed: () {
                  // Google Sign-In Logic
                },
              ),
              const SizedBox(height: 10),
              SocialButton(
                title: 'فیس بک کے ساتھ سائن ان کریں',
                assetPath: 'assets/images/fb.png',
                onPressed: () {
                  // Facebook Sign-In Logic
                },
              ),
              const SizedBox(height: 10),
              SocialButton(
                title: 'ایپل کے ساتھ سائن ان کریں',
                assetPath: 'assets/images/apple.png',
                onPressed: () {
                  // Apple Sign-In Logic
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
