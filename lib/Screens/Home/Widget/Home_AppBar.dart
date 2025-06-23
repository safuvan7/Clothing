import 'package:app_project/Data/Controller/user_controller.dart';
import 'package:app_project/common/widget/Shimmer/sshimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/widget/appbar/appBar.dart';
import '../../../common/widget/products.cart/cart_menu_icon.dart';

class sHomeAppBar extends StatelessWidget {
  const sHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Good day for shopping',
            style: Theme.of(context).textTheme.labelMedium!.apply(
                color: Colors.white
            ),
          ),
          Obx(
            () {
              if (controller.profileLoading.value){
                return ShimmerEft(width: 80, height: 15);
              } else {
                return Text(controller.user.value.fullName,
                  style: Theme.of(context).textTheme.headlineSmall!.apply(
                      color: Colors.white
                  ),
                );
              }
            }
          ),
        ],
      ),
      action: [
        TCartCounterIcon(onPressed: () {}, iconColor: Colors.white,counterBgColor: Colors.black,counterTextColor: Colors.white,)
      ],
    );
  }
}

