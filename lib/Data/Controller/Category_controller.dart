import 'package:app_project/Data/Models/Category_model.dart';
import 'package:app_project/Data/Models/Product_Model.dart';
import 'package:app_project/Data/repositories/categories/category_repository.dart';
import 'package:app_project/Data/repositories/products/product_repository.dart';
import 'package:app_project/Utils/popups/loaders.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

 //   load category data
  Future<void> fetchCategories() async {
    try {
    //   show loader while loading categories
      isLoading.value = true;

    //   fetch categories from data source (firestore, API, etc..)
      final categories = await _categoryRepository.getAllCategories();

    //   upload the categories list
      allCategories.assignAll(categories);


    //   filter featured categories
      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(4).toList());

    }catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }finally {
    //   remove loader
      isLoading.value = false;
    }
  }

   //  load selected category data



   //  get category or sub category products
   Future<List<ProductModel>> getCategoryProducts({required String categoryId, int limit = 4}) async {
    final products = await ProductRepository.instance.getProductsForCategory(categoryId: categoryId, limit: limit);
    return products;
   }

}











