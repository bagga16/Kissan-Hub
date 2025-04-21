import 'package:get/get.dart';
import 'package:kissan_hub/Models/Company%20Model.dart';

class CompanyController extends GetxController {
  var companies = <Company>[
    Company(
      name: 'IT Foods',
      logoUrl: 'assets/images/G1.png', // Placeholder logo
      description: 'Best quality rice from trusted farms.',
      rating: 4.8,
      productName: 'چاول',
      price: 55,
      weight: '14Kg',
      location: 'رحیم یار خان, پنجاب',
    ),
    Company(
      
      name: 'Farm Fresh',
      logoUrl: 'assets/images/R4.png', // Placeholder logo
      description: 'Fresh fruits and vegetables directly from farm.',
      rating: 4.7,
      productName: 'سیب',
      price: 40,
      weight: '1Kg',
      location: 'لاہور, پنجاب',
    ),
    // Add more companies here
  ].obs;

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

  // Select a company to view details
  void selectCompany(Company company) {
    selectedCompany.value = company;
  }
}
