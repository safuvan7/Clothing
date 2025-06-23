import 'package:app_project/Data/Controller/product/product_controller.dart';
import 'package:app_project/Data/Models/Product_Model.dart';
import 'package:app_project/Screens/Home/Home_Screen.dart';
import 'package:app_project/Screens/store/Store_Screen.dart';
import 'package:app_project/common/enum/enums.dart';
import 'package:flutter/material.dart';

class sProductData extends StatelessWidget {
  const sProductData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
     return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      //   Price & sale Price
        Row(
          children: [
            // sale tag
            RounderContainer(
              radius: 8.0,
              backgroundColor: Colors.red.withOpacity(0.8),
              padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 4.0),
              child: Text(
                '$salePercentage%',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(width: 16.0,),
            //   prize
            if (product.productType == ProductType.single.toString() && product.salePrice > 0 )
            Text(
              '\$${product.price}',
              style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
            if (product.productType == ProductType.single.toString() && product.salePrice > 0 )
            SizedBox(width: 16.0,),
            Text(
              controller.getProductPrice(product),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),
            )
          ],
        ),
        SizedBox(height: 16 / 1.5,),
      //   title
        Text(
          product.title,
          style: TextStyle(
            fontSize: 15,
          ),
          textAlign: TextAlign.left,
        ),
      SizedBox(height: 16 / 1.5,),
      //   Stock Status
        Row(
          children: [
            Text('Status'),
            SizedBox(width: 16,),
            Text(controller.getProductStockStatus(product.stock),style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),
        SizedBox(height: 16 / 1.5,),
      //   Brand
        Row(
          children: [
            Circular_image(
                image: product.brand != null ? product.brand!.image : '',
              fit: BoxFit.contain,
              width: 32,
              height: 32,
            ),
            Text(
              product.brand != null ? product.brand!.name : '',
              style: Theme.of(context).textTheme.bodyMedium
            ),
          ],
        )
      ],
    );
  }
}
