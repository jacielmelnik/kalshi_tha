import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi_tha/enter_values/enter_values_bloc.dart';
import 'package:kalshi_tha/result/result_screen.dart';
import 'package:mocktail/mocktail.dart';

import '../commons.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockRoute extends Mock implements Route {}

class MockContext extends Mock implements BuildContext {}

const validAnnualIncome = '100,000';
const invalidAnnualIncome = 'asd';

const validMonthlyCosts = '2,500';
const invalidMonthlyCosts = 'sdf';

class EnterValuesBlocRobot extends RobotTest {
  final mockNavigatorObserver = MockNavigatorObserver();

  EnterValuesBlocRobot(super.tester);

  Future<void> configure({bool withInvalidValues = false}) async {
    registerFallbackValue(MockRoute());

    await tester.pumpWidget(
      MaterialApp(
        navigatorObservers: [mockNavigatorObserver],
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  final bloc = EnterValuesBloc();
                  bloc.didTapContinueButton(
                    context,
                    annualIncome:
                        withInvalidValues
                            ? invalidAnnualIncome
                            : validAnnualIncome,
                    monthlyCosts: validMonthlyCosts,
                  );
                },
                child: Text('Continue'),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> assertNavigationWithParametersSucessfull() async {
    final context = tester.element(find.byType(MaterialApp));

    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();

    final routes =
        verify(
          () => mockNavigatorObserver.didPush(captureAny(), captureAny()),
        ).captured;
    final route = routes.firstWhere((element) {
      return element?.settings.name == '/resultScreen';
    }, orElse: () => null);
    expect(route, isA<MaterialPageRoute<void>>());

    final MaterialPageRoute<void> materialPageRoute =
        route as MaterialPageRoute<void>;
    final ResultScreen resultScreen =
        materialPageRoute.builder(context) as ResultScreen;

    expect(resultScreen.annualIncome, 100000);
    expect(resultScreen.monthlyCosts, 2500);
  }

  void assertNavigationWithInvalidAnnualIncomeFails(
    EnterValuesBloc bloc,
  ) async {
    expect(() {
      bloc.didTapContinueButton(
        MockContext(),
        annualIncome: invalidAnnualIncome,
        monthlyCosts: validMonthlyCosts,
      );
    }, throwsAssertionError);
  }

  void assertNavigationWithInvalidMonthlyCostsFails(
    EnterValuesBloc bloc,
  ) async {
    expect(() {
      bloc.didTapContinueButton(
        MockContext(),
        annualIncome: validAnnualIncome,
        monthlyCosts: invalidMonthlyCosts,
      );
    }, throwsAssertionError);
  }
}
