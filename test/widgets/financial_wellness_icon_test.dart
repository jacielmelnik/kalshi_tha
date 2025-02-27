import 'package:flutter_test/flutter_test.dart';
import 'financial_wellness_icon_robot.dart';

void main() {
  testWidgets('FinancialWellnessIcon renders correctly', (
    WidgetTester tester,
  ) async {
    final robot = FinancialWellnessIconRobot(tester);
    await robot.configure();

    robot.findsCorrectAssets();
  });
}
