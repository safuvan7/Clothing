import 'package:app_project/common/widget/texts/section_heading.dart';
import 'package:flutter/material.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sSectionHeading(title: 'Shipping Address', buttonTitle: 'Change',onPressed: () {}),
        Text('Mohammed Safuvan',style: Theme.of(context).textTheme.bodyLarge,),
        SizedBox(height: 16 / 2,),
        Row(
          children: [
            Icon(Icons.phone,color: Colors.grey,size: 16,),
            SizedBox(width: 16,),
            Text('+91 7510430850',style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
        SizedBox(height: 16 /2,),
        Row(
          children: [
            Icon(Icons.location_history,color: Colors.grey,size: 16,),
            SizedBox(width: 16,),
            Expanded(child: Text('South Liana, Maine 87695, USA',style: Theme.of(context).textTheme.bodyMedium,softWrap: true,))
          ],
        ),
      ],
    );
  }
}
