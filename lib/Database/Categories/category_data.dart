import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CategoryData extends GetxController{
  static CategoryData get instance => Get.find();

  final _db = FirebaseFirestore.instance;



}