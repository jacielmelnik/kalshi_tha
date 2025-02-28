import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi_tha/result/result_bloc.dart';

final bloc = ResultBloc();

void main() {
  test('calculates healthy result', () {
    ResultStatus result = bloc.calculateScore(
      annualIncome: 1000,
      monthlyCosts: 10,
    );

    expect(result, ResultStatus.healthy);
  });

  test('calculates average result', () {
    ResultStatus result = bloc.calculateScore(
      annualIncome: 1000,
      monthlyCosts: 30,
    );

    expect(result, ResultStatus.average);
  });

  test('calculates unhealthy result', () {
    ResultStatus result = bloc.calculateScore(
      annualIncome: 1000,
      monthlyCosts: 80,
    );

    expect(result, ResultStatus.unhealthy);
  });
}
