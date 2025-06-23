import 'package:app_project/Data/Controller/product/variation_controller.dart';
import 'package:app_project/Data/Models/Product_Model.dart';
import 'package:app_project/Screens/Home/Home_Screen.dart';
import 'package:app_project/common/widget/choice/choice_chip.dart';
import 'package:app_project/common/widget/texts/section_heading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());

    return Obx(
        () => Column(
        children: [
          // Selected Attributes Pricing $ Description
          if(controller.selectedVariation.value.id.isNotEmpty)
          RounderContainer(
            padding: EdgeInsets.all(16),
            backgroundColor: Colors.grey,
            child: Column(
              children: [
                // title, price and stock status
                Row(
                  children: [
                    sSectionHeading(title: 'Variation',showActionButton: false,),
                    SizedBox(width: 16,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Price : ',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          // SizedBox(width: 16,),

                          //   actual Price
                          if(controller.selectedVariation.value.salePrice > 0)
                          Text(
                            '\$${controller.selectedVariation.value.price}',style: Theme.of(context).textTheme.titleSmall!.
                          apply(decoration: TextDecoration.lineThrough),
                          ),
                          SizedBox(width: 16,),

                          // sale Price
                          Text(
                              controller.getVariationPrice(),style: Theme.of(context).textTheme.titleSmall
                          )
                        ],
                      ),

                      // Stock
                      Row(
                        children: [
                          Text(
                            'Stock : ',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text(
                              controller.variationStockStatus.value,style: Theme.of(context).textTheme.titleMedium
                          )
                        ],
                      )
                    ],
                  ),
                  ],
                ),

                //   variation Description
                Text(
                  controller.selectedVariation.value.description ?? '',
                  style: Theme.of(context).textTheme.titleSmall,
                  maxLines: 4,
                )

              ],

            ),
          ),

          SizedBox(height: 16,),

        //   attributes
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttribute!.map((attribute) =>
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sSectionHeading(title: attribute.name ?? '',showActionButton: false,),
                      SizedBox(height: 16 / 2,),
                      Obx(
                            () => Wrap(
                          spacing: 8,
                          children: attribute.values!.map((attributeValue) {

                            final isSelected = controller.selectedAttributes[attribute.name] == attributeValue;
                            final available = controller
                                .getAttributesAvailabilityInVariation(product.productVariation!, attribute.name!)
                                .contains(attributeValue);

                            return SChoiceChip(text: attributeValue, selected: isSelected, onSelected: available ? (selected){
                              if (selected && available) {
                                controller.onAttributeSelected(product, attribute.name ?? '', attributeValue);
                              }
                            } : null);
                          }).toList()
                        ),
                      ),
                    ]
                ),
            ).toList(),
          ),

          // SizedBox(height: 16,),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     sSectionHeading(title: 'Size',showActionButton: false,),
          //     SizedBox(height: 16 / 2,),
          //     Wrap(
          //       spacing: 8,
          //       children: [
          //         ChoiceChip(
          //           label: Text('S'),
          //           selected: true,
          //           onSelected: (value){},
          //           labelStyle: TextStyle(color: true ? Colors.black : null),
          //           avatar: TCircularContainer(width: 50,height: 50,backgroundColor: Colors.red,),
          //           // shape: CircleBorder(),
          //           // labelPadding: EdgeInsets.all(0),
          //           // padding: EdgeInsets.all(0),
          //           selectedColor: Colors.red,
          //           backgroundColor: Colors.white,
          //         ),
          //         ChoiceChip(
          //           label: Text('M'),
          //           selected: false,
          //           onSelected: (value){},
          //           labelStyle: TextStyle(color: true ? Colors.black : null),
          //           avatar: TCircularContainer(width: 50,height: 50,backgroundColor: Colors.red,),
          //           // shape: CircleBorder(),
          //           // labelPadding: EdgeInsets.all(0),
          //           // padding: EdgeInsets.all(0),
          //           selectedColor: Colors.red,
          //           backgroundColor: Colors.white,
          //         ),
          //         ChoiceChip(
          //           label: Text('L'),
          //           selected: false,
          //           onSelected: (value){},
          //           labelStyle: TextStyle(color: true ? Colors.black : null),
          //           avatar: TCircularContainer(width: 50,height: 50,backgroundColor: Colors.red,),
          //           // shape: CircleBorder(),
          //           // labelPadding: EdgeInsets.all(0),
          //           // padding: EdgeInsets.all(0),
          //           selectedColor: Colors.red,
          //           backgroundColor: Colors.white,
          //         ),
          //         ChoiceChip(
          //           label: Text('XL'),
          //           selected: false,
          //           onSelected: (value){},
          //           labelStyle: TextStyle(color: true ? Colors.black : null),
          //           avatar: TCircularContainer(width: 50,height: 50,backgroundColor: Colors.red,),
          //           // shape: CircleBorder(),
          //           // labelPadding: EdgeInsets.all(0),
          //           // padding: EdgeInsets.all(0),
          //           selectedColor: Colors.red,
          //           backgroundColor: Colors.white,
          //         ),
          //       ],
          //     )
          //   ],
          // )
        ],
      ),
    );
  }
}
