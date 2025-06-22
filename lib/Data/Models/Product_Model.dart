import 'dart:core';

import 'package:app_project/Data/Models/product_attributes_model.dart';
import 'package:app_project/Data/Models/product_variation_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'Brand_Model.dart';

class ProductModel{
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAttribute;
  List<ProductVariationModel>? productVariation;


  ProductModel({
    required this.id,
    required this.title,
    required this.stock,
    required this.price,
    required this.thumbnail,
    required this.productType,
    this.sku,
    this.brand,
    this.date,
    this.images,
    required this.salePrice,
    this.isFeatured,
    this.description,
    this.categoryId,
    this.productAttribute,
    this.productVariation,
});

  static ProductModel empty() => ProductModel(
      id: '',
      title: '',
      stock: 0,
      price: 0,
      thumbnail: '',
      productType: '',
      salePrice: 0.0,
  );


  toJson() {
    return{
      'SKU' : sku,
      'Title': title,
      'Stock':stock,
      'Price':price,
      'Images': images ?? [],
      'Thumbnail': thumbnail,
      'SalePrice': salePrice,
      'IsFeatured': isFeatured,
      'CategoryId': categoryId,
      'Brand': brand!.toJson(),
      'Description': description,
      'ProductType': productType,
      'ProductAttributes': productAttribute != null ? productAttribute!.map((e) => e.toJson()).toList() : [],
      'ProductVariations':productVariation != null ? productVariation!.map((e) => e.toJson()).toList() : [],

    };
  }

  factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if(document.data() == null) return ProductModel.empty();
    final data = document.data()!;
    return ProductModel(
        id: document.id,
        sku: data['SKU'],
        title: data['Title'],
        stock: data['Stock'] ?? 0,
        isFeatured: data['IsFeatured'] ?? false,
        price: double.parse((data['Price'] ?? 0.0).toString()),
        salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
        thumbnail: data['Thumbnail'] ?? '',
        categoryId: data['CategoryId'] ?? '' ,
        description: data['Description'] ?? '',
        productType: data['ProductType'] ?? '',
      brand: BrandModel.fromJson(data['Brand']),
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      productAttribute: (data['ProductAttributes'] as List<dynamic>).map((e) => ProductAttributeModel.fromJson(e)).toList(),
      productVariation: (data['ProductVariations'] as List<dynamic>).map((e) => ProductVariationModel.fromJson(e)).toList(),
    );
  }


  factory ProductModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    return ProductModel(
        id: document.id,
        sku: data['SKU'] ?? '',
        title: data['Title'] ?? '',
        stock: data['Stock'] ?? 0,
        isFeatured: data['IsFeatured'] ?? false,
        price: double.parse((data['Price'] ?? 0.0).toString()),
        salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
        thumbnail: data['Thumbnail'] ?? '',
        categoryId: data['CategoryId'] ?? '',
        description: data['Description'] ?? '',
        productType: data['ProductType'] ?? '',
        brand: BrandModel.fromJson(data['Brand']),
        images: data['Images'] != null ? List<String>.from(data['Images']) : [],
        productAttribute: (data['ProductAttributes'] as List<dynamic>).map((e) => ProductAttributeModel.fromJson(e)).toList(),
        productVariation: (data['ProductVariations'] as List<dynamic>).map((e) => ProductVariationModel.fromJson(e)).toList(),
    );
  }

}