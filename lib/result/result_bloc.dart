enum ResultStatus { healthy, average, unhealthy }

class ResultBloc {
  ResultBloc();

  ResultStatus calculateScore({
    required int annualIncome,
    required int monthlyCosts,
  }) {
    double tax = annualIncome * 0.08;
    double annualCosts = monthlyCosts * 12;
    double totalCosts = tax + annualCosts;
    double result = (totalCosts / annualIncome);

    switch (result) {
      case > .75:
        return ResultStatus.unhealthy;
      case > .25:
        return ResultStatus.average;
      default:
        return ResultStatus.healthy;
    }
  }
}
