import 'package:app_project/Screens/CheckOut/checkout_screen.dart';
import 'package:app_project/Screens/Home/Home_Screen.dart';
import 'package:app_project/Screens/cart/Widget/Cart_Item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({
    super.key,
    this.smallSize = false,
  });

  final bool smallSize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),),
        leading: BackButton(),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(24),

        // item in Cart
        child: CartItem(),
      ),

      // checkout button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              fixedSize: Size(30, 30),
            minimumSize: Size.fromHeight(55),
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(10)
           )
          ),
            onPressed: () => Get.to(() => CheckoutScreen()),
            child: Text('Checkout \$1150',style: TextStyle(fontWeight: FontWeight.bold),)),
      ),
    );
  }
}



class QuantityAddRemoveButton extends StatelessWidget {
  const QuantityAddRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularIcon(
          icon: CupertinoIcons.minus,
          width: 32,
          height: 32,
          size: 16,
          color: Colors.black,
          backgroundColor: Colors.transparent,
        ),
        SizedBox(width: 16,),
        Text(
          '1',
          style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(width: 16,),
        CircularIcon(
          icon: CupertinoIcons.add,
          width: 32,
          height: 32,
          size: 16,
          color: Colors.black,
          backgroundColor: Colors.red,)
      ],
    );
  }
}



class SCartItem extends StatelessWidget {
  const SCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        sRoundedImage(
            imageUrl: 'Assets/Images/Black_Linen_shirt.png',
          width: 60,
          height: 60,
          padding: EdgeInsets.all(8.0),
          backgroundColor: Colors.transparent,
        ),
        SizedBox(width: 16,),

      //   title,price & Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Linen',
                style: TextStyle(color: Colors.grey,fontSize: 10,),
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
              Flexible(
                child: Text(
                  'Black Linen Shirt',
                  style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  textAlign: TextAlign.left,
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'Color',style: TextStyle(color: Colors.grey,fontSize: 10,)),
                    TextSpan(text: 'Black',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                    TextSpan(text: 'Size',style: TextStyle(color: Colors.grey,fontSize: 10)),
                    TextSpan(text: 'M',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                  ]
                )
              )
            ],
          ),
        )
      ],
    );
  }
}
