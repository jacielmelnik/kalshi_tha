import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi_tha/enter_values/enter_values_bloc.dart';

import 'enter_values_bloc_robot.dart';

void main() {
  testWidgets(
    'didTapContinueButton correctly navigates with converted values',
    (WidgetTester tester) async {
      final robot = EnterValuesBlocRobot(tester);
      await robot.configure();

      await robot.assertNavigationWithParametersSucessfull();
    },
  );

  testWidgets(
    'didTapContinueButton do not navigate with wrong annual income value',
    (WidgetTester tester) async {
      final robot = EnterValuesBlocRobot(tester);
      final bloc = EnterValuesBloc();

      robot.assertNavigationWithInvalidAnnualIncomeFails(bloc);
    },
  );

  testWidgets(
    'didTapContinueButton do not navigate with wrong monthly cost value',
    (WidgetTester tester) async {
      final robot = EnterValuesBlocRobot(tester);
      final bloc = EnterValuesBloc();

      robot.assertNavigationWithInvalidMonthlyCostsFails(bloc);
    },
  );
}
