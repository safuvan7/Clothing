
import 'package:app_project/Screens/Home/Home_Screen.dart';
import 'package:app_project/Utils/device/helper_function.dart';
import 'package:app_project/common/Images/sImages.dart';
import 'package:app_project/common/widget/appbar/appBar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../../../Data/Controller/product/Images_controller.dart';
import '../../../Data/Models/Product_Model.dart';
import '../../../common/widget/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:get/get.dart';

class sProductImage extends StatelessWidget {
  const sProductImage({
    super.key, required this.product,
  });

  final ProductModel product;


  @override
  Widget build(BuildContext context) {
    final dark = sHelperFunction.isDarkMode(context);

    final controller = Get.put(ImageController());
    final images = controller.getAllProductImage(product);

    return TCurvedEdgeWidget(
      child: Container(
        color: Colors.grey[400],
        child: Stack(
          children: [
            // main large image
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(16.0 * 2),
                child: Center(
                  child: Obx(() {
                    final image = controller.selectedProductImage.value;
                   return GestureDetector(
                     onTap: () => controller.showEnlargedImages(image),
                     child: CachedNetworkImage(
                       imageUrl: image,
                       progressIndicatorBuilder: (context, __, downloadProgress) =>
                       CircularProgressIndicator(value: downloadProgress.progress,color: Colors.red,),
                     ),
                   );
                  }
                  )
                ),
              ),
            ),

            //image slider
            Positioned(
              right: 0,
                bottom: 30,
                left: 24,
                child:  SizedBox(
                  height: 80,
                  child: ListView.separated(
                    itemCount: images.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: AlwaysScrollableScrollPhysics(),
                      separatorBuilder: (context,index) => SizedBox(width: 16,),
                      itemBuilder: (context, index) => Obx(
                        (){
                          final imageSelected = controller.selectedProductImage.value == images[index];
                          return sRoundedImage(
                            width: 80,
                            isNetworkImage: true,
                            imageUrl: images[index],
                            padding: EdgeInsets.all(8.0),
                            backgroundColor: dark ? Colors.black : Colors.white,
                            onPressed: () => controller.selectedProductImage.value = images[index],
                            border: Border.all(color: imageSelected ? Colors.red : Colors.transparent),


                          );
                        }
                      )
                  ),
                )
            ),

            // Appbar Icons
            TAppBar(
              showBackArrow: true,
              action: [
               favouriteIcons(productId: product.id)
              ],
            )
          ],
        ),
      ),
    );
  }
}