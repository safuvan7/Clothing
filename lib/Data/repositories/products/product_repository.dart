import 'dart:io';

import 'package:app_project/Data/Models/Product_Model.dart';
import 'package:app_project/Data/Service/Firebase_Storage_Service.dart';
import 'package:app_project/Utils/Exception/firebase_exception.dart';
import 'package:app_project/Utils/Exception/platform_Exception.dart';
import 'package:app_project/common/enum/enums.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductRepository extends GetxController {
   static ProductRepository get instance => Get.find();

   //    firestore instane for database interactions
   final _db = FirebaseFirestore.instance;


   // Get limited featured products
   Future<List<ProductModel>> getFeaturedProducts() async {
     try{
       final snapshot = await _db.collection('Products').where('IsFeatured', isEqualTo: true).limit(4).get();
       return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
       
     } on FirebaseException catch (e) {
       throw fireExcptn(e.code).message;
     } on PlatformException catch (e) {
       throw platfmExcptn(e.code).message;
     } catch (e) {
       throw 'Something went wrong. Please try again.';
     }
   }

   // Get limited featured products
   Future<List<ProductModel>> getAllFeaturedProducts() async {
     try{
       final snapshot = await _db.collection('Products').where('IsFeatured', isEqualTo: true).limit(4).get();
       return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
     } on FirebaseException catch (e) {
       throw fireExcptn(e.code).message;
     } on PlatformException catch (e) {
       throw platfmExcptn(e.code).message;
     } catch (e) {
       throw 'Something went wrong. Please try again.';
     }
   }

   // Get limited featured products
   Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
     try{
       final querySnapshot = await query.get();
       final List<ProductModel> productList = querySnapshot.docs.map((doc) => ProductModel.fromQuerySnapshot(doc)).toList();
       return productList;
     } on FirebaseException catch (e) {
       throw fireExcptn(e.code).message;
     } on PlatformException catch (e) {
       throw platfmExcptn(e.code).message;
     } catch (e) {
       throw 'Something went wrong. Please try again.';
     }
   }

   Future<List<ProductModel>> getFavoriteProducts(List<String> productIds) async {
     try{
       final snapshot = await _db.collection('Products').where(FieldPath.documentId,whereIn: productIds).get();
       return snapshot.docs.map((querySnapshot) => ProductModel.fromSnapshot(querySnapshot)).toList();
     } on FirebaseException catch (e) {
       throw fireExcptn(e.code).message;
     } on PlatformException catch (e) {
       throw platfmExcptn(e.code).message;
     } catch (e) {
       throw 'Something went wrong. Please try again.';
     }
   }

   Future<List<ProductModel>> getProductsForBrand({required String brandId, int limit = -1}) async {
     try { 
       final querySnapshot = limit == -1
           ? await _db.collection('Products').where('Brand.Id', isEqualTo: brandId).get()
           : await _db.collection('Products').where('Brand.Id', isEqualTo: brandId).limit(limit).get();

       final products = querySnapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
       return products;

       
     } on FirebaseException catch (e) {
       throw fireExcptn(e.code).message;
     } on PlatformException catch (e) {
       throw platfmExcptn(e.code).message;
     } catch (e) {
       throw 'Something went wrong. Please try again.';
     }
   }

   Future<List<ProductModel>> getProductsForCategory({required String categoryId, int limit = 4}) async {
     try {
       QuerySnapshot productCategoryQuery = limit == -1
           ? await _db.collection('ProductCategory').where('categoryId', isEqualTo: categoryId).get()
           : await _db.collection('ProductCategory').where('categoryId', isEqualTo: categoryId).limit(limit).get();

       List<String> productIds = productCategoryQuery.docs.map((doc) => doc['productId'] as String).toList();
       
       final productsQuery = await _db.collection('Products').where(FieldPath.documentId,whereIn: productIds).get();

       List<ProductModel> products = productsQuery.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();

       return products;

     } on FirebaseException catch (e) {
       throw fireExcptn(e.code).message;
     } on PlatformException catch (e) {
       throw platfmExcptn(e.code).message;
     } catch (e) {
       throw 'Something went wrong. Please try again.';
     }
   }
   
   // Upload dummy data to the cloud firebase
   Future<void> uploadDummyData(List<ProductModel> products) async {
     try {
     //   upload all the products along with their images
       final storage = Get.put(sFirebaseStorageService());

     //   loop through each product
       for (var product in products) {
       //   Get image data link from local assets
         final thumbnail = await storage.getImageDataFromAsset(product.thumbnail);

       //   upload image and get its URL
         final url = await storage.uploadImageData('Assets/Images', thumbnail, product.thumbnail.toString());

       //   assign URL to product.thumbnail attribute
         product.thumbnail = url;

       //   products list of images
         if (product.images != null && product.images!.isNotEmpty) {
           List<String> imageUrl = [];
           for (var image in product.images!) {

           //   Get image data link from local assets
             final assetImage = await storage.getImageDataFromAsset(image);

           //   upload image and get it URL
             final url = await storage.uploadImageData('Assets/Images', assetImage, image);

           //   assign URl to product.thumbnail attribute
             imageUrl.add(url);
           }
           product.images!.clear();
           product.images!.addAll(imageUrl);
         }
         
       //   upload Variation images
         if(product.productType == ProductType.variable.toString()) {
           for (var variation in product.productVariation!) {
           //   Get image dat link from local assets
             final assetImage = await storage.getImageDataFromAsset(variation.image);
             
           //   upload image and get its URl
             final url = await storage.uploadImageData('Assets/Images', assetImage, variation.image);
             
           //   assign URL to variation.image attribute
             variation.image = url;
           }
         }
         
       //   store product in firestore
         await _db.collection('Products').doc(product.id).set(product.toJson());
       }
     } on FirebaseException catch (e) {
       throw e.message!;
     } on SocketException catch (e) {
       throw e.message;
     } on PlatformException catch (e) {
       throw e.message!;
     } catch (e) {
       throw e.toString();
     }

   }

}