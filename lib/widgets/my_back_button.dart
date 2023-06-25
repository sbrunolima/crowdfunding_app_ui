import 'package:flutter/material.dart';
import 'package:enefty_icons/enefty_icons.dart';

class MyBackIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: CircleAvatar(
          backgroundColor: Colors.grey.shade300,
          child: const Icon(
            EneftyIcons.arrow_left_4_outline,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
