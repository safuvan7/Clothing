
import 'package:app_project/Data/Models/user_model.dart';
import 'package:app_project/Data/repositories/User/user_repository.dart';
import 'package:app_project/Data/repositories/authentication/authentication_repository.dart';
import 'package:app_project/Screens/email_verify_screen.dart';
import 'package:app_project/Utils/Helper/network_manager.dart';
import 'package:app_project/Utils/popups/fullscreen_loader.dart';
import 'package:app_project/Utils/popups/loaders.dart';
import 'package:app_project/common/Images/sImages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignUpController extends GetxController{
  static SignUpController get instance => Get.find();

  final FirebaseAuth auth = FirebaseAuth.instance;

  final showPassword = true.obs;
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirm = TextEditingController();
  final TextEditingController username = TextEditingController();
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  // void phoneAuthentication(String phoneNo) async{
  //   AuthController.instance.phoneAuthentication(phoneNo);
  // }


  void signup() async {
    try {

      // star loading
      FullScreenLoader.openDialog('We are processing your information...', sImages.processing);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        // remove loader
        FullScreenLoader.stopLoading();
        return;
      }

        // form validation
        if(!signUpFormKey.currentState!.validate()) {
          // remove loader
          FullScreenLoader.stopLoading();
          return;
        }

        //  Register user in the firebase authentication & save user data in the firebase
        final userCredential =  await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

        // save authentication user data in the firebase firestore
        final newUser = UserModel(
          id: userCredential.user!.uid,
          firstname: firstName.text.trim(),
          lastname: lastName.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
          phone: phone.text.trim(),
          password: password.text.trim(),
          createdAt: DateTime.now(),
        );


        final userRepository = Get.put(UserRepository());
        userRepository.savedUserRecord(newUser);

        // remove loader
        FullScreenLoader.stopLoading();

        // show success message
        TLoaders.successSnackBar(title: 'Congratulation', message: 'Your account has been created! verify email to continue.');

        // move to email verify screen
        Get.to(() => EmailVerifyScreen(email: email.text.trim(),));
      } catch (e) {
      // Remove loader
      FullScreenLoader.stopLoading();

      // show some generic error to the user
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}



