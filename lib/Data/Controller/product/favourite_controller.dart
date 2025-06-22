import 'dart:convert';

import 'package:app_project/Data/Models/Product_Model.dart';
import 'package:app_project/Data/repositories/products/product_repository.dart';
import 'package:app_project/Utils/device/storage_utility.dart';
import 'package:app_project/Utils/popups/loaders.dart';
import 'package:get/get.dart';

class FavouritesController extends GetxController {
  static FavouritesController get instance => Get.find();

  final favorites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavourites();
  }

  Future<void> initFavourites() async {
    final json = TLocalStorage.instance().readData('favorites');
    if (json != null) {
      final storedFavorites = jsonDecode(json) as Map<String, dynamic>;
      favorites.assignAll(storedFavorites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavourites(String productId) {
    return favorites[productId] ?? false;
  }

  void toggleFavoriteProduct(String productId) {
    if(!favorites.containsKey(productId)){
      favorites[productId] = true;
      saveFavoritesToStorage();
      TLoaders.customToast(message: 'Product has been added to the Wishlist.');
    } else {
      TLocalStorage.instance().removeData(productId);
      favorites.remove(productId);
      saveFavoritesToStorage();
      favorites.refresh();
      TLoaders.customToast(message: 'Product has been removed from the Wislist.');
    }
  }

  void  saveFavoritesToStorage() {
    final encodedFavorites = json.encode(favorites);
    TLocalStorage.instance().saveData('favorites', encodedFavorites);
  }

  Future<List<ProductModel>> favoriteProducts() async {
    return await ProductRepository.instance.getFavoriteProducts(favorites.keys.toList());
  }
}