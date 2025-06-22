import 'package:app_project/Data/Models/banner_model.dart';
import 'package:app_project/Data/repositories/banners/banner_repository.dart';
import 'package:get/get.dart';

import '../../Utils/popups/loaders.dart';

class BannerController extends GetxController {


  // variables
  final isLoading = false.obs;
  final carousalCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;


  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  // update page Navigational Dots
  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  //   fetch Banners
  Future<void> fetchBanners() async {
    try {
      //   show loader while loading categories
      isLoading.value = true;

    //   Fetch Banners
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

    //   assign Banners
      this.banners.assignAll(banners);

    }catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }finally {
      //   remove loader
      isLoading.value = false;
    }
  }


}