import 'package:flutter_storage_app/controllers/question_paper/question_paper_controller.dart';
import 'package:flutter_storage_app/controllers/zoom_drawer_controller.dart';
import 'package:flutter_storage_app/screens/home/home_screen.dart';
import 'package:flutter_storage_app/screens/introduction/introduction.dart';
import 'package:flutter_storage_app/screens/login/login_screen.dart';
import 'package:get/get.dart';

import '../screens/splash/splash_screen.dart';
import '../services/firebase_storage_service.dart';

class AppRoutues {
  static List<GetPage> routues() => [
        GetPage(name: '/', page: () =>  const SplashScreen()),
        GetPage(name: '/introduction', page: () =>  const AppIntroductionScreen()),
        GetPage(name: '/home', page: () =>  const HomeScreen(),binding: BindingsBuilder(() {
          Get.put(QuestionPaperController());
          Get.put(FirebaseStorageService());
          Get.put(MyZoomDrawerController());
        }),),
        GetPage(name: LoginScreen.routeName, page: () => const LoginScreen())
      ];
}
