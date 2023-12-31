import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_storage_app/configs/themes/app_colors.dart';
import 'package:flutter_storage_app/controllers/auth_controller.dart';
import 'package:flutter_storage_app/widgets/common/main_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});

  static const String routeName ="/login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: mainGradient()),
        child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.asset("assets/images/app_splash_logo.png",width: MediaQuery.of(context).size.width,height: 200,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 60),
            child: Text(
              "This is a study app. You can use as you want. You have thee full acces to all the materials in this course. ",style: TextStyle(color: onSurfaceTextColor,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
          ),
          MainButton(
          
            onTap: () {
              controller.signInWithGoogle();
            },
            
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  child: SvgPicture.asset("assets/icons/google.svg",),),
                  Center(
                    child: Text(
                      "Sign in with Google",
                      style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold),
                      
                      ),
                  )
              ],
            ),
          )
        ],),
      ),
    );
  }
}