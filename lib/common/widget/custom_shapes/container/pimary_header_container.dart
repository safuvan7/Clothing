import 'package:flutter/material.dart';
import '../curved_edges/curved_edges_widget.dart';
import 'circular_container.dart';

class sPrimaryHeaderContainer extends StatelessWidget {
  const sPrimaryHeaderContainer({
    super.key, required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child: Container(
        color: Colors.red,
        padding: EdgeInsets.only(bottom: 0),
        child: Stack(
          children: [
            Positioned(top: -150, right: -250,child: TCircularContainer(backgroundColor: Colors.white.withOpacity(0.1),)),
            Positioned(top: 100, right: -300,child: TCircularContainer(backgroundColor: Colors.white.withOpacity(0.1),)),
            child,
          ],
        ),
      ),
    );
  }
}
