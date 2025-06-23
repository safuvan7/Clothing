import 'package:app_project/Data/Models/user_model.dart';
import 'package:app_project/Data/repositories/User/user_repository.dart';
import 'package:app_project/Utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final showPassword = false.obs;
  final TextEditingController verifyEmail = TextEditingController();
  final TextEditingController verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthForKey = GlobalKey<FormState>();



  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  Future<void> savedUserRecord(UserCredential? userCredentials) async{
    try{
      if(userCredentials != null) {
        final nameParts = UserModel.nameParts(userCredentials.user!.displayName ?? '');
        final username = UserModel.generateUsername(userCredentials.user!.displayName ?? '');

        final user = UserModel(
            id: userCredentials.user!.uid,
            firstname: nameParts[0],
            lastname: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            username: username,
            email: userCredentials.user!.email ?? '',
            phone: userCredentials.user!.phoneNumber ?? '',
        );

        await userRepository.savedUserRecord(user);
      }
    } catch (e) {
      TLoaders.warningSnackBar(
          title: 'Data not saved',
        message: 'Something went wrong while saving your information. you can re-save your data in your profile',
      );
    }
  }










}