import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'result_progress_bar_robot.dart';

void main() {
  testWidgets('ResultProgressBar renders correctly', (
    WidgetTester tester,
  ) async {
    final robot = ResultProgressBarRobot(tester);
    await robot.configure();

    robot.assertFindsCorrectAssets();
  });

  testWidgets('ResultProgressBar applies segment colors correctly', (
    WidgetTester tester,
  ) async {
    final robot = ResultProgressBarRobot(tester);
    await robot.configure(
      firstSegmentColor: Colors.green,
      secondSegmentColor: Colors.yellow,
      thirdSegmentColor: Colors.red,
    );
  });
}
