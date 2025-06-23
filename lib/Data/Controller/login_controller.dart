import 'package:app_project/Data/repositories/authentication/authentication_repository.dart';
import 'package:app_project/Utils/Helper/network_manager.dart';
import 'package:app_project/Utils/popups/fullscreen_loader.dart';
import 'package:app_project/Utils/popups/loaders.dart';
import 'package:app_project/common/Images/sImages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class loginController extends GetxController {
  static loginController get instance => Get.find();

  final localStorage = GetStorage();
  final rememberME = false.obs;
  final showPassword = true.obs;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();


  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL');
    password.text = localStorage.read('REMEMBER_ME_PASSWORD');
    super.onInit();
  }

  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start loader
      FullScreenLoader.openDialog('Logging you in...', sImages.processing);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      // form validation

      if (!loginFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Save data if remember Me is selected
      if(rememberME.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }


      // login user using email & password authentication
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // remove loader
      FullScreenLoader.stopLoading();

      // redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      FullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

}