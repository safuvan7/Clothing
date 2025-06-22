import 'package:flutter/material.dart';

import '../Cart_Screen.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;


  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 2,
      separatorBuilder: (context, index) => SizedBox(height: 32,),
      itemBuilder: (context, index) => Column(
        children: [
          // Positioned(
          //   right: 0,
          //   child: Row(
          //     children: [
          //       Checkbox(
          //           splashRadius: 20,
          //           activeColor: Colors.red,
          //           value: true,
          //           onChanged: (val) {}
          //       )
          //     ],
          //   ),
          // ),

          // Cart Item
          SCartItem(),
          if(showAddRemoveButtons) SizedBox(height: 16,),

          // Add Remove Button Row with total price
          if(showAddRemoveButtons)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [

                  // Extra space
                  SizedBox(width: 70,),

                  // Add remove button
                  QuantityAddRemoveButton(),
                ],
              ),

              // Total price
              Text(
                '\$1150',
                style: TextStyle(
                    fontWeight: FontWeight.w900
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
