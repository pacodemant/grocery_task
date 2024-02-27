import 'package:flutter/material.dart';

class ActionHeadline extends StatelessWidget {
  const ActionHeadline({
    required this.title,
    this.onPressed,
    super.key,
  });

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.chevron_right,
            size: 28,
          ),
        ),
      ],
    );
  }
}
