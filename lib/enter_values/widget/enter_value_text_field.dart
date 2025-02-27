import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kalshi_tha/constants.dart';
import 'package:kalshi_tha/theme/theme_constants.dart';

class EnterValueTextField extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final Function(String) onSubmited;

  final FocusNode? focusNode;

  const EnterValueTextField({
    super.key,
    required this.title,
    required this.controller,
    required this.onSubmited,
    this.focusNode,
  });

  @override
  State<EnterValueTextField> createState() => _EnterValueTextFieldState();
}

class _EnterValueTextFieldState extends State<EnterValueTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(widget.title, style: typography.description)],
        ),
        spacing.v4,
        TextField(
          decoration: InputDecoration(
            prefixIcon: Row(
              children: [SizedBox(width: 16.0), Image.asset(dolarSignIcon)],
            ),
            prefixIconConstraints: BoxConstraints.tight(Size(44.0, 24.0)),
            enabledBorder: OutlineInputBorder(
              borderRadius: border.all4,
              borderSide: BorderSide(color: color.lightGray),
            ),
            border: OutlineInputBorder(borderRadius: border.all4),
          ),
          style: typography.headingSmall.copyWith(
            fontSize: 24.0,
            color: color.darkGray,
          ),
          controller: widget.controller,
          focusNode: widget.focusNode,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          onChanged: (value) {
            widget.controller.text = formatValue(value);
          },
          onSubmitted: widget.onSubmited,
        ),
      ],
    );
  }

  //This function will format the String value to allow ponctuation,
  //separating with a ',' blocs of 3 numbers.
  //Ex.: '100', '1,000', '10,000', '100,000', '1,000,000'.
  String formatValue(String value) {
    if (value.length > 3) {
      int iterations = (value.length / 3).truncate();
      int index = value.length;
      String newValue = '';

      for (int i = iterations; i > 0; i--) {
        newValue = ',${value.substring(index - 3, index)}$newValue';
        index -= 3;
      }

      newValue =
          (index == 0)
              ? newValue.replaceFirst(',', '')
              : '${value.substring(0, index)}$newValue';

      return newValue;
    }
    return value;
  }
}
