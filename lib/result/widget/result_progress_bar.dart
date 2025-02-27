import 'package:flutter/material.dart';
import 'package:kalshi_tha/theme/theme_constants.dart';

class ResultProgressBar extends StatelessWidget {
  final double widgetSize;
  final Color? firstSegmentColor;
  final Color? secondSegmentColor;
  final Color? thirdSegmentColor;

  const ResultProgressBar({
    super.key,
    required this.widgetSize,
    this.firstSegmentColor,
    this.secondSegmentColor,
    this.thirdSegmentColor,
  });

  @override
  Widget build(BuildContext context) {
    const height = 16.0;
    const borderRadius = BorderRadius.all(Radius.circular(24.0));
    final border = Border.all(color: color.white, width: 2.0);

    return Stack(
      children: [
        Container(
          height: height,
          decoration: BoxDecoration(
            color: thirdSegmentColor ?? color.lightGray,
            border: border,
            borderRadius: borderRadius,
          ),
        ),
        Container(
          height: height,
          width: widgetSize * (2 / 3),
          decoration: BoxDecoration(
            color: secondSegmentColor ?? color.lightGray,
            border: border,
            borderRadius: borderRadius,
          ),
        ),
        Container(
          height: height,
          width: widgetSize * (1 / 3),
          decoration: BoxDecoration(
            color: firstSegmentColor ?? color.lightGray,
            border: border,
            borderRadius: borderRadius,
          ),
        ),
      ],
    );
  }
}
