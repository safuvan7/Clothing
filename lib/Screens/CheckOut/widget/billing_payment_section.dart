import 'package:app_project/Screens/Home/Home_Screen.dart';
import 'package:app_project/Utils/constants/colors.dart';
import 'package:app_project/Utils/device/helper_function.dart';
import 'package:app_project/common/Images/sImages.dart';
import 'package:app_project/common/widget/texts/section_heading.dart';
import 'package:flutter/material.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = sHelperFunction.isDarkMode(context);
    return Column(
      children: [
        sSectionHeading(
          title: 'Payment Method', buttonTitle: 'Change',onPressed: () {},
        ),
        SizedBox(height: 16 / 2,),
        Row(
          children: [
            RounderContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? TColors.light : Colors.white,
              padding: EdgeInsets.all(8),
              child: Image(image: AssetImage(sImages.gPay),fit: BoxFit.contain,),
            ),
            SizedBox(width: 16 / 2,),
            Text('GPay',style: Theme.of(context).textTheme.bodyLarge,),
          ],
        )

      ],
    );
  }
}
