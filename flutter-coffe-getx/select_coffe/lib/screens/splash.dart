import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.brown.shade300,
        child: Center(
          child: Image(image: AssetImage("assets/images/coffe2.png"),width: 90,),
        ),
      ),
    );
  }
}