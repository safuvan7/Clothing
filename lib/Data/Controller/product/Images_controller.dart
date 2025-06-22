import 'package:app_project/Data/Models/Product_Model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageController extends GetxController {
  static ImageController get instance => Get.find();

  //   variables
  RxString selectedProductImage = ''.obs;

  // -- Get all image from product and variations
  List<String> getAllProductImage(ProductModel product) {
  //   use set to add unique image only
    Set<String> images = {};

  //   load thumbnail image
    images.add(product.thumbnail);

  //   assign thumbnail as selected image
    selectedProductImage.value = product.thumbnail;

  //   Get all images from product model if not null
    if (product.images != null) {
      images.addAll(product.images!);
    }

  //   Get all images from the product variation if not null
    if (product.productVariation != null || product.productVariation!.isNotEmpty) {
      images.addAll(product.productVariation!.map((variation) => variation.image));
    }

    return images.toList();

  }

  // -- show image popup
  void showEnlargedImages(String image) {
    Get.to(
      fullscreenDialog: true,
        () => Dialog.fullscreen(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 16 * 2,horizontal: 16),
              child: CachedNetworkImage(imageUrl: image),
              ),
              SizedBox(height: 32,),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 150,
                  child: OutlinedButton(
                      onPressed: () => Get.back() ,
                      child: Text('Close')),
                ),
              )
            ],
          ),

        )
    );
  }
}


























































































// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../Models/Product_Model.dart';
//
// class ImagesController extends GetxController {
//   static ImagesController get instance => Get.find();
//
//   RxString selectedProductImage = ''.obs;
//   List<String> getAllProductImages(ProductModel product){
//     Set<String> images = {};
//
//     images.add(product.thumbnail);
//
//     selectedProductImage.value = product.thumbnail;
//
//     if(product.images != null) {
//       images.addAll(product.images!);
//     }
//     if(product.productVariation != null || product.productVariation!.isNotEmpty) {
//       images.addAll(product.productVariation!.map((variation) => variation.image));
//     }
//
//     return images.toList();
//   }
//   void showEnlargedImage(String image) {
//     Get.to(
//       fullscreenDialog: true,
//         () => Dialog.fullscreen(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Padding(padding: EdgeInsets.symmetric(vertical: 24.0 * 2,horizontal: 24.0),
//                 child: CachedNetworkImage(imageUrl: image),
//               ),
//               SizedBox(height: 32,),
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: SizedBox(
//                   width: 150,
//                   child: OutlinedButton(onPressed: () => Get.back(), child: Text('Close')),
//                 ),
//               )
//             ],
//           ),
//         )
//     );
//   }
// }