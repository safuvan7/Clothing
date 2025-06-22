import 'package:app_project/Screens/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

          //   Headings
            Text('Forgot Password',style: Theme.of(context).textTheme.headlineMedium,),
            SizedBox(height: 16,),
            Text('Don’t worry sometimes people can forget too, enter your email and we will send you a password reset link.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: 32 * 2,),

            // Text field
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
            ),
            SizedBox(height: 32,),

          //   Button
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
                  onPressed: () => Get.off(() => ResetPassword()),
                  child: Text('submit')),
            )
          ],
        ),
      ),
    );
  }
}
