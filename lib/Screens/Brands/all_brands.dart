import 'package:app_project/Data/Controller/brand_controller.dart';

import 'package:app_project/Screens/Brands/brand_product.dart';

import 'package:app_project/Screens/store/Store_Screen.dart';
import 'package:app_project/common/widget/texts/section_heading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/widget/Shimmer/brand_shimmer.dart';
import '../Home/Widget/grid_layout.dart';

class AllBrands extends StatelessWidget {

  const AllBrands({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text('Brand'),
        leading: BackButton(),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              sSectionHeading(title: 'Brands',showActionButton: false,),
              SizedBox(height: 16,),

            //   Brands
              Obx(() {

                if(brandController.isLoading.value) return SBrandShimmer();

                    if(brandController.allBrands.isEmpty){
                      return Center(
                        child: Text(
                          'No DataFound!',
                          style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),
                      );
                    }
                    return  Grid_layount(
                        itemCount: brandController.allBrands.length,
                        mainAxisExtent: 80,
                        itemBuilder: (context, index){
                          final brand = brandController.allBrands[index];

                          return BrandCard(
                            showBorder: true,
                            brand: brand,
                            onTap: () => Get.to(() => BrandProduct(brand: brand,)),
                          );
                        });
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}
