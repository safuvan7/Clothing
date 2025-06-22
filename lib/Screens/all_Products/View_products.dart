
import 'package:app_project/Data/Controller/product/all_product_controller.dart';
import 'package:app_project/Screens/Home/Home_Screen.dart';
import 'package:app_project/Utils/device/cloud_helpr_Function.dart';
import 'package:app_project/common/widget/Shimmer/vertical_product_shimmer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Data/Models/Product_Model.dart';
import '../Home/Widget/grid_layout.dart';

class ViewProducts extends StatelessWidget {
  const ViewProducts({
    super.key,
    required this.title,
    this.query,
    this.futureMethod
  });

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('All Product',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        leading: BackButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(24),
        child: FutureBuilder(
          future: futureMethod ?? controller.fetchProductsByQuery(query),
          builder: (context, snapshot) {
           const loader =  VerticalProductShimmer();
           final widget = SCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);

           if (widget != null) return widget;

           final products = snapshot.data!;

           // if (snapshot.connectionState == ConnectionState.waiting) {
           //   return loader;
           // }
           //
           // if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty){
           //   return Center(child: Text('No Data Found'));
           // }
           // if(snapshot.hasError) {
           //   return Center(child: Text('Something went wrong'));
           // }


            return Sortable_P(products: products,);
          }
        ),
        ),
      ),
    );
  }
}

class Sortable_P extends StatelessWidget {
  const Sortable_P({
    super.key, required this.products,
  });

  final List<ProductModel> products;


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());
    controller.assignProducts(products);
    return Column(
      children: [
      //   Dropdown
        DropdownButtonFormField(
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.sort),
            border: OutlineInputBorder()
          ),
          value: controller.selectedSortOption.value,
          onChanged: (value){
            controller.sortProducts(value!);
          },
          items: ['Name','Highest Price','Lower Price','Newest','Sale','Popularity']
              .map((option) => DropdownMenuItem(
            value: option,
              child: Text(option))).toList(),
        ),
        SizedBox(height: 32,),

        Obx(() => Grid_layount(
              itemCount: controller.products.length,
              itemBuilder: (context, index) => sProductCard(product: controller.products[index])),
        )
      ],
    );
  }
}
