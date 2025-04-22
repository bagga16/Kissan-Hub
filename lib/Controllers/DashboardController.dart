import 'package:get/get.dart';

class DashboardController extends GetxController {
  var selectedIndex = 3.obs; // default: home

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }
}
