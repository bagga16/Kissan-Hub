import 'dart:io';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  var profileImagePath = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadProfileImage();
  }

  Future<void> loadProfileImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    profileImagePath.value = prefs.getString('profileImagePath') ?? '';
  }

  Future<void> updateProfileImage(File pickedImage) async {
    final imagePath = pickedImage.path;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('profileImagePath', imagePath);

    profileImagePath.value = imagePath;
  }
}
