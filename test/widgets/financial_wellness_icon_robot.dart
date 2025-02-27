import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi_tha/constants.dart';
import 'package:kalshi_tha/widgets/financial_wellness_icon.dart';

import '../commons.dart';

class FinancialWellnessIconRobot extends RobotTest {
  FinancialWellnessIconRobot(super.tester);

  Future<void> configure() async {
    await widgetSetup(Scaffold(body: FinancialWellnessIcon()));
  }

  void findsCorrectAssets() {
    expect(find.byType(Image), findsOneWidget);
    final imageWidget = tester.widget<Image>(find.byType(Image));
    expect(imageWidget.image, AssetImage(financialWellnessIcon));
    expect(imageWidget.width, 48.0);
    expect(imageWidget.height, 48.0);
  }
}
