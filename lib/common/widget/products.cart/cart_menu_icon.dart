import 'package:app_project/Screens/cart/Cart_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({
    super.key,
    required this.onPressed,
    this.iconColor,
    this.counterBgColor,
    this.counterTextColor,
  });

  final VoidCallback onPressed;
  final Color? iconColor, counterBgColor, counterTextColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: () => Get.to(() => CartScreen()),
            icon: Icon(Icons.shopping_bag_outlined,color: iconColor,)),
        // Positioned(
        //   right: 0,
        //   child: Container(
        //     width: 18,
        //     height: 18,
        //     decoration: BoxDecoration(
        //       color: Colors.black.withOpacity(0.5),
        //       borderRadius: BorderRadius.circular(100),
        //     ),
        //     // child: Center(
        //     //   child: Text(
        //     //     '2',
        //     //     style: Theme.of(context).textTheme.labelLarge!.apply(
        //     //       color: Colors.white,fontSizeFactor: 0.8,
        //     //     ),
        //     //   ),
        //     // ),
        //   ),
        // )
      ],
    );
  }
}

