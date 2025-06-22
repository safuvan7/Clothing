import 'package:app_project/Screens/Home/Widget/grid_layout.dart';
import 'package:app_project/common/widget/Shimmer/sshimmer.dart';
import 'package:flutter/material.dart';

class SBrandShimmer extends StatelessWidget {
  const SBrandShimmer({
    super.key,
    this.itemCount = 4,

  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Grid_layount(
      mainAxisExtent: 80,
        itemCount: itemCount,
        itemBuilder: (context, index) => ShimmerEft(width: 300, height: 80),
    );
  }
}
