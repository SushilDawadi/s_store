import 'package:flutter/material.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/device/device_utility.dart';

class CustomRatingBarIndicator extends StatelessWidget {
  const CustomRatingBarIndicator(
      {super.key, required this.text, required this.value});

  final String text;
  final double value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(text, style: Theme.of(context).textTheme.bodyLarge),
            ),
            Expanded(
              flex: 10,
              child: SizedBox(
                width: DeviceUtils.getScreenWidth(context) * 0.5,
                child: LinearProgressIndicator(
                  value: value,
                  minHeight: 10,
                  borderRadius: BorderRadius.circular(10),
                  backgroundColor: CColors.grey,
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(CColors.secondary),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
