import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});


  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

List<String> images = [
  'Assets/Images/casual_T-shirt.jpg',
  'Assets/Images/Formal_pants.jpg',
  'Assets/Images/Black_Linen_shirt.jpeg',
  'Assets/Images/Ligth_blue_slim_fit_Linen_shirt.jpeg'
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
