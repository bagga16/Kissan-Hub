import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:kissan_hub/Bindings/auth_binding.dart';
import 'package:kissan_hub/Utils%20and%20Services/app_routes.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(KissanHubApp());
}

class KissanHubApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
      color: Color.fromRGBO(35, 216, 44, 1),
    
      title: 'Kissan Hub',
      initialBinding: AuthBinding(),
      initialRoute: AppRoutes.splash,
      getPages: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
