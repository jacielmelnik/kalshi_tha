import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kalshi_tha/constants.dart';
import 'package:kalshi_tha/theme/theme_constants.dart';

class EnterValueTextField extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final Function(String) onSubmited;

  const EnterValueTextField({
    super.key,
    required this.title,
    required this.controller,
    required this.onSubmited,
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
        SizedBox(height: 4.0),
        TextField(
          decoration: InputDecoration(
            prefixIcon: Row(
              children: [SizedBox(width: 16.0), Image.asset(dolarSignIcon)],
            ),
            prefixIconConstraints: BoxConstraints.tight(Size(44.0, 24.0)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              borderSide: BorderSide(color: Color(0xFFE9EEF2)),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
            ),
          ),
          style: typography.headingSmall.copyWith(
            fontSize: 24.0,
            color: Color(0xFF4D6475),
          ),
          controller: widget.controller,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          onChanged: (value) {
            formatValue(value);
          },
          onSubmitted: widget.onSubmited,
        ),
      ],
    );
  }

  void formatValue(String value) {
    if (value.length > 3) {
      int iterations = (value.length / 3).truncate();
      String newValue = '';
      int index = value.length;

      for (int i = iterations; i > 0; i--) {
        newValue =
            ',${widget.controller.text.substring(index - 3, index)}$newValue';
        index -= 3;
      }

      if (index == 0) {
        newValue = newValue.replaceFirst(',', '');
      } else {
        newValue = '${widget.controller.text.substring(0, index)}$newValue';
      }

      widget.controller.text = newValue;
    }
  }
}
