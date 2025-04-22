import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kissan_hub/Controllers/ProfileController.dart';
import 'package:kissan_hub/Controllers/auth_controller.dart';
import 'package:kissan_hub/Models/user_model.dart';

class UserProfileScreen extends StatelessWidget {
  final AuthController authController = AuthController.instance;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final ProfileController controller = Get.put(ProfileController());

  final Color greenColor = Color.fromRGBO(35, 216, 44, 1);

  Future<void> _pickImage() async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      controller.updateProfileImage(File(pickedImage.path));
    }
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool readOnly = false,
  }) {
    return TextField(
      controller: controller,
      readOnly: readOnly,
      textDirection: TextDirection.rtl,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: greenColor),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: greenColor),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: greenColor, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        suffixIcon: Icon(icon, color: greenColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    UserModel? user = authController.firestoreUser.value;

    if (user == null) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
           backgroundColor: Colors.white,
           
          title: Text('User Profile')),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    nameController.text = user.name;
    emailController.text = user.email;
    phoneController.text = user.phone ?? '';
    cityController.text = user.city ?? '';
    bioController.text = user.bio ?? '';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('پروفائل'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Obx(() {
              final imagePath = controller.profileImagePath.value;
              return GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: imagePath.isNotEmpty
                      ? FileImage(File(imagePath))
                      : AssetImage('assets/images/R1.png') as ImageProvider,
                ),
              );
            }),
            SizedBox(height: 20),
            Text(nameController.text, style: TextStyle(fontSize: 20)),
            Text(
              bioController.text.isNotEmpty ? bioController.text : 'کسان',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            buildTextField(controller: nameController, label: 'نام', icon: Icons.person),
            SizedBox(height: 20),
            buildTextField(controller: emailController, label: 'ای میل', icon: Icons.email, readOnly: true),
            SizedBox(height: 20),
            buildTextField(controller: phoneController, label: 'فون نمبر', icon: Icons.phone),
            SizedBox(height: 20),
            buildTextField(controller: cityController, label: 'شہر', icon: Icons.location_city),
            SizedBox(height: 20),
            buildTextField(controller: bioController, label: 'تعرف', icon: Icons.info),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String name = nameController.text.trim();
                String phone = phoneController.text.trim();
                String city = cityController.text.trim();
                String bio = bioController.text.trim();

                authController.saveAdditionalUserInfo(name, phone, city, bio);

                Get.snackbar('کامیابی', 'پروفائل کامیابی سے اپڈیٹ ہوگیا',
                    snackPosition: SnackPosition.TOP, backgroundColor: greenColor, colorText: Colors.white);
              },
              child: Text('اپ ڈیٹ کریں', style: TextStyle(fontSize: 20),),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: greenColor,
                foregroundColor: Colors.white
              ),
            ),
            SizedBox(height: 20),
            // Logout button
            ElevatedButton(
              onPressed: authController.logout,
              child: Text('لاگ آؤٹ', style: TextStyle(fontSize: 20),),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
