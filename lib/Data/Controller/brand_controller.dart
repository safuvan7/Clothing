import 'package:app_project/Data/Models/Brand_Model.dart';
import 'package:app_project/Data/Models/Product_Model.dart';
import 'package:app_project/Data/repositories/products/product_repository.dart';
import 'package:app_project/Utils/popups/loaders.dart';
import 'package:get/get.dart';

import '../repositories/brands/brand_repository.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  RxBool isLoading = true.obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final brandRepository = Get.put(BrandRepository());

  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();
  }


  Future<void> getFeaturedBrands() async {
    try {

      isLoading.value = true;

      final brands = await brandRepository.getAllBrands();

      allBrands.assignAll(brands);

      featuredBrands.assignAll(allBrands.where((brand) => brand.isFeatured ?? false).take(4));

    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!' , message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<BrandModel>> getBrandsForCategory(String categroyId) async {
    try {
      final brands = await brandRepository.getBrandsForCategory(categroyId);
      return brands;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!' , message: e.toString());
      return [];
    }
  }


  Future<List<ProductModel>> getBrandProducts({required String brandId, int limit = -1}) async {
    try {
      final products = await ProductRepository.instance.getProductsForBrand(brandId: brandId, limit: limit);
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }






}