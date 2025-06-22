import 'package:app_project/Utils/device/device_utility.dart';
import 'package:flutter/material.dart';

import '../../../../Utils/device/helper_function.dart';


class sSearchContainer extends StatelessWidget {
  const sSearchContainer({
    super.key,
    required this.text,
    this.icon = Icons.search,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: 24),
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final void Function()? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {

    final dark = sHelperFunction.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
              color: showBackground ? dark ? Colors.black : Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(16.0),
              border: showBorder ? Border.all(color: Colors.grey) : null
          ),
          child: Row(
            children: [
              Icon(icon,color: Colors.grey[600],),
              const SizedBox(width: 10,),
              Text(text,style: Theme.of(context).textTheme.bodySmall!.apply(
                  color: Colors.grey[400]
              ))
            ],
          ),
        ),
      ),
    );
  }
}




