import 'package:app_project/Utils/device/helper_function.dart';
import 'package:flutter/material.dart';
import '../../Home/Home_Screen.dart';

class ApproveAddress extends StatelessWidget {
  const ApproveAddress({
    super.key,
    required this.selectedAddress
  });

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = sHelperFunction.isDarkMode(context);
    return RounderContainer(
      width: double.infinity,
      padding: EdgeInsets.all(16.0),
      showBorder: true,
      backgroundColor: selectedAddress ? Colors.red.withOpacity(0.5) : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent :  dark ? Colors.deepPurple : Colors.grey,
      margin: EdgeInsets.only(bottom: 16),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 5,
            child: Icon(
              selectedAddress ? Icons.verified : null,
              color: selectedAddress ? dark ? Colors.white : Colors.black.withOpacity(0.6) : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mr. Raj Kumar',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 8 / 2,),
              Text(
                '+91 98765 43210',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8 / 2,),
              Text(
                '45, MG Road, Bangalore – 560001 Karnataka, India',softWrap: true,
              )

            ],
          )
        ],
      ),
    );
  }
}
