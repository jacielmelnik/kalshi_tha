import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi_tha/widgets/cta_button.dart';

import 'cta_button_robot.dart';

void main() {
  testWidgets('CtaButton renders correctly', (WidgetTester tester) async {
    final robot = CtaButtonRobot(tester);
    await robot.configure();

    robot.assertFindsCorrectAssetsForSolidStyle();
  });

  testWidgets('CtaButton has correct outlined style', (
    WidgetTester tester,
  ) async {
    final robot = CtaButtonRobot(tester);
    await robot.configure(style: CtaButtonStyles.outlined);

    robot.assertFindsOutlinedStyleButton();
  });

  testWidgets('CtaButton triggers onPressed when clicked', (
    WidgetTester tester,
  ) async {
    final robot = CtaButtonRobot(tester);
    await robot.configure(
      onPressed: () {
        robot.buttonPressed = true;
      },
    );

    await robot.assertDidCallOnPressedButton();
  });
}
