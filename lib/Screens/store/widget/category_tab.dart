
import 'package:app_project/Data/Controller/Category_controller.dart';
import 'package:app_project/Data/Models/Category_model.dart';
import 'package:app_project/Screens/Home/Home_Screen.dart';
import 'package:app_project/Screens/all_Products/View_products.dart';
import 'package:app_project/Screens/store/widget/category_brands.dart';
import 'package:app_project/Utils/device/cloud_helpr_Function.dart';
import 'package:app_project/common/Images/sImages.dart';
import 'package:app_project/common/widget/Shimmer/vertical_product_shimmer.dart';
import 'package:app_project/common/widget/texts/section_heading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Data/Models/Product_Model.dart';
import '../../Home/Widget/grid_layout.dart';
import '../Store_Screen.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return SingleChildScrollView(
      child: ListView(
        shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              children: [
                // Brand
                CategoryBrands(category: category),
                // BrandShow(images: [sImages.product46, sImages.product47, sImages.product48],),
                // BrandShow(images: [sImages.product46, sImages.product47, sImages.product48],),
                SizedBox(height: 16,),

                // Products
                FutureBuilder(
                  future: controller.getCategoryProducts(categoryId: category.id),
                  builder: (context, snapshot) {

                    final response = SCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: VerticalProductShimmer());
                    if (response != null) return response;

                    final products = snapshot.data!;

                    return Column(
                      children: [
                        sSectionHeading(
                          title: 'You might Like',
                          showActionButton: true,
                          onPressed: () => Get.to(ViewProducts(
                              title: category.name,
                            futureMethod: controller.getCategoryProducts(categoryId: category.id,limit: -1),
                          )),),
                        SizedBox(height: 16,),
                        Grid_layount(
                            itemCount: products.length,
                            itemBuilder: (context, index) => sProductCard(product: products[index])),
                        SizedBox(height: 16,),
                      ],
                    );
                  }
                ),
              ],
            ),
          ),
        ]
      ),
    );
  }
}
