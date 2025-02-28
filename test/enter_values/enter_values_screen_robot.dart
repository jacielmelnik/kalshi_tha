import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi_tha/enter_values/enter_values_constants.dart';
import 'package:kalshi_tha/enter_values/enter_values_screen.dart';
import 'package:kalshi_tha/enter_values/widget/enter_value_text_field.dart';
import 'package:kalshi_tha/widgets/cta_button.dart';
import 'package:kalshi_tha/widgets/disclaimer_footer.dart';
import 'package:kalshi_tha/widgets/financial_wellness_icon.dart';

import '../commons.dart';

const defaultAnnualIncome = '100,000';
const defaultMonthlyCosts = '1,000';

class EnterValuesScreenRobot extends RobotTest {
  EnterValuesScreenRobot(super.tester);

  Future<void> configure() async {
    await widgetSetup(Scaffold(body: EnterValuesScreen()));
  }

  void assertFindsCorrectAssets() {
    expect(find.byType(CtaButton), findsOneWidget);
    expect(find.byType(FinancialWellnessIcon), findsOneWidget);
    expect(find.byType(DisclaimerFooter), findsOneWidget);
    expect(find.text('Continue'), findsOneWidget);
  }

  Future<void> tapContinueButton() async {
    await tester.tap(find.text('Continue'));
    await tester.pump();
  }

  Future<void> tapDoneButton() async {
    await tester.testTextInput.receiveAction(TextInputAction.done);
  }

  Future<void> fillAnnualIncome({String value = defaultAnnualIncome}) async {
    await tester.enterText(find.byType(EnterValueTextField).at(0), value);
    await tester.pump();
  }

  Future<void> fillMonthlyCosts({String value = defaultMonthlyCosts}) async {
    await tester.enterText(find.byType(EnterValueTextField).at(1), value);
    await tester.pump();
  }

  void assertAnnualIncomeTextFieldIsFormatted() {
    expect(find.text(defaultMonthlyCosts), findsOneWidget);
  }

  void assertMonthlyCostsTextFieldIsFormatted() {
    expect(find.text('1,000,000'), findsOneWidget);
  }

  void assertSnackBarIsShown() {
    expect(find.byType(SnackBar), findsOneWidget);
  }

  void assertSnackBarAnnualIncomeMessageIsShown() {
    expect(find.text(annualIncomeMissingSnackbarMessage), findsOneWidget);
  }

  void assertSnackBarMonthlyCostsMessageIsShown() {
    expect(find.text(monthlyCostsMissingSnackbarMessage), findsOneWidget);
  }

  void assertSnackBarIsNotShown() {
    expect(find.byType(SnackBar), findsNothing);
    expect(find.text(annualIncomeMissingSnackbarMessage), findsNothing);
    expect(find.text(monthlyCostsMissingSnackbarMessage), findsNothing);
  }

  void assertFocusMovedToMonthlyCosts() async {
    EnterValueTextField textField2 =
        find.byType(EnterValueTextField).at(1).evaluate().first.widget
            as EnterValueTextField;
    expect(textField2.focusNode!.hasFocus, true);
  }
}
