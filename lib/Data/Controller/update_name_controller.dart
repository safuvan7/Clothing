import 'package:app_project/Data/Controller/user_controller.dart';
import 'package:app_project/Data/repositories/User/user_repository.dart';
import 'package:app_project/Screens/Profile/Profile_Screen.dart';
import 'package:app_project/Utils/Helper/network_manager.dart';
import 'package:app_project/Utils/popups/fullscreen_loader.dart';
import 'package:app_project/Utils/popups/loaders.dart';
import 'package:app_project/common/Images/sImages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance  => Get.find();

  final TextEditingController  firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }


  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstname;
    lastName.text = userController.user.value.lastname;
  }

  Future<void> updateUserName() async {
    try {
      FullScreenLoader.openDialog('We aer updating your information...', sImages.processing);

      final isConnected = await NetworkManager.instance.isConnected();
      if (isConnected) {
        FullScreenLoader.stopLoading();
        return ;
      }

      if(!updateNameFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> name = {'FirstName' : firstName.text.trim(), 'LastName' : lastName.text.trim()};
      await userRepository.updateSingleField(name);

      userController.user.value.firstname = firstName.text.trim();
      userController.user.value.lastname = lastName.text.trim();

      FullScreenLoader.stopLoading();

      TLoaders.successSnackBar(title: 'Congratulations' , message: 'Your Name has been updated.');

      Get.off(() => ProfileScreen());
    }catch (e) {
      FullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }













  }


}