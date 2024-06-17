import 'package:flutter/material.dart';

class CircularDesignContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final Color backgroundColor;
  final double radius;
  final Widget? child;
  final double padding;

  const CircularDesignContainer({
    super.key,
    this.height = 400,
    this.width = 400,
    required this.backgroundColor,
    this.radius = 400,
    this.child,
    this.padding = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
    );
  }
}
