

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:kissan_hub/Controllers/auth_controller.dart';
// import 'package:kissan_hub/Models/user_model.dart';

// class UserProfileScreen extends StatelessWidget {
//   final AuthController authController = AuthController.instance;
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController cityController = TextEditingController();
//   final TextEditingController bioController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     // Fetch the current user from the authController
//     UserModel? user = authController.firestoreUser.value;

//     if (user == null) {
//       return Scaffold(
//         appBar: AppBar(title: Text('User Profile')),
//         body: Center(child: CircularProgressIndicator()),
//       );
//     }

//     // Initialize controllers with user data
//     nameController.text = user.name;
//     emailController.text = user.email;
//     phoneController.text = user.phone ?? '';
//     cityController.text = user.city ?? '';
//     bioController.text = user.bio ?? '';

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('پروفائل'),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () => Get.back(),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             GestureDetector(
//               onTap: () {
//                 // Simulate the process of updating the profile picture (add your image picker functionality here)
//                 _showImagePickerDialog(context);
//               },
//               child: CircleAvatar(
//                 radius: 50,
//                 backgroundImage: NetworkImage(user.profilePicUrl),
//                 child: user.profilePicUrl.isEmpty
//                     ? Icon(Icons.camera_alt, color: Colors.white)
//                     : null,
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'پروفائل کی تفصیلات',
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: nameController,
//               decoration: InputDecoration(
//                 labelText: 'نام',
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.person),
//               ),
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(
//                 labelText: 'ای میل',
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.email),
//               ),
//               readOnly: true,
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: phoneController,
//               decoration: InputDecoration(
//                 labelText: 'فون نمبر',
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.phone),
//               ),
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: cityController,
//               decoration: InputDecoration(
//                 labelText: 'شہر',
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.location_city),
//               ),
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: bioController,
//               decoration: InputDecoration(
//                 labelText: 'تعریف',
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.info),
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Get the updated data
//                 String name = nameController.text.trim();
//                 String phone = phoneController.text.trim();
//                 String city = cityController.text.trim();
//                 String bio = bioController.text.trim();

//                 // Update the user info in Firestore
//                 authController.saveAdditionalUserInfo(name, phone, city, bio);

//                 // Optionally, show a success message
//                 Get.snackbar('Success', 'Profile updated successfully');
//               },
//               child: Text('اپ ڈیٹ کریں'),
//               style: ElevatedButton.styleFrom(
//                 minimumSize: Size(double.infinity, 50), backgroundColor: Colors.green,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Simulate the process of changing profile picture
//   void _showImagePickerDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Change Profile Picture'),
//           content: Text('Select a new profile picture'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 // Here you can implement image picker functionality
//                 // For now, we'll just simulate by changing to a static image URL
//                 authController.updateProfilePicture('https://www.example.com/new-image.jpg');
//                 Get.back();
//               },
//               child: Text('Select Image'),
//             ),
//             TextButton(
//               onPressed: () => Get.back(),
//               child: Text('Cancel'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kissan_hub/Controllers/auth_controller.dart';
import 'package:kissan_hub/Models/user_model.dart';
import 'dart:io';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final AuthController authController = AuthController.instance;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  File? _image;

  @override
  Widget build(BuildContext context) {
    // Fetch the current user from the authController
    UserModel? user = authController.firestoreUser.value;

    if (user == null) {
      return Scaffold(
        appBar: AppBar(title: Text('User Profile')),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    // Initialize controllers with user data
    nameController.text = user.name;
    emailController.text = user.email;
    phoneController.text = user.phone ?? '';
    cityController.text = user.city ?? '';
    bioController.text = user.bio ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text('پروفائل'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: _image == null
                    ? NetworkImage(user.profilePicUrl)
                    : FileImage(_image!) as ImageProvider,
                child: user.profilePicUrl.isEmpty && _image == null
                    ? Icon(Icons.camera_alt, color: Colors.white)
                    : null,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'پروفائل کی تفصیلات',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'نام',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'ای میل',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
              readOnly: true,
            ),
            SizedBox(height: 20),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: 'فون نمبر',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: cityController,
              decoration: InputDecoration(
                labelText: 'شہر',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.location_city),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: bioController,
              decoration: InputDecoration(
                labelText: 'تعریف',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.info),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Get the updated data
                String name = nameController.text.trim();
                String phone = phoneController.text.trim();
                String city = cityController.text.trim();
                String bio = bioController.text.trim();

                // Update the user info in Firestore
                authController.saveAdditionalUserInfo(name, phone, city, bio);

                // Optionally, show a success message
                Get.snackbar('Success', 'Profile updated successfully');
              },
              child: Text('اپ ڈیٹ کریں'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50), backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to pick an image from the gallery
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });

      // Upload the image and update the Firestore profile picture URL
      // For simplicity, we are using a static URL, but this can be updated to Firebase Storage upload.
      authController.updateProfilePicture('https://www.example.com/new-image.jpg');
    }
  }
}

