
import 'package:app_project/Screens/product_details/Widget/product_attributes.dart';
import 'package:app_project/Screens/product_details/Widget/product_data.dart';
import 'package:app_project/common/widget/texts/section_heading.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../Data/Models/Product_Model.dart';
import 'Widget/Bottom_add_to_cart.dart';
import 'Widget/product_Image.dart';

class ProductDetail extends StatelessWidget {
 const ProductDetail({
    super.key, required this.product,
  });

 final ProductModel product;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // product Image slider
            sProductImage(product: product,),

            // product details
            Padding(
                padding: EdgeInsets.only(right: 24,left: 24,bottom: 24),
            child: Column(
              children: [
                // Rating & share  button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Rating
                    Row(
                      children: [
                        Icon(Icons.star,color: Colors.amber,size: 24,),
                        SizedBox(width: 16 / 2,),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(text: '5.0',style: Theme.of(context).textTheme.bodyLarge),
                              TextSpan(text: '(199)')
                            ]
                          )
                        )
                      ],
                    ),
                  //share button
                    IconButton(onPressed: (){}, icon: Icon(Icons.share,size: 24.0,))
                  ],
                ),

                // price,title,Stock,& brand
                sProductData(product: product,),

              //   attributes
              //   if (product.productType == ProductType.variable.toString())
                ProductAttributes(product: product,),
                // if (product.productType == ProductType.variable.toString())
              SizedBox(height: 32,),

              //   checkout Buttton
                SizedBox(
                  width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red
                      ),
                        onPressed: (){},
                        child: Text('Checkout',style: TextStyle(color: Colors.white),))
                ),
              SizedBox(height: 32,),

              //   description
                sSectionHeading(title: 'Description',showActionButton: false,),
              SizedBox(height: 16,),
              ReadMoreText(
                product.description ?? '',
                trimLines: 2,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Show more',
                trimExpandedText: 'less',
                moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
                lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
              ),

              //   reviews
              //   Divider(),
              //   SizedBox(height: 16,),
              //   Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       sSectionHeading(title: 'Reviews(199)',showActionButton: false),
              //       IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_arrow_right,size: 18,))
              //     ],
              //   ),
                SizedBox(height: 32,),

              ],
            ),)
          ],
        ),
      ),
    );
  }
}
