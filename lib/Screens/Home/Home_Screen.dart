
import 'package:app_project/common/Images/sImages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:app_project/Screens/all_Products/View_products.dart';
import 'package:app_project/Screens/product_details/product_detail.dart';
import 'package:app_project/Utils/device/device_utility.dart';
import 'package:app_project/Utils/device/helper_function.dart';
import 'package:app_project/common/enum/enums.dart';
import 'package:app_project/common/widget/Shimmer/vertical_product_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Data/Controller/product/favourite_controller.dart';
import '../../Data/Controller/product/product_controller.dart';
import '../../Data/Models/Product_Model.dart';
import '../../common/widget/appbar/appBar.dart';
import '../../common/widget/custom_shapes/container/pimary_header_container.dart';
import '../../common/widget/custom_shapes/container/search_container.dart';
import '../../common/widget/products.cart/cart_menu_icon.dart';
import '../../common/widget/texts/section_heading.dart';
import '../cart/Cart_Screen.dart';
import 'Widget/Home_AppBar.dart';
import 'Widget/grid_layout.dart';
import 'Widget/home_Slider.dart';
import 'Widget/home_category.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,

  });


  @override
  Widget build(BuildContext context) {

    final dark = sHelperFunction.isDarkMode(context);

    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            sPrimaryHeaderContainer(
              child: Column(
                children: [
                  sHomeAppBar(),
                  SizedBox(height: 32.0,),
                  sSearchContainer(text: 'Search in Store',showBorder: false,),

                  const SizedBox(height: 24,),
                  Padding(
                      padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        sSectionHeading(
                          title: 'Categories',
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        const SizedBox(height: 16.0,),
                        sHomeCategories()
                      ],
                    ),
                  ),
                  SizedBox(height: 35,)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  sHomeSlider(),
                  SizedBox(height: 20,),
                  sSectionHeading(
                      title: 'Products',
                    onPressed: () => Get.to(() => ViewProducts(
                      title: 'Products',
                      // query: FirebaseFirestore.instance.collection('Products').where('IsFeatured', isEqualTo: true).limit(6),
                      futureMethod: controller.fetchAllFeaturedProducts(),
                    )),
                  ),
                  SizedBox(height: 24,),
                  Obx(() {
                    if (controller.isLoading.value) return VerticalProductShimmer();
                    if (controller.featuredProducts.isEmpty) {
                      return Center(child: Text('No Data Found',style: Theme.of(context).textTheme.bodyMedium,));
                    }
                   return Grid_layount(
                     itemCount: controller.featuredProducts.length,
                     itemBuilder: (context , index) => sProductCard(product: controller.featuredProducts[index],),);
                  }
                  )

                ],
              )

            ),
          ],
        ),
      ),

    );
  }
}



class sRoundedImage extends StatelessWidget {
  const sRoundedImage({
    super.key,
    this.width ,
    this.height,
    required this.imageUrl,
    this.applyImageRadius = true,
    this.border,
    this.backgroundColor = Colors.white,
    this.fit = BoxFit.contain,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
    this.borderRadius = 16.0,
  });

  final double? width,height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius:applyImageRadius ? BorderRadius.circular(borderRadius) : BorderRadius.zero,
            child: Image(
              height: 220,
              fit: fit,
                image: isNetworkImage ? NetworkImage(imageUrl) : AssetImage(imageUrl) as ImageProvider,),
        ),
      ),
    );
  }
}

//
//
//
//

class sProductCard extends StatelessWidget {
  const sProductCard({
    super.key, required this.product,

  });

  final ProductModel product;



  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = sHelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetail(product: product,)),
      child: Container(
        width: 180,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          // boxShadow: [ShadowStyle.ProductShadow],
          borderRadius: BorderRadius.circular(16.0),
          color: dark ? Colors.grey[850] : Colors.white,
        ),
        child: Column(
          children: [
            RounderContainer(
              height: 180,
              width: 180,
              padding: const EdgeInsets.all(8.0),
              backgroundColor: dark ? Colors.black : Colors.white,
              child: Stack(
                children: [
                  // -- thumbnail image
                  Center(
                    child: sRoundedImage(
                      imageUrl: product.thumbnail,
                      borderRadius: 16.0,
                      fit: BoxFit.fill,
                      width: 200,
                      isNetworkImage: true,
                    ),
                  ),

                  // -- sale tag
                  if(salePercentage != null)
                  Positioned(
                    top: 6,
                    child: RounderContainer(
                      radius: 8.0,
                      backgroundColor: Colors.red.withOpacity(0.8),
                      padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 4.0),
                      child: Text(
                        '$salePercentage%',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),

                  // --favourite icon button
                  Positioned(
                    top: 0,
                    right: 0,
                    child: favouriteIcons(productId: product.id,),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25,),

            // -- Details
            Padding(
                padding: EdgeInsets.only(left: 8.0),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                     product.title,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Text(
                          product.brand!.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 10
                          ),
                        ),
                        SizedBox(width: 4.0,),
                        // Icon(icon)
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),

            // -- price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // -- Price
                Flexible(
                  child: Column(
                    children: [
                      if (product.productType == ProductType.single.toString() && product.salePrice > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            product.price.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),
                          ),
                        ),

                      // -- price, show sale price as main price if sale exist
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                         controller.getProductPrice(product),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // -- add to cart button
                Container(
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomRight: Radius.circular(16)
                      )
                  ),
                  child: SizedBox(
                      width: 32 * 1.2,
                      height: 32 * 1.2,
                      child: Center(
                        child: Icon(
                          Icons.add,color: Colors.white,),
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}



class favouriteIcons extends StatelessWidget {
  const favouriteIcons({
    super.key, required this.productId,
  });

  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());
    return Obx(
       ()=> CircularIcon(
             icon: controller.isFavourites(productId) ? Icons.favorite : Icons.favorite_border,
             color: controller.isFavourites(productId) ? Colors.red : null,
         onPressed: () => controller.toggleFavoriteProduct(productId),
       ),
    );
  }
}




class CircularIcon extends StatelessWidget {
  const CircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = 24.0,
    required this.icon,
    this.color,
    this.onPressed,
    this.backgroundColor,
  });

  final double? width,height,size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor != null
            ? backgroundColor! : sHelperFunction.isDarkMode(context)
            ? Colors.black.withOpacity(0.9)
            : Colors.white.withOpacity(0.9),
      ),
        child: IconButton(onPressed: onPressed,
            icon: Icon(icon,
              color: color,
              size: size,
            ))
    );
  }
}


//
//
//
//

class RounderContainer extends StatelessWidget {
  const RounderContainer({
    super.key,
    this.width,
    this.height,
    this.child,
    this.radius = 16.0,
    this.padding,
    this.margin,
    this.showBorder = false,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.grey,
  });

  final double? width;
  final double? height;
  final Widget? child;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool showBorder;
  final Color backgroundColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border:showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,

    );
  }
}


