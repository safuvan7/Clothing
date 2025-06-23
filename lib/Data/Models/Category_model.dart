
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String parentId;
  bool isFeatured;
  String image;

  CategoryModel({
    required this.id,
    required this.name,
    required this.isFeatured,
    this.parentId = '',
    required this.image,
  });

//   Empty Helper Function
static CategoryModel empty() => CategoryModel(id: '', name: '', isFeatured: false, image: '');


// convert model to json structure sa that you can store data in firebase
Map<String, dynamic> toJson() {
  return{
    'Name' : name,
    'Image' : image,
    'IsFeatured' : isFeatured,
    'ParentId' : parentId
  };
}

// Map Json oriented document snapshot from firebase to userModel
factory CategoryModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
  if(document.data() != null){
    final data = document.data()!;

  //   Map JSON record to the model
    return CategoryModel(
        id: document.id,
        name: data['Name'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
      parentId: data['ParentId'] ?? '',
      image: data['Image'] ?? '',
    );
  } else {
     return CategoryModel.empty();
  }
}



}