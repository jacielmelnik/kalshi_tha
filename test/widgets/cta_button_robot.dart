import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi_tha/theme/theme_constants.dart';
import 'package:kalshi_tha/widgets/cta_button.dart';

import '../commons.dart';

const buttonText = 'Button text';

class CtaButtonRobot extends RobotTest {
  bool buttonPressed = false;

  CtaButtonRobot(super.tester);

  Future<void> configure({
    CtaButtonStyles? style,
    Function()? onPressed,
  }) async {
    await widgetSetup(
      Scaffold(
        body: CtaButton(
          buttonText: buttonText,
          onPressed: onPressed ?? () {},
          style: style ?? CtaButtonStyles.solid,
        ),
      ),
    );
  }

  void assertFindsCorrectAssetsForSolidStyle() {
    expect(find.byType(ElevatedButton), findsOneWidget);

    expect(find.text(buttonText), findsOneWidget);

    final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    expect(button.style!.backgroundColor!.resolve({}), color.primary);

    final textWidget = tester.widget<Text>(find.byType(Text));
    final expectedTextStyle = typography.buttonText;
    expect(textWidget.style, expectedTextStyle);

    final buttonHeight = tester.getSize(find.byType(ElevatedButton)).height;
    expect(buttonHeight, 56.0);
  }

  void assertFindsOutlinedStyleButton() {
    final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    expect(button.style!.backgroundColor!.resolve({}), color.white);

    expect(
      button.style!.side!.resolve({}),
      BorderSide(color: color.primary, width: 2.0),
    );

    final textWidget = tester.widget<Text>(find.byType(Text));
    final expectedTextStyle = typography.buttonText.copyWith(
      color: color.primary,
    );
    expect(textWidget.style, expectedTextStyle);

    final buttonHeight = tester.getSize(find.byType(ElevatedButton)).height;
    expect(buttonHeight, 56.0);
  }

  Future<void> assertDidCallOnPressedButton() async {
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(buttonPressed, true);
  }
}
