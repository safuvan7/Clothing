import 'dart:async';

import 'package:app_project/Data/repositories/authentication/authentication_repository.dart';
import 'package:app_project/Screens/success_screen.dart';
import 'package:app_project/Utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class EmailVerifyController extends GetxController {
  static EmailVerifyController get instance => Get.find();

  @override
  void onInit() {
    setTimerForAutoRedirect();
    sendEmailVerification();
    super.onInit();
  }

  sendEmailVerification() async{
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(title: 'Oh Snap!', message: 'Please check your inbox and verify your email.');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  setTimerForAutoRedirect() async {
    Timer.periodic(Duration(seconds: 1), (timer) async{
     await FirebaseAuth.instance.currentUser?.reload();
     final user = FirebaseAuth.instance.currentUser;
     if(user?.emailVerified ?? false){
       timer.cancel();
       Get.off(() => SuccessScreen(
           image: 'Assets/Images/success.png',
           title: 'Your account successfully created!',
           subtitle: 'Welcome to Your Ultimate Shopping Destination: Your Account is Created, Unleash the Joy of Seamless Online Shopping!',
           onPressed: () => AuthenticationRepository.instance.screenRedirect(),
       ));
     }
    });
  }

  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified){
      Get.off(() => SuccessScreen(
        image: 'Assets/Images/success.png',
        title: 'Your account successfully created!',
        subtitle: 'Welcome to Your Ultimate Shopping Destination: Your Account is Created, Unleash the Joy of Seamless Online Shopping!',
        onPressed: () => AuthenticationRepository.instance.screenRedirect(),
      ));
    }
  }









}