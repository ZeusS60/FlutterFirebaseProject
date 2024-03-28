import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:select_coffe/controllers/auth_controller.dart';
import 'package:select_coffe/screens/login.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final emailC = new TextEditingController();
  final passwordC = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown.shade500,
        title: Text("Sign up to Brew Crew"),
        actions: [
          Center(
              child:
                  Image(image: AssetImage("assets/images/R.png"), width: 23)),
          SizedBox(
            width: 10,
          ),
          GestureDetector(onTap: () => Get.off(LoginPage(),transition: Transition.noTransition), child: Center(child: Text("login"))),
          SizedBox(
            width: 5,
          ),
        ],
      ),
      body: Container(
          color: Colors.brown.shade300,
          child: Form(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 45),
                child: TextFormField(
                  controller: emailC,
                  decoration: InputDecoration(
                    labelText: 'e-posta',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(5) ,
                          borderSide: BorderSide(color: Colors.redAccent)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45),
                child: TextFormField(
                  obscureText: true,
                  controller: passwordC,
                  decoration: InputDecoration(
                      labelText: 'Şifre',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5) ,
                          borderSide: BorderSide(color: Colors.redAccent)),
                          ),
                ),
              ),
              SizedBox(height: 20,),
              TextButton(onPressed: () => AuthController.instance.register(emailC.text.trim(), passwordC.text.trim()), child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11.5, vertical: 5),
                child: Text("Kayıt Ol",style: TextStyle(color: Colors.white),),
              ),style: TextButton.styleFrom(backgroundColor: Colors.pink),
              )
            ],
          ))),
    );
  }
}