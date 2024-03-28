import 'package:get/get.dart';
import 'package:select_coffe/screens/login.dart';
import 'package:select_coffe/screens/register.dart';
import 'package:select_coffe/screens/splash.dart';

import '../controllers/auth_controller.dart';
import '../controllers/brew_controller.dart';
import '../screens/home.dart';

class AppRoutues{
 static late String userid = AuthController.instance.getUser()!.uid;
  static String splash = "/";
  static String login = "/login";
  static String register = "/register";
  static String home = "/home";
  static List<GetPage> routues () => [
    GetPage(name: splash, page: () => SplashScreen(),),
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: register, page: () => RegisterPage(),binding: BindingsBuilder(() {
      Get.put(DatabaseController(uid: userid));   
    })),
    GetPage(name: home, page: () => HomePage(),transition: Transition.native,transitionDuration: Duration(seconds: 2),
    binding: BindingsBuilder(() {
      Get.put(DatabaseController(uid: userid));   
    })
    ),
  ];
}