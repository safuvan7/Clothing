import 'package:app_project/Data/Controller/Category_controller.dart';
import 'package:app_project/Data/Controller/brand_controller.dart';
import 'package:app_project/Data/Models/Brand_Model.dart';
import 'package:app_project/Screens/Brands/all_brands.dart';
import 'package:app_project/Screens/Brands/brand_product.dart';
import 'package:app_project/Screens/Home/Home_Screen.dart';
import 'package:app_project/Screens/Home/Widget/home_Slider.dart';
import 'package:app_project/Screens/store/widget/category_tab.dart';
import 'package:app_project/Utils/device/helper_function.dart';
import 'package:app_project/common/widget/Shimmer/brand_shimmer.dart';
import 'package:app_project/common/widget/appbar/appBar.dart';
import 'package:app_project/common/widget/appbar/tabbar.dart';
import 'package:app_project/common/widget/custom_shapes/container/search_container.dart';
import 'package:app_project/common/widget/products.cart/cart_menu_icon.dart';
import 'package:app_project/common/widget/texts/section_heading.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/widget/Shimmer/sshimmer.dart';
import '../Home/Widget/grid_layout.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    final categories = CategoryController.instance.featuredCategories;

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            'Store',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
          ),
          ),
          action: [
            TCartCounterIcon(onPressed: (){}, iconColor: Colors.black,)
          ],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (context, boxScrolled){
              return [
                SliverAppBar(
                  elevation: 0,
                  scrolledUnderElevation: 10,
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: Colors.white,
                  expandedHeight: 410,
                  flexibleSpace: Padding(padding: EdgeInsets.all(24),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [

                      SizedBox(height: 16,),
                      sSearchContainer(
                        text: 'Search in Store',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      SizedBox(height: 12,),

                      sSectionHeading(
                          title: 'Brands',
                        onPressed: () => Get.to(() => AllBrands()),
                      ),
                      SizedBox(height: 16 / 1.5,),

                      Obx(
                          () {
                            if(brandController.isLoading.value) return SBrandShimmer();

                            if(brandController.featuredBrands.isEmpty){
                              return Center(
                                child: Text(
                                  'No DataFound!',
                                  style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),
                              );
                            }
                            return  Grid_layount(
                                itemCount: brandController.featuredBrands.length,
                                mainAxisExtent: 80,
                                itemBuilder: (context, index){
                                  final brand = brandController.featuredBrands[index];

                                  return BrandCard(
                                    showBorder: true, 
                                    brand: brand,
                                    onTap: () => Get.to(() => BrandProduct(brand: brand)),
                                  );
                                });
                          }
                      )
                    ],
                  ),),

                  bottom: sTabBar(
                      tabs: categories.map((category) => Tab(child: Text(category.name))).toList()
                  )
                )
              ];
            },
            body: TabBarView(
                children: categories.map((category) => CategoryTab(category: category,)).toList()
            )
        )
      ),
    );
  }
}


class BrandCard extends StatelessWidget {
  const BrandCard({
    super.key, 
    required this.showBorder, 
    this.onTap,
    required this.brand,
  });

  final BrandModel brand;
  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RounderContainer(
        padding: EdgeInsets.all(8.0),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            Flexible(
              child: Circular_image(
                image: brand.image,
                isNetworkImage: true,
                backgroundColor: Colors.transparent,
              ),
            ),
            SizedBox(height: 16 / 2,),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 5,),
                      Text(
                       brand.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(width: 2,),
                      Icon(Icons.verified,color: Colors.red,size: 10,)
                    ],
                  ),
                  Text(
                    '${brand.productsCount ?? 0} products',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 10
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}





class BrandShow extends StatelessWidget {
  const BrandShow({
    super.key,
     required this.images,
    required this.brand,
  });

  final BrandModel brand;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProduct(brand: brand)),
      child: SingleChildScrollView(
        child: RounderContainer(
          showBorder: true,
          backgroundColor: Colors.transparent,
          borderColor: Colors.grey,
          padding: EdgeInsets.all(16.0),
          margin: EdgeInsets.only(bottom: 16.0),
          child: Column(
            children: [

              BrandCard(showBorder: false, brand: brand),
              SizedBox(height: 16,),

              Row(
                children: images.map((image) => brandTopImage(image, context)).toList()
              )
            ],
          ),

        ),
      ),
    );
  }
  Widget brandTopImage(String image, context){
   return Expanded(
       child: RounderContainer(
         height: 100,
         padding: EdgeInsets.all(16),
         margin: EdgeInsets.only(right: 8),
         backgroundColor: Colors.grey,
         child: CachedNetworkImage(
           fit: BoxFit.contain,
             imageUrl: image,
             progressIndicatorBuilder: (context,url,downloadProgress) => ShimmerEft(width: 100, height: 100),
           errorWidget: (context, url, error) => Icon(Icons.error),
         ),
       )
   );
  }
}




class Circular_image extends StatelessWidget {
  const Circular_image({
    super.key,
    this.width = 56,
    this.height=56,
    this.padding=8.0,
    this.overlayColor, 
    this.backgroundColor,
    this.isNetworkImage = false,
    this.fit = BoxFit.cover,
    required this.image,
  });
  
  final double width,height,padding;
  final Color? overlayColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final BoxFit fit;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ?? (sHelperFunction.isDarkMode(context) ? Colors.transparent : Colors.transparent),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isNetworkImage
              ? CachedNetworkImage(
            fit: fit,
              color: overlayColor,
              imageUrl: image,
              progressIndicatorBuilder: (context, url, downloadProgress) => ShimmerEft(width: 55, height: 55,radius: 55,),
            errorWidget: (context, url, error) => Icon(Icons.error),
          )
          : Image(
            fit: fit,
              image: AssetImage(image),
            color: overlayColor,
          ),

          // Image(
          //   image: isNetworkImage ? NetworkImage(image) : AssetImage(image) as ImageProvider,
          //   fit: fit,
          //   color: overlayColor,
          // ),
        ),
      ),
    );
  }
}
