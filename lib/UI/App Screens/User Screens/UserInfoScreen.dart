import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kissan_hub/Controllers/ProfileController.dart';
import 'package:kissan_hub/Controllers/auth_controller.dart';
import 'package:kissan_hub/Utils%20and%20Services/app_routes.dart';

class UserInfoScreen extends StatefulWidget {
  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  final AuthController _authController = Get.put(AuthController());
 final ProfileController controller = Get.put(ProfileController());

  final TextEditingController fullNameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController landController = TextEditingController();

  final TextEditingController bioController = TextEditingController();

 Future<void> _pickImage() async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      controller.updateProfileImage(File(pickedImage.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 60),
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
              const SizedBox(height: 20),
              const Text(
                'ذاتی تفصیلات',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'اپنی ذاتی تفصیلات درج کریں',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: fullNameController,
                decoration: InputDecoration(
                  hintText: 'صارف نام',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Container(
                    height: 55,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children:  [
                     Image.asset('assets/images/pak.png', width: 30,height: 40,),
                        
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: '92xxxxxxxxxx+',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextField(
                controller: landController,
                decoration: InputDecoration(
                  hintText: 'رکبا (ایکڑ)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: bioController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'مکمل بات',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(35, 216, 44, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () async {
                    await _authController.saveAdditionalUserInfo(
                      fullNameController.text.trim(),
                      phoneController.text.trim(),
                      landController.text.trim(),
                      bioController.text.trim(),
                    );

                    Get.offAllNamed(AppRoutes.dashboard);
                  },
                  child: const Text(
                    'اگے',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
