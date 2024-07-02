import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider(
      {super.key,
      this.padding = const EdgeInsets.all(0),
      this.indent = 25,
      this.endIndent = 35});

  final EdgeInsetsGeometry padding;
  final double indent;
  final double endIndent;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Divider(
        color: Colors.grey,
        thickness: 0.2,
        indent: indent,
        endIndent: endIndent,
        height: 2,
      ),
    );
  }
}
