import 'dart:io';

import 'package:app_project/Data/Models/banner_model.dart';
import 'package:app_project/Utils/Exception/firebase_exception.dart';
import 'package:app_project/Utils/Exception/format_Exception.dart';
import 'package:app_project/Utils/Exception/platform_Exception.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  //   variables
  final _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> uploadBanner(String path, File file) async {
    await _storage.ref(path).putFile(file);
}

  //    Get all order related to current user
  Future<List<BannerModel>> fetchBanners() async {
    try{
      final result = await _db.collection('Banners').where('Active', isEqualTo: true).get();
      return result.docs.map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot)).toList();
      
    } on FirebaseException catch(e) {
      throw fireExcptn(e.code).message;
    } on FormatException catch(_) {
      throw const FrmtExcptn();
    } on PlatformException catch(e) {
      throw platfmExcptn(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }


  //  upload Banners to the cloud Firebase

}