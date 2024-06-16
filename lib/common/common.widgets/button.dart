import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isFilled;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isFilled,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: isFilled
          ? ElevatedButton(
              onPressed: () {
                onPressed();
              },
              child: Text(text),
            )
          : OutlinedButton(
              onPressed: () {
                onPressed();
              },
              child: Text(text),
            ),
    );
  }
}
