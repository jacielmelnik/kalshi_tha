import 'package:flutter/material.dart';
import 'package:kalshi_tha/constants.dart';
import 'package:kalshi_tha/theme/theme_constants.dart';

class DisclaimerFooter extends StatelessWidget {
  const DisclaimerFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(lockIcon, height: 24.0, width: 24.0),
        spacing.v16,
        Text(
          footerText,
          textAlign: TextAlign.center,
          style: typography.description,
        ),
      ],
    );
  }
}
