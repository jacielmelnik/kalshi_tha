import 'package:flutter_test/flutter_test.dart';

import 'enter_value_text_field_robot.dart';

void main() {
  testWidgets('EnterValueTextField renders correctly', (
    WidgetTester tester,
  ) async {
    final robot = EnterValueTextFieldRobot(tester);
    await robot.configure();

    robot.assertFindsCorrectAssets();
  });

  testWidgets('EnterValueTextField triggers onChanged and onSubmitted', (
    WidgetTester tester,
  ) async {
    final robot = EnterValueTextFieldRobot(tester);
    await robot.configure(
      onChanged: (text) {
        robot.hasChanged = true;
      },
      onSubmited: (text) {
        robot.wasSubmitted = true;
      },
    );

    await robot.assertAttributeMethodTriggers();
  });

  testWidgets('EnterValueTextField accepts only digits', (
    WidgetTester tester,
  ) async {
    final robot = EnterValueTextFieldRobot(tester);
    await robot.configure();

    await robot.assertOnlyDigitsAreRegistered();
  });
}
