

import 'package:get/get.dart';
import 'package:kissan_hub/Models/Company%20Model.dart';

class CompanyController extends GetxController {
  // List of all companies for different products
  var allCompanies = <Company>[
    Company(
      name: 'IT Foods',
      logoUrl: 'assets/images/G1.png',
      description: 'Best quality rice from trusted farms.',
      rating: 4.8,
      productName: 'چاول',  // Rice product
      price: 55,
      weight: '14Kg',
      location: 'رحیم یار خان, پنجاب',
      
    ),
    Company(
      name: 'Farm Fresh',
      logoUrl: 'assets/images/R4.png',
      description: 'Fresh fruits and vegetables directly from farm.',
      rating: 4.7,
      productName: 'سیب',  // Apple product
      price: 40,
      weight: '1Kg',
      location: 'لاہور, پنجاب',
    ),
    Company(
      name: 'Grain Millers',
      logoUrl: 'assets/images/G1.png',
      description: 'High-quality wheat products.',
      rating: 4.9,
      productName: 'گندم',  // Wheat product
      price: 35,
      weight: '25Kg',
      location: 'فیصل آباد, پنجاب',
    ),
    Company(
      name: 'Tropical Fruits',
      logoUrl: 'assets/images/R4.png',
      description: 'Fresh mangoes from the farm.',
      rating: 4.5,
      productName: 'آم',  // Mango product
      price: 60,
      weight: '1Kg',
      location: 'کراچی, سندھ',
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
