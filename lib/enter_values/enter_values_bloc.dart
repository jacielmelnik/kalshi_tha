import 'package:flutter/material.dart';
import 'package:kalshi_tha/result/result_screen.dart';

class EnterValuesBloc {
  void didTapContinueButton(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const ResultScreen(),
      ),
    );
  }
}
