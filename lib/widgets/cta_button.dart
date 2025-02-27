import 'package:flutter/material.dart';
import 'package:kalshi_tha/theme/theme_constants.dart';

enum CtaButtonStyles { solid, outlined }

class CtaButton extends StatelessWidget {
  final String buttonText;
  final Function() onPressed;
  final CtaButtonStyles style;

  const CtaButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.style = CtaButtonStyles.solid,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: _getButtonStyle(),
      onPressed: onPressed,
      child: SizedBox(
        height: 56.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text(buttonText, style: _getTextStyle())],
        ),
      ),
    );
  }

  ButtonStyle _getButtonStyle() {
    switch (style) {
      case CtaButtonStyles.solid:
        return ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(color.primary),
        );
      case CtaButtonStyles.outlined:
        return ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(color.white),
          side: WidgetStatePropertyAll(
            BorderSide(color: color.primary, width: 2.0),
          ),
        );
    }
  }

  TextStyle _getTextStyle() {
    switch (style) {
      case CtaButtonStyles.solid:
        return typography.buttonText;
      case CtaButtonStyles.outlined:
        return typography.buttonText.copyWith(color: color.primary);
    }
  }
}
