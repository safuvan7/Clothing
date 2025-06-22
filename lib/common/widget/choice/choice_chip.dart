import 'package:app_project/Utils/device/helper_function.dart';
import 'package:app_project/common/widget/custom_shapes/container/circular_container.dart';
import 'package:flutter/material.dart';

class SChoiceChip extends StatelessWidget {
  const SChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = sHelperFunction.getColor(text) != null;
    return Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
        child: ChoiceChip(
            label: isColor ? SizedBox() : Text(text),
            selected: selected,
          onSelected: onSelected,
          labelStyle: TextStyle(color: selected ? Colors.white : null),
          avatar: isColor ? TCircularContainer(
            width: 50,
            height: 50,
            backgroundColor: sHelperFunction.getColor(text)!) : null,
          labelPadding: isColor ? EdgeInsets.all(0) : null,
          padding: isColor ? EdgeInsets.all(0) : null,
          shape: isColor ? CircleBorder() : null,
          backgroundColor: isColor ? sHelperFunction.getColor(text)! : null,

        )
    );
  }
}
