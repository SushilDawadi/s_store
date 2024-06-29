import 'package:flutter/material.dart';
import 'package:s_store/common/common.widgets/rounded_container.dart';
import 'package:s_store/utils/helpers/helper_functions.dart';

class CustomChoiceChip extends StatelessWidget {
  const CustomChoiceChip({
    super.key,
    required this.text,
    required this.isSelected,
    this.onSelected,
  });

  final String text;
  final bool isSelected;
  final Function(bool)? onSelected;
  @override
  Widget build(BuildContext context) {
    final isColor = HelperFunctions.getColor(text) != null;
    return ChoiceChip(
      label: isColor ? const SizedBox() : Text(text),
      selected: isSelected,
      onSelected: onSelected,
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : null,
      ),
      labelPadding: isColor ? const EdgeInsets.all(0) : null,
      padding: isColor ? const EdgeInsets.all(0) : null,
      shape: isColor ? const CircleBorder() : null,
      avatar: isColor
          ? CustomRoundedContainer(
              width: 50,
              height: 50,
              backgroundColor: HelperFunctions.getColor(text)!,
            )
          : null,
      backgroundColor: isColor ? HelperFunctions.getColor(text) : null,
    );
  }
}
