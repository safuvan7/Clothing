import 'package:flutter/material.dart';

class sSectionHeading extends StatelessWidget {
  const sSectionHeading({
    super.key,
    this.textColor,
    this.showActionButton = true,
    required this.title,
    this.buttonTitle = 'View all',
    this.onPressed,
  });

  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if(showActionButton) TextButton(onPressed: onPressed, child: Text(buttonTitle))
      ],
    );
  }
}
