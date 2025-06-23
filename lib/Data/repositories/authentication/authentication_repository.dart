import 'package:app_project/Screens/Bottom_Navigation_Screen.dart';
import 'package:app_project/Screens/email_verify_screen.dart';
import 'package:app_project/Screens/forgot_password.dart';
import 'package:app_project/Screens/Login_pg.dart';
import 'package:app_project/Screens/Onboarding_screen.dart';
import 'package:app_project/Utils/Exception/firebase_auth_exception.dart';
import 'package:app_project/Utils/Exception/firebase_exception.dart';
import 'package:app_project/Utils/Exception/platform_Exception.dart';
import 'package:app_project/Utils/device/storage_utility.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  User? get authUser => _auth.currentUser;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    final user = _auth.currentUser;

    if(user != null) {

      if(user.emailVerified){

        Get.offAll(() => BottomNavigationScreen());
      } else{

        Get.offAll(() => EmailVerifyScreen(email: _auth.currentUser?.email,));
      }
    } else {
      // local Storage
      deviceStorage.writeIfNull('IsFirstTime', true);
      // check if its the first time launching the app
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => LoginScreen())
          : Get.offAll(() => OnboardingScreen());
    }

  }

  /* -------------------- Email & Password sign-In ------------------- */

  // SignIn
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw SFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw fireExcptn(e.code).message;
    } on FormatException catch(_) {
      throw FormatException();
    } on PlatformException catch (e) {
      throw platfmExcptn(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }



  // register
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw SFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw fireExcptn(e.code).message;
    } on FormatException catch(_) {
      throw FormatException();
    } on PlatformException catch (e) {
      throw platfmExcptn(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  // mail Verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    }  on FirebaseAuthException catch (e) {
      throw SFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw fireExcptn(e.code).message;
    } on FormatException catch(_) {
      throw FormatException();
    } on PlatformException catch (e) {
      throw platfmExcptn(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }



       // ------- logout -------
   Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => LoginScreen());
    }  on FirebaseAuthException catch (e) {
      throw SFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw fireExcptn(e.code).message;
    } on FormatException catch(_) {
      throw FormatException();
    } on PlatformException catch (e) {
      throw platfmExcptn(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
   }







}