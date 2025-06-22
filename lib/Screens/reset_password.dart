import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.back(), icon: Icon(Icons.close))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(24),
          child: Column(
            children: [
              // image
              Image(image: AssetImage('Assets/Images/success.png'),width: MediaQuery.of(Get.context!).size.width * 0.6,),
              SizedBox(height: 16,),

              // title $ subtitle
              Text("Password Reset Email Sent",style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
              SizedBox(height: 16,),
              Text( "Your Account Security is Our Priority! We've Sent You a Secure Link to Safely Change Your Password and Keep Your Account Protected.",
                style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
              SizedBox(height: 32,),

              // Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      fixedSize: Size(30, 30),
                      minimumSize: Size.fromHeight(55),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                    onPressed: () {},
                    child: Text('Done')),
              ),
              SizedBox(height: 16,),
              SizedBox(
                width: double.infinity,
                child: TextButton(onPressed: () {}, child: Text('Resend Email')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
