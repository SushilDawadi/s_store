import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.padding = const EdgeInsets.all(0)});

  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: const Divider(
        color: Colors.grey,
        thickness: 0.2,
        indent: 25,
        endIndent: 35,
        height: 2,
      ),
    );
  }
}
