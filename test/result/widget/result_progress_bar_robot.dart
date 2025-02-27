import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi_tha/result/widget/result_progress_bar.dart';

import '../../commons.dart';

class ResultProgressBarRobot extends RobotTest {
  ResultProgressBarRobot(super.tester);

  Future<void> configure({
    Color? firstSegmentColor,
    Color? secondSegmentColor,
    Color? thirdSegmentColor,
  }) async {
    await widgetSetup(
      Scaffold(
        body: ResultProgressBar(
          widgetSize: 300.0,
          firstSegmentColor: firstSegmentColor,
          secondSegmentColor: secondSegmentColor,
          thirdSegmentColor: thirdSegmentColor,
        ),
      ),
    );
  }

  void assertFindsCorrectAssets() {
    expect(find.byType(ResultProgressBar), findsOneWidget);
  }

  void assertFindsCorrectColorsForSegments() {
    final firstSegment = tester.widget<Container>(find.byType(Container).at(2));
    expect(firstSegment.color, Colors.green);

    final secondSegment = tester.widget<Container>(
      find.byType(Container).at(1),
    );
    expect(secondSegment.color, Colors.yellow);

    final thirdSegment = tester.widget<Container>(find.byType(Container).at(0));
    expect(thirdSegment.color, Colors.red);
  }
}
