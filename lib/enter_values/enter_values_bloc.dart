import 'package:flutter/material.dart';
import 'package:kalshi_tha/result/result_screen.dart';
import 'package:kalshi_tha/shared/formatter.dart';

class EnterValuesBloc {
  void didTapContinueButton(
    BuildContext context, {
    required String annualIncome,
    required String monthlyCosts,
  }) {
    assert(Formatter.canParseString(annualIncome));
    assert(Formatter.canParseString(monthlyCosts));

    int income = Formatter.parseString(annualIncome);
    int costs = Formatter.parseString(monthlyCosts);

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
        settings: RouteSettings(name: '/resultScreen'),
      ),
    );
  }
}
