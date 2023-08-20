import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_storage_app/bindings/initial_bindings.dart';
import 'package:flutter_storage_app/controllers/theme_controller.dart';
import 'package:flutter_storage_app/routes/app_routes.dart';
//import 'package:flutter_storage_app/data_uploader_screen.dart';
import 'package:flutter_storage_app/firebase_options.dart';
import 'package:get/get.dart';
//import 'package:get/get_navigation/get_navigation.dart';


void main() async{
  
  WidgetsFlutterBinding.ensureInitialized();
  InitialBindings().dependencies();
   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
      return GetMaterialApp(
        theme: Get.find<ThemeController>().lightTheme,
        debugShowCheckedModeBanner: false,
        getPages: AppRoutues.routues(),
      );
  }

}




/*Future<void> main() async{
 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: DataUploaderScreen(),));
}*/

