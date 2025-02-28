import 'package:flutter_test/flutter_test.dart';

import 'enter_values_screen_robot.dart';

void main() {
  testWidgets('EnterValuesScreen renders correctly', (
    WidgetTester tester,
  ) async {
    final robot = EnterValuesScreenRobot(tester);
    await robot.configure();

    robot.assertFindsCorrectAssets();
  });

  testWidgets('correctly formats entered value with commas', (
    WidgetTester tester,
  ) async {
    final robot = EnterValuesScreenRobot(tester);
    await robot.configure();

    await robot.fillAnnualIncome(value: '1000');
    await tester.pumpAndSettle();

    robot.assertAnnualIncomeTextFieldIsFormatted();

    await robot.fillMonthlyCosts(value: '1000000');
    await tester.pumpAndSettle();

    robot.assertMonthlyCostsTextFieldIsFormatted();
  });

  testWidgets('focuses to monthly costs field after entering annual income', (
    WidgetTester tester,
  ) async {
    final robot = EnterValuesScreenRobot(tester);
    await robot.configure();

    await robot.fillAnnualIncome();
    await robot.tapDoneButton();

    robot.assertFocusMovedToMonthlyCosts();
  });

  group('SnackBar', () {
    testWidgets('shows snackbar when annual income is missing', (
      WidgetTester tester,
    ) async {
      final robot = EnterValuesScreenRobot(tester);
      await robot.configure();

      await robot.tapContinueButton();

      robot.assertSnackBarIsShown();
      robot.assertSnackBarAnnualIncomeMessageIsShown();
    });

    testWidgets('shows snackbar when monthly costs is missing', (
      WidgetTester tester,
    ) async {
      final robot = EnterValuesScreenRobot(tester);
      await robot.configure();

      await robot.fillAnnualIncome();
      await robot.tapContinueButton();

      robot.assertSnackBarIsShown();
      robot.assertSnackBarMonthlyCostsMessageIsShown();
    });

    testWidgets(
      'do not show snackbar when annual income and monthly costs are filled',
      (WidgetTester tester) async {
        final robot = EnterValuesScreenRobot(tester);
        await robot.configure();

        await robot.fillAnnualIncome();
        await robot.fillMonthlyCosts();
        await robot.tapContinueButton();

        robot.assertSnackBarIsNotShown();
      },
    );
  });
}
