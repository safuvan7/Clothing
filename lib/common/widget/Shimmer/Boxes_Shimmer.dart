import 'package:app_project/common/widget/Shimmer/sshimmer.dart';
import 'package:flutter/material.dart';

class BoxesShimmer extends StatelessWidget {
  const BoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: ShimmerEft(width: 150, height: 110)),
            SizedBox(width: 16,),
            Expanded(child: ShimmerEft(width: 150, height: 110)),
            SizedBox(width: 16,),
            Expanded(child: ShimmerEft(width: 150, height: 110)),
          ],
        )
      ],
    );
  }
}
