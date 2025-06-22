import 'package:app_project/Data/Controller/brand_controller.dart';
import 'package:app_project/Data/Models/Brand_Model.dart';
import 'package:app_project/Screens/all_Products/View_products.dart';
import 'package:app_project/Screens/store/Store_Screen.dart';
import 'package:app_project/Utils/device/cloud_helpr_Function.dart';
import 'package:app_project/common/widget/Shimmer/vertical_product_shimmer.dart';
import 'package:flutter/material.dart';

class BrandProduct extends StatelessWidget {
  const BrandProduct({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text(brand.name),
        leading: BackButton(),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(24),
          child: Column(
            children: [
            //   Brand Details
              BrandCard(showBorder: true, brand: brand,),
              SizedBox(height: 32,),

              FutureBuilder(
                future: controller.getBrandProducts(brandId: brand.id),
                builder: (context, snapshot) {

                  const loader = VerticalProductShimmer();
                  final widget = SCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                  if (widget != null) return widget;

                  final brandProducts = snapshot.data!;
                  return Sortable_P(products: brandProducts,);
                }
              ),
            ],
          ),

        ),
      ),
    );
  }
}
