import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:select_coffe/controllers/brew_controller.dart';
import 'package:select_coffe/models/user.dart';

import '../routes/app_routes.dart';
class AuthController extends GetxController {
  
    static AuthController instance = Get.find();
    var logger = Logger(printer: PrettyPrinter());
 
    @override
    void onReady(){
      initAuth();
      super.onReady();
    }

    late FirebaseAuth _auth;
    final _user = Rxn<User>();
    late Stream<User?> _authStateChanges;


     Userr? _userFromFirebaseUser(User? user) {
    return user != null ? Userr(uid: user.uid) : null;
  }



    void initAuth() async{
      await Future.delayed(const Duration(seconds: 3));
      _auth = FirebaseAuth.instance;
      _authStateChanges = _auth.authStateChanges();
      _authStateChanges.listen((User? user) { 
        _user.value = user;
      });
    navigateToLogin();
    }

    void signInAnonymously()async{
      try {
        await _auth.signInAnonymously();
        navigateToHome();
      } catch (e) {
        Get.snackbar('Giriş Hatası','Anonim giriş yapılamadı: $e');
      }
    }

     void register(String email, password)async{
     try {
     await _auth.createUserWithEmailAndPassword(email: email, password: password);
     final uid = getUser()!.uid;
     await DatabaseController(uid: uid).updateUserData('0','new crew member',100);
      navigateToLogin();
    } catch (e) {
      Get.snackbar("About User", "User message",
      backgroundColor: Colors.redAccent,
      snackPosition: SnackPosition.BOTTOM,
      titleText: Text(
        "Account creation failed",
        style: TextStyle(
          color: Colors.white
        ),
        ),
        messageText: Text(
          e.toString(),
          style: TextStyle(
          color: Colors.white
        ),
        ) 
       );
    }
  } 

  void login(String email, password)async{
    try {
     await _auth.signInWithEmailAndPassword(email: email, password: password);
      navigateToHome();
    } catch (e) {
      Get.snackbar("About User", "Login message",
      backgroundColor: Colors.redAccent,
      snackPosition: SnackPosition.BOTTOM,
      titleText: Text(
        "Login failed",
        style: TextStyle(
          color: Colors.white
        ),
        ),
        messageText: Text(
          e.toString(),
          style: TextStyle(
          color: Colors.white
        ),
        ) 
       );
    }
  }

  User? getUser(){
  _user.value = _auth.currentUser;
  return _user.value;
}

  Future<void> signOut()async{
   logger.d('Sign out');
   try {
     await _auth.signOut();
     navigateToLogin();
   } on FirebaseAuthException catch (e) {
     logger.e(e);
   }
  }

     navigateToHome(){
    Get.offAllNamed(AppRoutues.home);
  }

    navigateToLogin(){
      Get.offAllNamed(AppRoutues.login);
    }

    navigateToRegister(){
      Get.offAllNamed(AppRoutues.register);
    }

    bool isLoggedIn(){
    return _auth.currentUser != null;
  }


}