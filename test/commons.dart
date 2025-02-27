import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

abstract class RobotTest {
  final WidgetTester tester;

  RobotTest(this.tester);

  Future<void> widgetSetup(Widget widget) async {
    await tester.pumpWidget(MaterialApp(home: widget));
  }
}
