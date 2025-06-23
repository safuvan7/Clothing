import 'package:app_project/Data/Models/user_model.dart';
import 'package:app_project/Data/repositories/authentication/authentication_repository.dart';
import 'package:app_project/Utils/Exception/firebase_exception.dart';
import 'package:app_project/Utils/Exception/platform_Exception.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // function to save user data to firestore
  Future<void> savedUserRecord(UserModel user) async {
    try {
      await _db.collection('Users').doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw fireExcptn(e.code).message;
    } on FormatException catch (_) {
      throw FormatException();
    } on PlatformException catch (e) {
      throw platfmExcptn(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again. ';
    }
  }

//   function to fetch user details based on user Id
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db.collection('Users').doc(AuthenticationRepository.instance.authUser?.uid).get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw fireExcptn(e.code).message;
    } on FormatException catch (_) {
      throw FormatException();
    } on PlatformException catch (e) {
      throw platfmExcptn(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again. ';
    }
  }


// Function to update user data in firestore
  Future<void> updateUserData(UserModel updatedUser) async {
    try {
      await _db.collection('Users').doc(updatedUser.id).update(updatedUser.toJson());
    } on FirebaseException catch (e) {
      throw fireExcptn(e.code).message;
    } on FormatException catch (_) {
      throw FormatException();
    } on PlatformException catch (e) {
      throw platfmExcptn(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again. ';
    }
  }

//   Update any field in specific Users Collection
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db.collection('Users').doc(AuthenticationRepository.instance.authUser?.uid).update(json);
    } on FirebaseException catch (e) {
      throw fireExcptn(e.code).message;
    } on FormatException catch (_) {
      throw FormatException();
    } on PlatformException catch (e) {
      throw platfmExcptn(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again. ';
    }
  }

//   Function to remove user data from firestore
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection('Users').doc(userId).delete();
    } on FirebaseException catch (e) {
      throw fireExcptn(e.code).message;
    } on FormatException catch (_) {
      throw FormatException();
    } on PlatformException catch (e) {
      throw platfmExcptn(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again. ';
    }
  }











}