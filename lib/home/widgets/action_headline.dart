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
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
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
