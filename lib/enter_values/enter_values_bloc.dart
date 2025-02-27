import 'package:flutter/material.dart';
import 'package:kalshi_tha/result/result_screen.dart';

class EnterValuesBloc {
  void didTapContinueButton({
    required BuildContext context,
    required String annualIncome,
    required String monthlyCosts,
  }) {
    int income = int.parse(annualIncome.replaceAll(',', ''));
    int costs = int.parse(monthlyCosts.replaceAll(',', ''));

    _navigateToResult(context, income, costs);
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
