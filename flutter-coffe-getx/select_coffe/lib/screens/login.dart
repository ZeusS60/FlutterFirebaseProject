import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:select_coffe/controllers/auth_controller.dart';
import 'package:select_coffe/screens/register.dart';

class LoginPage extends StatefulWidget {
   LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
final emailC = new TextEditingController();

final passwordC = new TextEditingController();

final _formKey = GlobalKey<FormState>();

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
          GestureDetector(onTap: () => Get.off(RegisterPage(),transition: Transition.noTransition), child: Center(child: Text("Register"))),
          SizedBox(
            width: 5,
          ),
        ],
      ),
      body: Container(
          color: Colors.brown.shade300,
          child: Form(
            key: _formKey,
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
                  validator: (value) {
                    if(value ==null || value.isEmpty) {
                      return 'Lütfen bir e-posta adresi girin';
                    }
                    if(!value.contains('@')) {
                      return 'Lütfen geçerli bir e-posta adresi girin';
                    }
                    return null;
                  },
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
                  validator: (value) {

                    if(value ==null || value.isEmpty) {
                      return 'Lütfen bir şifre giriniz';
                    }
                    return null;
                  },
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
              TextButton(onPressed: () {
                if(_formKey.currentState!.validate()){
                  AuthController.instance.login(emailC.text.trim(), passwordC.text.trim());
                }
              }, child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                child: Text("Giriş Yap",style: TextStyle(color: Colors.white),),
              ),style: TextButton.styleFrom(backgroundColor: Colors.pink),
              )
            ],
          ))),
    );
  }
}
