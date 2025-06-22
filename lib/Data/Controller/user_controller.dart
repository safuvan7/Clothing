import 'package:app_project/Data/Models/user_model.dart';
import 'package:app_project/Data/repositories/User/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());
  
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }


  // fetch user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final User = await userRepository.fetchUserDetails();
      this.user(User);
      profileLoading.value = false;
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }



  // load user data from Firestore
  Future<UserModel?> getUserData() async{
    try {
      String uid = auth.currentUser!.uid;
      
      DocumentSnapshot doc = await _db.collection('users').doc(uid).get();

      if (doc.exists) {
        return UserModel.fromSnapshot(doc.data() as DocumentSnapshot<Map<String,dynamic>>);
      }
      final userData = await userRepository.fetchUserDetails();
      user.value = userData;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
    return null;
  }


  // save user data to firestore
  Future<void> saveUser(UserModel usermodel) async {
    try {
      await userRepository.savedUserRecord(usermodel);
      user.value = usermodel;
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }


  // update full user model
  Future<void> updateUser(UserModel updatedUser) async {
    try {
      await userRepository.updateUserData(updatedUser);
      user.value = updatedUser;
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }


  // update specific field(s)
  Future<void> updateUserField(Map<String, dynamic> field) async {
    try {
      await userRepository.updateSingleField(field);
      await getUserData();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}