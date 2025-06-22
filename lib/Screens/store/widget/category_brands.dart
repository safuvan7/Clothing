import 'package:app_project/Data/Controller/brand_controller.dart';
import 'package:app_project/Data/Models/Category_model.dart';
import 'package:app_project/Screens/store/Store_Screen.dart';
import 'package:app_project/Utils/device/cloud_helpr_Function.dart';
import 'package:app_project/common/widget/Shimmer/Boxes_Shimmer.dart';
import 'package:app_project/common/widget/Shimmer/listTile_shimmer.dart';
import 'package:flutter/material.dart';

import '../../../common/Images/sImages.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
      future: controller.getBrandsForCategory(category.id),
      builder: (context, snapshot) {

        const loader = Column(
          children: [
            ListtileShimmer(),
            SizedBox(height: 16,),
            BoxesShimmer(),
            SizedBox(height: 16,),
          ],
        );

        final widget = SCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
        if (widget != null) return widget;

        final brands = snapshot.data!;

        return ListView.builder(
          shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: brands.length,
            itemBuilder: (context, index){
            final brand = brands[index];
            return FutureBuilder(
              future: controller.getBrandProducts(brandId: brand.id,limit: 3),
              builder: (context, snapshot) {

                final widget = SCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);
                if (widget != null) return widget;

                final products = snapshot.data!;

                return BrandShow(brand: brand, images: products.map((e) => e.thumbnail).toList());
              }
            );
            },
        );


      }
    );
  }
}
