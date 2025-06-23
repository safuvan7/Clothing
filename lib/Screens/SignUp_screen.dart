
import 'package:app_project/Data/Controller/signUp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: controller.signUpFormKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15,top: 50,right: 15),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30,),
                  Text("Let's create your account",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 27) ,),
                  SizedBox(height: 50,),

                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: controller.firstName,
                          expands: false,
                          decoration: InputDecoration(
                            labelText: 'First Name',
                            prefixIcon: Icon(Icons.person_outline),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                            )
                          ),
                          validator: (name){
                            if(name!.isEmpty){
                              return "enter valid name";
                            }
                            return null;
                          },
                          // onSaved: (name){
                          //   firstName = name;
                          // },
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: TextFormField(
                          controller: controller.lastName,
                          expands: false,
                          decoration: InputDecoration(
                            labelText: 'Last Name',
                            prefixIcon: Icon(Icons.person_outline),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                            )
                          ),
                          validator: (name){
                            if(name!.isEmpty){
                              return "enter valid name";
                            }
                            return null;
                          },
                          // onSaved: (name){
                          //   lastName = name;
                          // },
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: 10,),
                  TextFormField(
                    controller: controller.username,
                    decoration: InputDecoration(
                      labelText: "Username",
                      // hintText: "Username",
                      prefixIcon: Icon(Icons.person_outline),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    validator: (name){
                      if(name!.isEmpty){
                        return "enter valid name";
                      }
                      return null;
                    },
                    // onSaved: (name){
                    //   username = name;
                    // },
                  ),
                  SizedBox(height:15,),
                  TextFormField(
                    controller: controller.email,
                    decoration: InputDecoration(
                        labelText: "Email",
                        // hintText: "Email",
                        prefixIcon: Icon(Icons.email_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                    ),
                    validator: (email){
                      if(email!.isEmpty){
                        return "enter a valid email";
                      }
                      return null;
                    },
                    // onSaved: (mail){
                    //   email = mail;
                    // },
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    controller: controller.phone,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: "Phone Number",
                      // hintText: "Phone Number",
                      prefixIcon: Icon(Icons.phone_android_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                    validator: (num){
                      if(num == null || num.isEmpty){
                        return " Please enter the phone number";
                      }
                      if (num.length != 10){
                        return "Please enter a 10 digit mobile number";
                      }
                      return null;
                    },
                    // onSaved: (num){
                    //   phoneNo = num;
                    // },
                  ),
                  SizedBox(height: 15,),
                  Obx(
                    () => TextFormField(
                      controller: controller.password,
                      obscureText: controller.showPassword.value,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                          labelText: "Password",
                          // hintText: "Password",
                          prefixIcon: Icon(Icons.lock_outline),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          suffixIcon: IconButton(
                              onPressed: () => controller.showPassword.value = !controller.showPassword.value,
                              icon: Icon(controller.showPassword.value ? Iconsax.eye_slash : Iconsax.eye)),
                      ),
                      validator: (pass){
                        if(pass!.length < 6){
                          return "password must be at least 6 character";
                        }
                        return null;
                      },
                      // onSaved: (pass){
                      //   password = pass;
                      // },
                    ),
                  ),
                  SizedBox(height: 10,),
                  Obx(
                    () =>  TextFormField(
                      controller: controller.confirm,
                      obscuringCharacter: "*",
                      obscureText: controller.showPassword.value,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        prefixIcon: Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                            onPressed: () => controller.showPassword.value = !controller.showPassword.value,
                            icon: Icon(controller.showPassword.value ? Icons.visibility_off : Icons.visibility)),
                      ),
                      validator: (cPass){
                        if (cPass!.length < 6){
                          return "Please enter re-password";
                        }if(controller.password.text != controller.confirm.text){
                          return "Password Do not match";
                        }
                        return null;
                      },
                      // onSaved: (cPass){
                      //   cPassword = cPass;
                      // },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () => controller.signup(),


                      // if(_formKey.currentState!.validate()){
                      //   _formKey.currentState!.save();
                      //   authController.phoneAuthentication(
                      //       phoneNoController.text.trim()
                      //   );
                      //   setState(() {
                      //     _isLoading = true;
                      //   });
                      //   AuthController().signUp(
                      //       email: emailControlller.text.trim(),
                      //       phone: phoneNoController.text.trim(),
                      //       username: nameController.text.trim(),
                      //       password: passwordController.text.trim()).then((value) async {
                      //      if(value == null){
                      //        await authController.savedUserData(
                      //            username: nameController.text.trim(),
                      //            email: emailControlller.text.trim(),
                      //            phone: phoneNoController.text.trim(),
                      //            password: passwordController.text.trim(),
                      //        );
                      //        setState(() {
                      //          _isLoading = false;
                      //        });
                      //        if (value == null) {
                      //          Get.snackbar('Success', 'Account created successfully');
                      //          Get.offAll(() => EmailVerifyScreen());
                      //        } else {
                      //          Get.snackbar("Error", value);
                      //        }
                      //      }
                      //   });
                      // }

                      style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(55),
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          )
                      ), child: Text("Create Account",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
