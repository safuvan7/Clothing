import 'package:app_project/Screens/Home/Widget/home_Slider.dart';
import 'package:app_project/common/widget/Shimmer/sshimmer.dart';
import 'package:flutter/material.dart';

class sCategoryShimmer extends StatelessWidget {
  const sCategoryShimmer({super.key, this.itemCount = 3 });


  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
          scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: 16,),
          itemBuilder: (context,index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // image
              ShimmerEft(width: 55, height: 55,radius: 55,),
              SizedBox(height: 16 / 2,),

              // text
              ShimmerEft(width: 55, height: 8),
            ],
          );
          },

         ),
    );
  }
}
