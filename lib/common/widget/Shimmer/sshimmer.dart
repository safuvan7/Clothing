
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../Utils/device/helper_function.dart';

class ShimmerEft extends StatelessWidget {
  const ShimmerEft({
    super.key,
    required this.width,
    required this.height,
    this.radius = 15,
    this.color,
  });

  final double width,height,radius;
  final Color? color;


  @override
  Widget build(BuildContext context) {
    final dark = sHelperFunction.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: color ?? (dark ? Colors.grey : Colors.white),
            borderRadius: BorderRadius.circular(radius)
        ),
      ),
    );
  }
}
