

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CategoryController extends GetxController {
  // Dynamically populated categories based on selected product
  var categories = <String>[].obs;

  // Set categories based on product
  void setCategories(String productName) {
    if (productName == 'چاول') {
      categories.value = ['باسمتی', 'سیلہ', 'سپر باسمتی', 'براؤن چاول'];}
    else if (productName == 'آم') {
      categories.value =['چونسا آم', 'انور رٹول آم', 'سندھڑی آم', 'لنگڑا آم', 'دسہری آم'];

    
    } else if (productName == 'سیب') {
      categories.value = ['سرخ سیب', 'سبز سیب', 'سنہری سیب'];
    } else if (productName == 'گندم') {
      categories.value =  ['سفید گندم', 'سرخ گندم'];
    } 
  }
}
