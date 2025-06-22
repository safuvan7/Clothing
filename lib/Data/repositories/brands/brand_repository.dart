import 'package:app_project/Data/Models/Brand_Model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../Utils/Exception/firebase_exception.dart';
import '../../../Utils/Exception/format_Exception.dart';
import '../../../Utils/Exception/platform_Exception.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();
  
  final _db = FirebaseFirestore.instance;
  
  Future<List<BrandModel>> getAllBrands() async {
    try {
      
      final snapshot = await _db.collection('Brands').get();
      final result = snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
      return result;

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

  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {

     QuerySnapshot brandCategoryQuery = await _db.collection('BrandCategory').where('categoryId', isEqualTo: categoryId).get();
     
     List<String> brandIds = brandCategoryQuery.docs.map((doc) => doc['brandId'] as String).toList();
     
     final brandQuery = await _db.collection('Brands').where(FieldPath.documentId, whereIn: brandIds).limit(2).get();

     List<BrandModel> brands = brandQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();

     return brands;

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
  
  
  
  
  
  
  
  
  
  
}