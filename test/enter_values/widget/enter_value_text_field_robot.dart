import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi_tha/enter_values/widget/enter_value_text_field.dart';
import 'package:kalshi_tha/theme/theme_constants.dart';

import '../../commons.dart';

const buttonText = 'Button text';
const titleText = 'Enter Value';

class EnterValueTextFieldRobot extends RobotTest {
  bool hasChanged = false;
  bool wasSubmitted = false;

  final controller = TextEditingController();

  EnterValueTextFieldRobot(super.tester);

  Future<void> configure({
    Function(String)? onChanged,
    Function(String)? onSubmited,
    FocusNode? focusNode,
  }) async {
    await widgetSetup(
      Scaffold(
        body: EnterValueTextField(
          title: titleText,
          controller: controller,
          focusNode: focusNode,
          onChanged: onChanged ?? (_) {},
          onSubmited: onSubmited ?? (_) {},
        ),
      ),
    );
  }

  void assertFindsCorrectAssets() {
    expect(find.byType(TextField), findsOneWidget);
    expect(find.text(titleText), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);

    final textField = tester.widget<TextField>(find.byType(TextField));
    expect(textField.keyboardType, TextInputType.number);

    expect(textField.inputFormatters, [FilteringTextInputFormatter.digitsOnly]);

    expect(textField.style!.fontSize, 24.0);
    expect(textField.style!.color, color.darkGray);
  }

  Future<void> assertAttributeMethodTriggers() async {
    await tester.enterText(find.byType(TextField), '123');
    await tester.pump();

    expect(hasChanged, true);

    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    expect(wasSubmitted, true);
  }

  Future<void> assertOnlyDigitsAreRegistered() async {
    await tester.enterText(find.byType(TextField), 'abc');
    await tester.pump();
    expect(controller.text, '');

    await tester.enterText(find.byType(TextField), '123');
    await tester.pump();
    expect(controller.text, '123');
  }
}
