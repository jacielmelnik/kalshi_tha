import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi_tha/constants.dart';
import 'package:kalshi_tha/theme/theme_constants.dart';
import 'package:kalshi_tha/widgets/disclaimer_footer.dart';

import '../commons.dart';

class DisclaimerFooterRobot extends RobotTest {
  DisclaimerFooterRobot(super.tester);

  Future<void> configure() async {
    await widgetSetup(Scaffold(body: DisclaimerFooter()));
  }

  void assertFindsCorrectAssets() {
    final imageWidget = tester.widget<Image>(find.byType(Image));
    expect(imageWidget.image, AssetImage(lockIcon));

    expect(find.text(footerText), findsOneWidget);

    final textWidget = tester.widget<Text>(find.byType(Text));
    expect(textWidget.textAlign, TextAlign.center);
    expect(textWidget.style, typography.description);
  }
}
