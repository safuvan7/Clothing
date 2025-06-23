import 'package:app_project/Data/Models/Category_model.dart';
import 'package:app_project/Data/Service/Firebase_Storage_Service.dart';
import 'package:app_project/Utils/Exception/firebase_exception.dart';
import 'package:app_project/Utils/Exception/platform_Exception.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CategoryRepository extends GetxController{
  static CategoryRepository get instance => Get.find();
  
  //   variables
  final _db = FirebaseFirestore.instance;


  // Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
  try{
    final snapshot = await _db.collection('Categories').get();
    final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
    return list;
  } on FirebaseException catch (e) {
    throw fireExcptn(e.code).message;
  } on PlatformException catch (e) {
    throw platfmExcptn(e.code).message;
  } catch (e) {
    throw 'Something went wrong. Please try again';
  }
  }

  // get Sub categories


  // upload categories to the cloud firestore
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {

    //   upload all the categories along with their image
      final storage = Get.put(SFirebaseStorageService());

    //   loop through each category
      for(var category in categories){

      //   Get ImageData link from the local assets
        final file = await storage.getImageDataFromAsset(category.image);

      //upload image and get its URl
      final url = await storage.uploadImageData('Categories', file, category.name);

      // assign URL to category.image attribute
        category.image = url;

      //   store category in Firestore
        await _db.collection("Categories").doc(category.id).set(category.toJson());
      }
    } on FirebaseException catch (e) {
      throw fireExcptn(e.code).message;
    } on PlatformException catch (e) {
      throw platfmExcptn(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}