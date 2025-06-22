import 'package:flutter/material.dart';

class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('SubTotal',style: Theme.of(context).textTheme.bodyMedium,),
            Text('\$1150',style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        SizedBox(height: 16 / 2,),

        //   Shipping Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee',style: Theme.of(context).textTheme.bodyMedium,),
            Text('\$6.0',style: Theme.of(context).textTheme.labelLarge,),
          ],
        ),

        SizedBox(height: 16 / 2,),

        //   Tax Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee',style: Theme.of(context).textTheme.bodyMedium,),
            Text('\$6.0',style: Theme.of(context).textTheme.labelLarge,),
          ],
        ),
        SizedBox(height: 16 / 2,),

        //   Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total',style: Theme.of(context).textTheme.bodyMedium,),
            Text('\$6.0',style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),

      ],
    );
  }
}
