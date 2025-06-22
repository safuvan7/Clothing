import 'package:app_project/common/widget/Shimmer/sshimmer.dart';
import 'package:flutter/material.dart';

class ListtileShimmer extends StatelessWidget {
  const ListtileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ShimmerEft(width: 50, height: 50,radius: 50,),
            SizedBox(width: 16,),
            Column(
              children: [
                ShimmerEft(width: 100, height: 15),
                SizedBox(height: 16 / 2,),
                ShimmerEft(width: 80, height: 12),
              ],
            )
          ],
        )
      ],
    );
  }
}
