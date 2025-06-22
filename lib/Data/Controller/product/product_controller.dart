import 'package:app_project/Data/Models/Product_Model.dart';
import 'package:app_project/Utils/popups/loaders.dart';
import 'package:app_project/common/enum/enums.dart';
import 'package:get/get.dart';

import '../../repositories/products/product_repository.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;


  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
    //   show loader while loading products
      isLoading.value = true;

    //   fetch Products
      final products = await productRepository.getFeaturedProducts();

    //   assign products
      featuredProducts.assignAll(products);

    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {
      //   fetch Products
      final products = await productRepository.getFeaturedProducts();
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

   //   get the product price or price range for variation
   String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

   //  if no variation exits , return the simple price or sale price
     if(product.productType == ProductType.single.toString()){
       return (product.salePrice > 0 ? product.salePrice : product.price).toString();
     } else {
       // calculate the smallest and largest prices among variations
       for (var variation in product.productVariation!){
         // Determine the price to consider (sale price if available, otherwise regular price)
         double priceToConsider = variation.salePrice > 0.0 ? variation.salePrice : variation.price;

       //   update smallest and largest price
         if (priceToConsider < smallestPrice){
          smallestPrice = priceToConsider;
         }
         if(priceToConsider > largestPrice) {
           largestPrice = priceToConsider;
         }
       }

     //   if smallest and largest prices are the same , return a single price
       if (smallestPrice.isEqual(largestPrice)) {
         return largestPrice.toString();
       } else {
       //   otherwise , return a price range
         return '$smallestPrice - \$$largestPrice';
       }
     }
   }

   String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
   }

   // -- check product stock status
   String getProductStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
   }

}