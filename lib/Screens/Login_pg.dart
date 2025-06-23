
import 'package:app_project/Data/Controller/login_controller.dart';
import 'package:app_project/Screens/SignUp_screen.dart';
import 'package:app_project/Screens/forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(loginController());
    return Scaffold(
      body: Form(
        key: controller.loginFormKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage("Assets/Images/splash7.png"),
              width: 250,height: 250,),
              SizedBox(height: 50,),
              Padding(padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [

                  // email
                  TextFormField(
                    controller: controller.email,
                    decoration: InputDecoration(
                      labelText: 'Enter Email',
                      prefixIcon: Icon(Icons.person_2_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                      ),
                    validator: (value){
                      if(value!.isEmpty || !value.contains('@') || !value.contains('.com')){
                        return "Enter a valid email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15,),

                  // password
                  Obx(
                    ()=> TextFormField(
                      controller:controller.password,
                      obscureText: controller.showPassword.value,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                        labelText: 'Enter Password',
                        prefixIcon: Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                            onPressed: () => controller.showPassword.value = !controller.showPassword.value,
                            icon: Icon(controller.showPassword.value ? Icons.visibility_off : Icons.visibility)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      validator: (value){
                        if(value!.length < 6){
                          return "Password must be at least 6 characters";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      // Remember Me
                      Row(
                        children: [
                          Obx(
                              () => Checkbox(
                                  value: controller.rememberME.value,
                                  onChanged: (value) => controller.rememberME.value = !controller.rememberME.value)
                          ),
                          Text('RememberMe'),
                        ],
                      ),

                      // -- Forgot password
                      TextButton(
                          onPressed: () => Get.to(() => ForgotPassword()),
                          child: Text('Forgot Password?',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),)),
                    ],
                  ),
                  SizedBox(height: 50,),

                  // -- Elevated button
                  // -- move to Navigation screen
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => controller.emailAndPasswordSignIn(),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(55),
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          )
                      ), child: Text(
                        "Log in ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        )
                    ),
                    ),
                  ),
                  SizedBox(height: 10,),

                  // -- move to Signup screen
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          "Don't Have an Account?",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),),
                      TextButton(
                          onPressed: () => Get.to(() => SignupScreen()),
                          child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                        ),)
                      ),
                    ],
                  ),
                ],
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
