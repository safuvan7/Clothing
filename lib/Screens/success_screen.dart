

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.onPressed
  });

  final String image,title, subtitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(24 * 2),
          child: Column(
            children: [
              // image
              Image(image: AssetImage(image),width: MediaQuery.of(Get.context!).size.width * 0.6,),
              SizedBox(height: 16,),

              // title $ subtitle
              Text(title,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
              SizedBox(height: 16,),
              Text(subtitle,
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
                    onPressed: onPressed,
                    child: Text('Continue')),
              )
            ],
          ),
        ),
      ),

    );
  }
}