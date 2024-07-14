import 'package:flutter/material.dart';
import 'package:s_store/utils/constants/sizes.dart';

class ProfileMenuTile extends StatelessWidget {
  const ProfileMenuTile({
    super.key,
    required this.title,
    required this.value,
    required this.onTap,
    this.icon = Icons.arrow_forward_ios_outlined,
  });
  final String title;
  final String value;
  final void Function() onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Sizes.defaultSpace, vertical: Sizes.sm),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                title,
                style: Theme.of(context).textTheme.labelMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(value, style: Theme.of(context).textTheme.bodyMedium),
            ),
            Expanded(
              child: Icon(
                icon,
                size: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
