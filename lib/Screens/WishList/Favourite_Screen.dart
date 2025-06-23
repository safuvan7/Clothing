
import 'package:app_project/Data/Controller/product/favourite_controller.dart';
import 'package:app_project/Screens/Bottom_Navigation_Screen.dart';
import 'package:app_project/Screens/Home/Home_Screen.dart';
import 'package:app_project/Screens/all_Products/View_products.dart';
import 'package:app_project/Utils/device/cloud_helpr_Function.dart';
import 'package:app_project/Utils/popups/animation_loader.dart';
import 'package:app_project/common/widget/Shimmer/vertical_product_shimmer.dart';
import 'package:app_project/common/widget/appbar/appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Data/Models/Product_Model.dart';
import '../Home/Widget/grid_layout.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});



  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;
    return Scaffold(
      appBar: TAppBar(
        title:  Text(
          'Wishlist',style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        ),
        action: [
          CircularIcon(
            icon: Icons.add,
            onPressed: () => Get.to(ViewProducts(title: '',)),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(24.0),

          child: Obx(
              () => FutureBuilder(
              future: controller.favoriteProducts(),
              builder: (context, snapshot) {

                final emptyWidget = SImageLoaderWidget(
                    text: 'Whoops! Wishlist is Empty...',
                    image: 'Assets/Images/wishlist.png',
                  showAction: true,
                  actionText: 'Let\'s add some',
                  onActionPressed: () => Get.off(() => BottomNavigationScreen()) ,
                );

                const loader = VerticalProductShimmer(itemCount: 6,);
                final widget = SCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot,loader: loader,nothingFound: emptyWidget);
                if(widget != null) return widget;

                final products = snapshot.data!;
                return Grid_layount(
                    itemCount: products.length,
                    itemBuilder: (context, index) => sProductCard(product: products[index],));
              }
            ),
          ),
        ),
      ),
    );
  }
}
