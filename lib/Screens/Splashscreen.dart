import 'dart:async';
import 'package:app_project/Screens/Onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
        ()=> Get.to(() => OnboardingScreen())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
              image: AssetImage("Assets/Images/cloth.jpg"),
          fit: BoxFit.cover,
              opacity: 0.3,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
                Icons.shopping_cart_outlined,
              size: 150,
              color: Colors.red,
            ),
            Text('ORCA',
              style: TextStyle(
                color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              ),
            )
          ],
        ),
      ),
    );
  }
}
