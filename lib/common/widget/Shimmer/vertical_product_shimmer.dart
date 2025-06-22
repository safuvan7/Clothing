import 'package:app_project/Screens/Home/Home_Screen.dart';
import 'package:app_project/Screens/Home/Widget/home_Slider.dart';
import 'package:app_project/common/widget/Shimmer/sshimmer.dart';
import 'package:flutter/material.dart';

import '../../../Screens/Home/Widget/grid_layout.dart';

class VerticalProductShimmer extends StatelessWidget {
  const VerticalProductShimmer({
    super.key,
    this.itemCount = 4,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Grid_layount(
        itemCount: itemCount,
        itemBuilder: (context, index) => SizedBox(
          width: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // image
              ShimmerEft(width: 180, height: 180),
              SizedBox(height: 16,),

              // text
              ShimmerEft(width: 160, height: 15),
              SizedBox(height: 16 / 2),
              ShimmerEft(width: 110, height: 15)
            ],
          ),
        ));
  }
}
