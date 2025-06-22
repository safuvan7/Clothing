import 'package:app_project/Data/Controller/Category_controller.dart';
import 'package:app_project/common/widget/Shimmer/category_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/widget/image_text/Vertical_image_text.dart';

class sHomeCategories extends StatelessWidget {
  const sHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Obx(() {
      if(categoryController.isLoading.value) return  sCategoryShimmer();
      if(categoryController.featuredCategories.isEmpty){
        return Center(
          child: Text(
            'No Data Found',style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),
          ),
        );
      }
      return SizedBox(
        height: 80,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: categoryController.featuredCategories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){
              final category = categoryController.featuredCategories[index];
              return sVerticalImageText(
                image: category.image,
                title: category.name,
                onTap: (){},
              );
            }
            ),
      );
    });
  }
}