

import 'package:get/get.dart';
import 'package:kissan_hub/Models/Company%20Model.dart';

class CompanyController extends GetxController {
  // List of all companies for different products
 var allCompanies = <Company>[
  Company(
    name: 'آئی ٹی فوڈز',
    logoUrl: 'assets/images/R1.png',
    description: 'اعلیٰ معیار کے چاول معتبر کھیتوں سے۔',
    rating: 4.8,
    productName: 'چاول',
    price: 55,
    weight: '14Kg',
    location: 'رحیم یار خان، پنجاب',
  ),
  Company(
    name: 'فارم فریش',
    logoUrl: 'assets/images/products.png',
    description: 'تازہ پھل اور سبزیاں براہِ راست کھیتوں سے۔',
    rating: 4.7,
    productName: 'سیب',
    price: 40,
    weight: '1Kg',
    location: 'لاہور، پنجاب',
  ),
  Company(
    name: 'گرین ملرز',
    logoUrl: 'assets/images/G2.png',
    description: 'اعلیٰ معیار کی گندم کی مصنوعات۔',
    rating: 4.9,
    productName: 'گندم',
    price: 35,
    weight: '25Kg',
    location: 'فیصل آباد، پنجاب',
  ),
  Company(
    name: 'ٹراپیکل فروٹس',
    logoUrl: 'assets/images/products.png',
    description: 'کھیتوں سے تازہ آم۔',
    rating: 4.5,
    productName: 'آم',
    price: 60,
    weight: '1Kg',
    location: 'کراچی، سندھ',
  ),
   Company(
    name: 'قدرتی چاول',
    logoUrl: 'assets/images/R4.png',
    description: 'خالص اور خوشبودار چاول دیہی علاقوں سے حاصل کردہ۔',
    rating: 4.8,
    productName: 'چاول',
    price: 55,
    weight: '14Kg',
    location: 'رحیم یار خان، پنجاب',
  ),
  Company(
    name: 'سبز باغ',
    logoUrl: 'assets/images/products.png',
    description: 'کھیتوں سے لائے گئے تازہ پھل اور سبزیاں۔',
    rating: 4.7,
    productName: 'سیب',
    price: 40,
    weight: '1Kg',
    location: 'لاہور، پنجاب',
  ),
  Company(
    name: 'زرعی ملز',
    logoUrl: 'assets/images/G1.png',
    description: 'گندم کی بہترین اقسام براہِ راست کسانوں سے۔',
    rating: 4.9,
    productName: 'گندم',
    price: 35,
    weight: '25Kg',
    location: 'فیصل آباد، پنجاب',
  ),
  Company(
    name: 'آم زون',
    logoUrl: 'assets/images/products.png',
    description: 'ذائقے دار آم، قدرتی مٹھاس کے ساتھ۔',
    rating: 4.5,
    productName: 'آم',
    price: 60,
    weight: '1Kg',
    location: 'کراچی، سندھ',
  ),
].obs;

  // Observable for filtered companies based on the selected product
  var companies = <Company>[].obs;

  // Observable for the selected company
  var selectedCompany = Company(
    name: '',
    logoUrl: '',
    description: '',
    rating: 0.0,
    productName: '',
    price: 0.0,
    weight: '',
    location: '',
  ).obs;

 void setCompaniesForProduct(String productName) {
  companies.value = allCompanies
      .where((company) => company.productName == productName)
      .toList();
}


  // Method to select a company to view details
  void selectCompany(Company company) {
    selectedCompany.value = company;  // Update the selected company
  }
}
