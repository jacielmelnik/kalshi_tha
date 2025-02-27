import 'package:flutter_test/flutter_test.dart';

import 'disclaimer_footer_robot.dart';

void main() {
  testWidgets('DisclaimerFooter renders correctly', (
    WidgetTester tester,
  ) async {
    final robot = DisclaimerFooterRobot(tester);
    await robot.configure();

    robot.assertFindsCorrectAssets();
  });
}
