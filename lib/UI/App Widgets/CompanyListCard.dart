import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kissan_hub/Controllers/CompanyListController.dart';
import 'package:kissan_hub/Models/Company%20Model.dart';

class CompanyItem extends StatelessWidget {
  final Company company;

  CompanyItem({required this.company});

  @override
  Widget build(BuildContext context) {
    final CompanyController controller = Get.find();

    return Container(
      margin: EdgeInsets.only(bottom: 18),
     padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color.fromRGBO(240, 253, 244, 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
           ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  company.logoUrl,
                  width: double.infinity,
                  height: 140,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 Container(
                padding: EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(35, 216, 44, 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star, size: 14, color: Colors.white),
                    SizedBox(width: 4),
                    Text(
                       company.rating.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )
                  ],
                ),
              ),
Text(
                      company.name,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),

              ],),

 SizedBox(height: 4),
  Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Text(
       
                          company.description,
                          style: TextStyle(fontSize: 12),
                        ),
    ],
  ),
                   
               
                   
                    SizedBox(height: 12),
    
                  


  Container(
    height: 40,
    width: double.infinity,
    child: ElevatedButton(
                    onPressed: () {
                       controller.selectCompany(company);
                          Get.toNamed('/productDetail'); 
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(35, 216, 44, 1),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text('تفصیلات دیکھیں', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),),
                  ),
  ),
                    
          ],
      ),
    );
  }
}
