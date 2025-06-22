import 'package:app_project/Data/Controller/email_verify_controller.dart';
import 'package:app_project/Data/repositories/authentication/authentication_repository.dart';
import 'package:app_project/Screens/Login_pg.dart';
import 'package:app_project/Screens/success_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerifyScreen extends StatelessWidget {
  const EmailVerifyScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EmailVerifyController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => AuthenticationRepository.instance.logout(),
              icon: Icon(Icons.close))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(24),
        child: Column(
          children: [
          //   image
            Image(image: AssetImage('Assets/Images/email_verify.png'),
            width: MediaQuery.of(Get.context!).size.width * 0.6,),
            SizedBox(height: 32,),
            
            // Text & subtitle
            Text('Verify Your Email Address',style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
            SizedBox(height: 16,),
            Text(email ?? '',style: Theme.of(context).textTheme.labelLarge,textAlign: TextAlign.center,),
            SizedBox(height: 16,),
            Text("Congratulations! Your Account Awaits: Verify Your Email to Start Shopping and Experience a World of Unrivaled Deals and Personalized Offers.",
              style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,
            ),
            SizedBox(height: 32,),
            
          //   Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.checkEmailVerificationStatus(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    fixedSize: Size(30, 30),
                    minimumSize: Size.fromHeight(55),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  child: Text('Continue')),
            ),
            SizedBox(height: 16,),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                  onPressed: () => controller.sendEmailVerification(),
                  child: Text('Resend email')),
            )
            
            
          ],
        ),),
      ),
    );
  }
}
