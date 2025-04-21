import 'package:get/get.dart';
import 'package:kissan_hub/UI/App%20Screens/Auth%20Screens/LoginScreen.dart';
import 'package:kissan_hub/UI/App%20Screens/Auth%20Screens/SignUpScreen.dart';
import 'package:kissan_hub/UI/App%20Screens/Home%20Screens/HomeScreen.dart';
import 'package:kissan_hub/UI/App%20Screens/Product/AllCategoriesScreen.dart';
import 'package:kissan_hub/UI/App%20Screens/Product/ProductDetailsScreen.dart';
import 'package:kissan_hub/splash_screen.dart';
class AppRoutes {
  static const splash = '/splash';
  static const login = '/login';
  static const register = '/register';
  static const home = '/home';
  static const productDetail = '/productDetail';
  
  static const allCategories = '/allCategories';

  static final routes = [
    GetPage(name: splash, page: () => SplashScreen()),
    GetPage(name: login, page: () => LoginScreen()),
    GetPage(name: register, page: () => SignUpScreen()),
   GetPage(name: home, page: () => HomeScreen()),
   GetPage(name: productDetail, page: () => ProductDetailScreen()),
   GetPage(name: allCategories, page: () =>  CategoryScreen(productName: 'چاول',))
  ];
}
