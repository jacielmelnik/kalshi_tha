import 'package:flutter/material.dart';
import 'package:kalshi_tha/result/result_screen.dart';

class EnterValuesBloc {
  void didTapContinueButton({
    required BuildContext context,
    required String annualIncome,
    required String monthlyCosts,
  }) {
    int income = _convertStringToInt(annualIncome);
    int costs = _convertStringToInt(monthlyCosts);

    _navigateToResult(context, income, costs);
  }

  int _convertStringToInt(String value) {
    return int.parse(value.replaceAll(',', ''));
  }

  void _navigateToResult(
    BuildContext context,
    int annualIncome,
    int monthlyCosts,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder:
            (BuildContext context) => ResultScreen(
              annualIncome: annualIncome,
              monthlyCosts: monthlyCosts,
            ),
      ),
    );
  }
}
