import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:select_coffe/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';


import 'bindings/initial_bindings.dart';
 void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
 SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
 await Firebase.initializeApp();
InitialBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: AppRoutues.routues(),
    );
  }
}

